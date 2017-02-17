![TitlePhoto](Images/TitlePhoto.png)

Visa Travel to the United States
================================

In 2015, the United States was the [second most](https://en.wikipedia.org/wiki/World_Tourism_rankings) visited country in the world. Where do all of these tourists from and what
are their reasons for travelling to the United States?

In this article we will analyze a dataset from [travel.state.gov](travel.state.gov) looking at non-immigrant visa figures from 1997 through 2015. This research article illustrates 
how publicly available data from travel.state.gov can be easily loaded into the non-relational [Axibase Time Series Database (ATSD)](http://axibase.com/products/axibase-time-series-database/)
for interactive analysis and graphical representation of raw data collected by government organizations. Additionally, this article illustrates some of the capabilities of [redash](https://redash.io/)
(an open source data visualization tool), as well as instructions on how to install your own ATSD instance and populate it with the raw data.

### U.S. Visa Dataset
---------------------

Let's take a look at the dataset from [travel.state.gov](travel.state.gov), which can be accessed in Excel by clicking [here](https://travel.state.gov/content/dam/visas/Statistics/Non-Immigrant-Statistics/NIVDetailTables/FYs97-15_NIVDetailTable.xls).
 
This dataset contains yearly totals for visas issued from 1997 through 2015. This dataset contains information on non-immigrant visas. Totals were collected for 84 different visas types. You can find the complete list of all the visa 
types include in this dataset [here](Resources/visalist.txt).

Visa figures were collected for 200 countries, 7 continents, and for unknown national origins. You can find a complete list of all the countries included in this dataset [here](Resources/countrylist.txt).
You can find descriptions of all visa types on the [U.S. Department of State](https://travel.state.gov/content/visas/en/general/all-visa-categories.html) website.

It is much more convenient to interact with the data once it is loaded into a database. The [Axibase Time Series Database (ATSD)](http://axibase.com/products/axibase-time-series-database/) 
is a powerful tool when it comes to storing, analyzing, and visualizing datasets. We will use the following two aspects of ATSD to look into this dataset: interactive graphs 
from [Chart Lab](/ChartLabIntro/README.md) and tabular outputs from analytical [SQL queries](https://github.com/axibase/atsd-docs/blob/master/api/sql/README.md#overview).
You can load the dataset into your ATSD instance by following the steps provided at the [end of the article](#action-items). 
 
### Immigration by Country, Continent, and Visa Type
----------------------------------------------------

Let's begin by taking a look at immigration by country. The below image shows an output for H-1B visas, which are temporary work visas for workers in speciality occupations, issued
to Indian nationals from 1997 to 2015, which grew from **31,684** in 1997 to **119,952** in 2015. You can toggle between different countries in the first dropdown, and by visa type
in the second dropdown.

![Figure1](Images/Figure1.png)

You can explore this portal by clicking on the below button:

[![](Images/button.png)](https://apps.axibase.com/chartlab/8c9bb9cc)

The next image below an output for H-1B visas issued to the continent of Asia as a whole. We can see that the number of visas issued increased from **47,726** in 1997 to **149,788**
in 2015. you can toggle between different continents in the first dropdown, and by visa type in the second dropdown.
 
![Figure2](Images/Figure2.png)

You can explore this portal by clicking on the below button: 

[![](Images/button.png)](https://apps.axibase.com/chartlab/3c55ada0)

### Delving in Further to U.S. Visas
------------------------------------

Countries with the greatest number of O-1 visa, which is for exceptional abilities. The brain-drain from other countries has steadily grown over the years, especially from the U.K., 
which in 2015 had 2,630 O-1 visas issued.

![Figure3](Images/Figure3.png)

You can explore this portal by clicking on the below button: 

[![](Images/button.png)](https://apps.axibase.com/chartlab/3a320d35)

Below is an image for the total visa issued for the countries included in Trump administration's [travel ban](https://www.washingtonpost.com/graphics/national/immigration-order-explainer/)
(which has since been lifted). These countries included Iran, Iraq, Libya, Somalia, Sudan, Syria, and Yemen.     

![Figure4](Images/Figure4.png)

You can explore this portal by clicking on the below button:

[![](Images/button.png)](https://apps.axibase.com/chartlab/16c6e667/3/)

This below figure shows how many dependents come with each primary visa holder. Saudi Arabian visa holders are currently bringing in the most dependents.

![Figure5](Images/Figure5.png)

You can explore this portal by clicking on the below button: 

[![](Images/button.png)](https://apps.axibase.com/chartlab/1bc51064/2/)

### SQL Queries and Data Visualization with Redash
--------------------------------------------------

In addition to outputs from Chart Lab, ATSD is also capable to perform [SQL queries](https://github.com/axibase/atsd-docs/blob/master/api/sql/README.md#overview), 
which can be used to search for specific information contained in this dataset. You can read more about our SQL syntax [here](https://github.com/axibase/atsd-docs/blob/master/api/sql/README.md#syntax).

The query below shows the number of B-1 and B-2 visas totals for a handful of countries, with the numbers issued for 2005 and 2010 totals, 10 year percentage change, as well as a 
compounded annual growth rate (CAGR). 

```sql 
SELECT tags.country, first(value) AS "2005", 
  last(value) AS "2015", 
  (last(value)/first(value)-1)*100 AS "10 Year Change, %", 
  (POWER(last(value)/first(value), 1/count(value))-1)*100 AS "CAGR, %"
  FROM 'state.non-immigrant-visa' 
WHERE tags.visa_type = 'B-1,2'
  AND tags.country NOT LIKE '*Total*'
  AND LOOKUP('us-visa-waiver-program', tags.country) IS NULL
  AND datetime >= '2005-01-01T00:00:00Z'
GROUP BY tags.country
  --HAVING last(value) > 10000 AND first(value) > 10000
ORDER BY 3 DESC
  LIMIT 20
```

```ls
| tags.country        | 2005      | 2015       | 10 Year Change, %  | CAGR, % | 
|---------------------|-----------|------------|--------------------|---------| 
| China - mainland    | 226722.0  | 2227670.0  | 882.6              | 23.1    | 
| Brazil              | 30468.0   | 870008.0   | 2755.5             | 35.6    | 
| India               | 193218.0  | 553385.0   | 186.4              | 10.0    | 
| Colombia            | 155586.0  | 345233.0   | 121.9              | 7.5     | 
| Argentina           | 76155.0   | 240115.0   | 215.3              | 11.0    | 
| Venezuela           | 82050.0   | 223854.0   | 172.8              | 9.6     | 
| Ecuador             | 39927.0   | 150458.0   | 276.8              | 12.8    | 
| Israel              | 102073.0  | 137439.0   | 34.6               | 2.7     | 
| Nigeria             | 26077.0   | 136409.0   | 423.1              | 16.2    | 
| Russia              | 62213.0   | 122147.0   | 96.3               | 6.3     | 
| Peru                | 37929.0   | 97936.0    | 158.2              | 9.0     | 
| Saudi Arabia        | 9242.0    | 85303.0    | 823.0              | 22.4    | 
| Dominican Republic  | 51538.0   | 85140.0    | 65.2               | 4.7     | 
| Jamaica             | 37103.0   | 83483.0    | 125.0              | 7.7     | 
| Philippines         | 47368.0   | 83139.0    | 75.5               | 5.2     | 
| Poland              | 80777.0   | 81861.0    | 1.3                | 0.1     | 
| Vietnam             | 4334.0    | 80936.0    | 1767.5             | 30.5    | 
| Turkey              | 30390.0   | 78118.0    | 157.1              | 9.0     | 
| Pakistan            | 18894.0   | 62714.0    | 231.9              | 11.5    | 
| Costa Rica          | 35449.0   | 58139.0    | 64.0               | 4.6     | 
```

Total visa revenues (in millions of USD) for the state department at $160 per visa from 1997 to 2015:

```sql
SELECT date_format(time, 'yyyy') AS "year", sum(value) * 190 / power(10, 6) AS "Visa Fees, $M"
  FROM 'state.non-immigrant-visa' 
WHERE tags.visa_type = 'Grand Total' 
  AND tags.country NOT LIKE '*Total*' 
GROUP BY datetime
```

```ls
| year  | Visa Fees, $M | 
|-------|---------------| 
| 1997  | 1129.0        | 
| 1998  | 1104.7        | 
| 1999  | 1176.6        | 
| 2000  | 1356.9        | 
| 2001  | 1441.9        | 
| 2002  | 1096.2        | 
| 2003  | 927.5         | 
| 2004  | 959.3         | 
| 2005  | 1023.9        | 
| 2006  | 1108.9        | 
| 2007  | 1224.4        | 
| 2008  | 1253.0        | 
| 2009  | 1101.0        | 
| 2010  | 1217.3        | 
| 2011  | 1423.1        | 
| 2012  | 1696.1        | 
| 2013  | 1741.2        | 
| 2014  | 1887.2        | 
| 2015  | 2069.4        | 
```