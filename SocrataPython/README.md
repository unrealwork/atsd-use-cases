# Querying data.gov Datasets with Python and SQL

## Overview

In less than 5 minutes you will be able identify the top-10 contractors in the [New York State Solar Photovoltaic Incentive Program](https://www.nyserda.ny.gov/All-Programs/Programs/NY-Sun/Customers), by loading a [data.gov](https://catalog.data.gov/dataset/solar-photovoltaic-pv-incentive-program-completed-projects-by-city-and-contractor-beginnin) dataset into a python DataFrame.

The process should take less than **5 minutes**.

## Prerequisites

* [Docker](https://docs.docker.com/engine/installation/)

## Table of Contents

Download the [`docker-compose.yml`](docker-compose.yml) file:

```bash
  curl -o docker-compose.yml https://raw.githubusercontent.com/axibase/atsd-use-cases/master/SocrataPython/docker-compose.yml
```

Launch containers:

```bash
export C_USER=myuser; export C_PASSWORD=mypassword; export S_PATH=https://data.ny.gov/api/views/3pzs-2zsk; docker-compose pull && docker-compose up -d
```

Install [`atsd_client`](https://github.com/axibase/atsd-api-python) and `tabulate` modules:

```bash
  pip install atsd_client tabulate
```

Open python shell:

```bash
  python
```

Execute the query:

```python
import atsd_client
from atsd_client.services import SQLService

conn = atsd_client.connect_url('http://localhost:8088', 'myuser', 'mypassword')
sql = SQLService(conn)
q = """SELECT p.tags.contractor AS contractor,
        COUNT(p.value) AS project_count,
        ROUND(SUM(p.value)/1000, 0) AS total_gwh_annual_production,
        ROUND(SUM(c.value)/1000000, 1) AS total_cost_mln,
        ROUND(SUM(c.value)/SUM(p.value), 2) AS cost_per_kwh
       FROM expected_kwh_annual_production p
        JOIN project_cost c
       WHERE p.tags.contractor != 'Other'
        GROUP BY p.tags.contractor
       ORDER BY total_gwh_annual_production DESC
        LIMIT 10"""
df = sql.query(q)

from tabulate import tabulate
print(tabulate(df, headers='keys', tablefmt='psql'))
+----+---------------------------------------------+-----------------+-------------------------------+------------------+----------------+
|    | contractor                                  |   project_count |   total_gwh_annual_production |   total_cost_mln |   cost_per_kwh |
|----+---------------------------------------------+-----------------+-------------------------------+------------------+----------------|
|  0 | SolarCity(CS)                               |             344 |                         28347 |            130.3 |           4.6  |
|  1 | SunPower Capital LLC (E)                    |              55 |                         14525 |             63.1 |           4.34 |
|  2 | New York Light Energy                       |              16 |                          9194 |             37.8 |           4.11 |
|  3 | Monolith Solar Associates LLC(CS)           |              45 |                          8248 |             33.2 |           4.02 |
|  4 | SunRun Inc. (E)                             |             124 |                          7653 |             26.4 |           3.45 |
|  5 | Solar Liberty Energy Systems Inc. (CS)      |              61 |                          7219 |             30.9 |           4.28 |
|  6 | NRG Residential Solar Solutions LLC (E)(CS) |              65 |                          4270 |             14.6 |           3.41 |
|  7 | Sungevity Development LLC (E)               |              87 |                          3629 |             14.3 |           3.95 |
|  8 | Kilowatt Systems LLC                        |              53 |                          3627 |             12.4 |           3.43 |
|  9 | Best Energy Power (CS)                      |              14 |                          3290 |             12.9 |           3.91 |
+----+---------------------------------------------+-----------------+-------------------------------+------------------+----------------+
```
