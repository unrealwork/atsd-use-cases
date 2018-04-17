# The World Progress Scorecard: In-Depth Visualization with SQL and User-Defined Functions

![](images/wps-title.png)
[![](images/button-new.png)](https://trends.axibase.com/eb435d60)

### Introduction

The **World Progress Scorecard** is an aggregation of many statistics that are collected by various international agencies including the [World Bank](http://www.worldbank.org/) and [United Nations Statistical Division](https://unstats.un.org/home/) and retrieved from the [Federal Reserve Economic Research](https://fred.stlouisfed.org/) API. 

Open the **TRENDS** visualization above and use the drop-down menus to navigate between all countries which have recorded data, grouped in alphabetically ascending order. The observed metric may be changed using the right-most drop-down menu. The metrics tracked in the visualization are described in the table below:

|Metric Name |Description |
|------------|------------|
|adolescent_fertility_rate_by_country | Recorded births by women aged 15-19 |
|age_dependency_ratio_by_country | Population aged 0-14 or 65+ |
|crude_birth_rate_by_country| Recorded births by women aged 15-65 per 100,000 members of a population|
|fertility_rate_total_by_country|Recorded births by women aged 15-65 per 100,000 women|
|infant_mortality_rate_by_country| Recorded deaths of infants under 1 year old per 1000 live births|
|life_expectancy_at_birth_by_country|Number of years a newborn is predicted to live given constant mortality figures|
|population_total_by_country| Recorded number of people living in a given country|

For detailed information about using the **TRENDS** service, read this [guide](/../master/how-to/shared/trends.md).

### Visualization

The visualizations in the chart above demonstrate a [user-defined function](/../master/how-to/shared/trends.md#user-defined-functions) which sets the year 1990 as the baseline using the [`fred.js`](https://apps-chartlab.axibase.com/portal/resource/scripts/fred.js) library. Using the `PercentChangeFromYearAgo` function instead, creates the visualization below. Open the **TRENDS** interface and explore the data using the same drop-down menus to navigate between countries and metrics.

![](images/wps-1.png)
[![](images/button-new.png)](https://trends.axibase.com/5ce2f40e#)

Axibase [Charts API](https://axibase.com/products/axibase-time-series-database/visualization/widgets/) uses a simple syntax with robust functionality. The underlying mechanics of the `PercentChangeFromYearAgo` function are shown here:

```
value = var v = value('cpi'); var p = value('prev_cpi'); if(p!=null && v!=null) return (v / p - 1) * 100
```

To implement this function, the following syntax is used:

```sql
value = fred.PercentChangeFromYearAgo('raw')
```

Open the **TRENDS** visualization and use any of the supported user-defined functions from the [`fred.js` library](/../how-to/shared/trends.md#fred-library).

### SQL Queries

Although a non-relational database, ATSD supports an SQL-like feature called [SQL Console](https://github.com/axibase/atsd/tree/master/sql#overview). 
