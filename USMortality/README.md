![TitlePhoto](Images/TitlePhoto.png)

Knocking on Heaven's Door - Computing U.S. Mortality Statistics
===============================================================

### Introduction
----------------

Death. Along with taxes, it is one of the few certainties in life. While we all will meet our end some day, that end is becoming farther and farther away and the risk of death is decreasing.
According to [infoplease.com](http://www.infoplease.com/ipa/A0005148.html), life expectancy from 1935 to 2010 for both sexes in the U.S. increased from 61.7 to 78.7 years. 
As reported by the [Center for Disease Control and Prevention (CDC)](http://www.cdc.gov/nchs/data/databriefs/db88.htm#x2013;2010%3C/a%3E>), the crude death rate in the United States fell from 1,094.5 to 798.7 deaths per 100,000 people from 1935 to 2010, translating to 
a 27% decrease. However, the population of the U.S. as a whole was getting older during this time period. When this affect of aging was removed from calculation, the CDC estimates that the age
adjusted **risk of dying dropped by 60 percent from 1935 to 2010**. 
 
The death rate for the 1 to 4 years of age group dropped by **94 percent** from 1935 to 2010.

The death rate for the 65 to 74 years of age group dropped by **62 percent** from 1935 to 2010.

Below is an image showcasing the percent change form 1935 to 2010 in death rates by age in the U.S. from the [CDC](http://www.cdc.gov/nchs/data/databriefs/db88_fig3.png).

![Figure 1](Images/Figure1.png)

In this article we will look at weekly death total statistics collected for over 100 U.S. cities for over 50 years. We will begin by walking through Axibase's SQL query language capabilities to help make sense 
and digest all of this information on death in the United States. We will next incorporate population figures to calculate mortality rates for each individual city. As icing on the cake, we 
will explore additional datasets to see if there are any correlations between their behavior and that of our computed mortality rates.  

### Death Statistics for 122 U.S. Cities
----------------------------------------

Let's take a look at the dataset **Deaths in 122 U.S. cities - 1962-2016. 122 Cities Mortality Reporting System** from data.gov.

This dataset can be found here: [https://catalog.data.gov/dataset/deaths-in-122-u-s-cities-1962-2016-122-cities-mortality-reporting-system](https://catalog.data.gov/dataset/deaths-in-122-u-s-cities-1962-2016-122-cities-mortality-reporting-system)

This file contains data for the weekly death totals collected from 1962 to 2016 in 122 U.S. cities. The system was retired on October 6th, 2016. While the system was running, the vital statistics
offices of these cities across the United States reported the total number of death certificates processed and the number of those for which pneumonia or influenza was listed as the underlying 
or contributing cause of death by age group. Deaths from under the age of 1 year are not included in this dataset. Deaths in this dataset are split into the following categories:

* 1 - 24 years (all causes of death)
* 25 - 44 years (all causes of death)
* 45 - 64 years (all causes of death)
* 65 + years (all causes of death)
* All deaths
* Pneumonia and influenza deaths

In the [Appendix](https://github.com/axibase/atsd-use-cases/blob/master/USMortality/README.md#appendix-death-statistics-city-list) of this article, you can can find a complete list of the cities (with their corresponding state) included in this dataset.

Deaths can be grouped by geographic region, all of which are shown below.

1 - Connecticut (CT), Massachusetts (MA), Rhode Island (RI)<br />
2 - Pennsylvania (PA), New Jersey (NJ), New York (NY)<br />
3 - Illinois (IL), Indiana (IN), Michigan (MI), Ohio (OH), Wisconsin (WI)<br />
4 - Iowa (IA), Kansas (KS), Minnesota (MN), Missouri (MO), Nebraska (NE)<br />
5 - Delaware (DE), District of Columbia (DC), Florida (FL), Georgia (GA), Maryland (MD), North Carolina (NC), Virginia (VA)<br />
6 - Alabama (AL), Kentucky (KY), Tennessee (TN)<br />
7 - Arkansas (AR), Louisiana (LA), Oklahoma (OK), Texas (TX)<br />
8 - Arizona (AZ), Colorado (CO), Idaho (ID), New Mexico (NM), Nevada (NV), Utah (UT)<br />
9 - California (CA), Hawaii (HI), Oregon (OR), Washington (WA)<br />

On the data.gov website, datasets can be downloaded as a CSV, RDF, JSON, or a XML file. This dataset can easily be parsed using the JSON job in Axibase.

### Axibase Time Series Database
--------------------------------

The processing of datasets using Axibase Time Series Database (ATSD) is straight forward.  Processing the same data with ATSD is less time consuming
because its collection tool has built-in heuristics to handle the format in which data.gov datasets are published, namely the Socrata Open Data Format.
When loading data for a particular dataset the collector uses Socrata metadata to understand the meaning of columns and automatically extract dates, times,
and categories from the data files. Besides, ATSD stores the data in the user's own database so that this public data can be combined with internal data
sources as well as mixed and matched across different datasets. Once you install ATSD, you **don't** have to:

* Add additional datasets from data.gov
* Manipulate and design table schema
* Provision an application server
* Write programs to parse and digest these types of files

Rather, you can configure a scheduled job to retrieve the file from the specified endpoint and have ATSD parse it according to pre-defined rules. Once you
have raw data in ATSD, creating and sharing reports with built-in widgets is fairly trivial using examples from [axibase.com](http://axibase.com/products/axibase-time-series-database/visualization/widgets/). 

Below is an output of the default configuration with all 122 U.S. cities parsed into the Axibase Time Series Database (ATSD).

![Figure 2](Images/Figure2.png)

Here you can explore the complete dataset for U.S. death totals:

[![](Images/button.png)](https://apps.axibase.com/chartlab/3d07088c)

The user has the ability to filter the data to their liking in the above instance. 

The following four filters are applied to the default portal:

* First dropdown: allows the user to view data by the specified metric. In the default portal, the user has the option of choosing death totals for 1 - 24 years (all causes of death),
  25 - 44 years (all causes of death), 45 - 64 years (all causes of death), 65 + years (all causes of death), all deaths, and pneumonia and influenza deaths. In the default instance above,
  1 - 24 years (all causes of death) is selected.
* Second dropdown: allows the user to filter between 122 U.S. cities. Again, the list of available cities is shown in the [Appendix](https://github.com/axibase/atsd-use-cases/blob/master/USMortality/README.md#appendix-death-statistics-city-list) . In the case above, all cities have been selected. 
* Third dropdown: allows the user to filter by geographic region (1,2,3,4,5,6,7,8, and 9 as mentioned above). In the above case, all regions have been selected.
* Fourth dropdown: allows the user to filter by state. In the above case, all states have been selected.

Below is an image when a city is selected from the the second dropdown. In this instance, Chicago (IL) has been selected for the 1 - 24 years age group. We can see that there was a quite 
the spike in the number of deaths in the city from March 2nd, 1991, to June 3, 1995.

![Figure 3](Images/Figure3.png)

The next image is again for Chicago, but this time filtered for the 25 - 44 years age group. Again, we can see that the was quite the spike in the number of deaths in the city, exactly matching
the period from the previous image, March 2nd, 1991, to June 3, 1995.  

![Figure 4](Images/Figure4.png)

Let us know filter for the remaining age groups (45 - 64 years, 65 + years, all deaths, and pneumonia and influenza deaths). We can see that these groups **do not** have the same spike in deaths 
as the previous groups, as shown below.

| 45 - 64 Years | 65 + Years  | 
| --- | --- |
| ![Figure 5](Images/Figure5.png) | ![Figure 6](Images/Figure6.png) |

| All Deaths | Pneumonia and Influenza Deaths | 
| --- | --- |
| ![Figure 7](Images/Figure7.png) | ![Figure 8](Images/Figure8.png) |

What was the reason for this drastic rise in deaths for people under the age of 44 between 1991 to 1995? 

You can observe this filtered portal for Chicago here:

[![](Images/button.png)](https://apps.axibase.com/chartlab/6cf6fe70)

Using the third dropdown, we are able to sort by geographic region. Theses regions are not part of any established system; the states were merely grouped together for this dataset to abe able
to visualize deaths according to geographic distribution. The regions were provided only with numbers and without any names. Below is how we chose to name these regions. This list will come
in handy later in the article when we delve into Axibase's SQL query language capabilities. 

1 = New-England<br />
2 = Mid-Atlantic<br />
3 = Midwest<br />
4 = Great-Plains<br />
5 = South-East<br />
6 = Appalachia<br />
7 = South-Central<br />
8 = Mountain<br />
9 = Pacific<br />

Let us sort by region 9 (pacific). Below is an output for this filtered instance. We can see that cities for California (CA), Hawaii (HI), Oregon (OR), Washington (WA) are all included in
this output. We can observe that up until the early to mid 2000's, the deaths in Los Angeles greatly outnumber those of any other city in the region. Recently, however, the deaths in Los Angeles
have drastically dropped off, and now seem to generally be on par with several other cities in the region. Why has there been such a drastic drop off in deaths recently in Los Angeles? 

![Figure 9](Images/Figure9.png)

You can explore the filtered portal for the Pacific region here:

[![](Images/button.png)](https://apps.axibase.com/chartlab/c284427c)

Finally, using the fourth dropdown, we are able to sort by state. It is worth noting that all not states are represented in this dataset. 39 states plus the District of Columbia are included
in this dataset. States that are not included are: Alaska (AK), Maine (ME), Mississippi (MS), Montana (MT), New Hampshire (NH), North Dakota (ND), South Carolina (SC), South Dakota (SD), 
Vermont (VT), West Virginia (WV), and Wyoming (WY). 

Below is an image of New Jersey (NJ) filtered for all deaths.

![Figure 10](Images/Figure10.png)

You can explore the filtered portal for the state of New Jersey here:

[![](Images/button.png)](https://apps.axibase.com/chartlab/3d07088c)

We can see that there is an unbelievable amount of data in this ATSD instance. The high quantity of cities, the frequent collection intervals of the data, and the highly variable nature of the 
death totals make it difficult to wrap our heads around all of this. How can we make sense of all of it? Using Axibase's SQL query language capabilities allows you to easily search for specific
information within this portal.

### Axibase SQL Query Language
------------------------------

According to [techopedia.com](https://www.techopedia.com/definition/1245/structured-query-language-sql), structured query language (SQL) is a standard computer language used for relational
database management and data manipulation. SQL is used to query, insert, update, and modify data. Initially developed by IBM in the 1970's and released by Oracle Corporation in 1979, SQL allows
you to maneuver through large amounts of data and specify exactly the information you are looking for.

Let us begin by walking through some SQL examples for examining our dataset. Looking at an output for an individual city or even all of the cities combined, it is relatively easy to recognize the general
trend of deaths in the U.S. over time. However, in many instances, since there is so much information, it is difficult to tell what the number of deaths was for a certain time. So let us take
a closer look at determining the **least deadly** and **deadliest** week for each city from 1970 to 2016.

1. Install Docker (Xenial Version 16.04). A link for how to install Docker can be found [here](https://docs.docker.com/engine/installation/linux/ubuntulinux/). 
2. Create the `docker-compose.yml` file from our [GitHub](https://github.com/axibase/axibase-collector-docs/blob/master/docker-bundle.md) page. 
3. In Terminal, launch containers with the below command:

   ```sql
   `export` USER=myuser; `export` PASSWORD=mypassword; docker-compose up -d 
   ```
4. Access the ATSD user interface by navigating to the address shown in the image below. Create a username and password.

   ![Figure 11](Images/Figure11.png)

5. Login to ATSD, as shown in the image below.

   ![Figure 12](Images/Figure12.png)
   
6. Axcess Axibase Collector by navigating to `https://localhost:9443/register.xhtml`, and populate the username and password fields as shown in the image below.

   ![Figure 13](Images/Figure13.png)
   
7. Import the Socrata `job.xml` file into Axibase Collector, as shown in the image below.
 
   ![Figure 14](Images/Figure14.png)
    
8. Now click on the `Jobs` tab. Only jobs that are 'Enabled' are shown as the default. After importing, all jobs are automatically set to disabled. Select 'ALL' as shown in the first image 
   below. Next, the actual name of the file that will show up in Collector is `socrata-cdc`. Click on this job, check the 'Enabled' checkbox, and hit 'Save' as shown in the second figure.
   
   ![Figure 18](Images/Figure18.png)
      
   ![Figure 15](Images/Figure15.png)
   
9. Navigate back to the main page, select the `Jobs` tab. Since we set `socrata-cdc` to 'Enabled', it shows up by default. Hit 'Run'. After a few seconds, refresh your browser, and you
   should see an output as shown in the second image below.

   ![Figure 16](Images/Figure16.png)
   
   ![Figure 17](Images/Figure17.png)
   
10. Now, navigate to back to the 'Entities' tab in ATSD. We can see that 
   
   ![Figure 19](Images/Figure19.png)
   
11. Next, navigate to the `Configuration -> Replacement Table`.
   
   ![Figure 20](Images/Figure20.png)
   
12. Copy and paste the files included in this repository (`city-size` and `us-regions`) into the Replacement Table.  
   
   ![Figure 21](Images/Figure21.png)
   
* `SELECT` - returns a result set of records from one or more tables.
* `FROM` - indicates the table(s) to retrieve data from.
* `WHERE` - specifies which rows to retrieve.
* `ORDER BY` - specifies the order in which to return the rows.

The least deadly week by city:

```sql
SELECT date_format(time, 'yyyy-MM-dd') AS 'date', 
  tags.city AS 'city', tags.state AS 'state', 
  ISNULL(LOOKUP('us-region', tags.region), tags.region) AS 'region', 
  value AS 'all_deaths',
  LOOKUP('city-size', concat(tags.city, ',', tags.state)) AS 'population'
FROM cdc.all_deaths
  WHERE entity = 'mr8w-325u' and tags.city IS NOT NULL AND value > 0
  WITH row_number(tags ORDER BY value, time DESC) <= 1
ORDER BY 'date' DESC
  OPTION (ROW_MEMORY_THRESHOLD 500000)
```

The deadliest week by city:

```sql
SELECT date_format(time, 'yyyy-MM-dd') as 'date', 
  tags.city as 'city', tags.state as 'state', 
  ISNULL(LOOKUP('us-region', tags.region), tags.region) AS 'region', 
  value as 'all_deaths',
  LOOKUP('city-size', concat(tags.city, ',', tags.state)) AS 'population'
FROM cdc.all_deaths
  WHERE entity = 'mr8w-325u' and tags.city IS NOT NULL
  WITH row_number(tags ORDER BY value desc, time desc) <= 1
ORDER BY value desc
  OPTION (ROW_MEMORY_THRESHOLD 500000)  
```

The deadliest week due to pneumonia and influenza by city:

```sql
SELECT date_format(time, 'yyyy-MM-dd') as 'date', 
  tags.city as 'city', tags.state as 'state', 
  ISNULL(LOOKUP('us-region', tags.region), tags.region) AS 'region', 
  value as 'pneumonia_influenza_deaths',
  LOOKUP('city-size', concat(tags.city, ',', tags.state)) AS 'population'
FROM cdc.pneumonia_and_influenza_deaths t1
  WHERE entity = 'mr8w-325u' and tags.city IS NOT NULL
  WITH row_number(tags ORDER BY value desc, time desc) <= 1
ORDER BY value desc
  OPTION (ROW_MEMORY_THRESHOLD 500000)
```

The deadliest pneumonia and influenza week as a percentage of all deaths:

```sql
SELECT date_format(tot.time, 'yyyy-MM-dd') as 'date', 
  tot.tags.city as 'city', tot.tags.state as 'state', 
  LOOKUP('us-region', tot.tags.region) AS 'region',  
  tot.value as 'all_deaths',
  pni.value as 'pneumonia_influenza_deaths',
  pni.value/tot.value*100 as 'pneumonia_influenza_deaths, %',
  LOOKUP('city-size', CONCAT(tot.tags.city, ',', tot.tags.state)) AS 'population'
FROM cdc.all_deaths tot
  JOIN cdc.pneumonia_and_influenza_deaths pni
  WHERE tot.entity = 'mr8w-325u' AND tot.tags.city IS NOT NULL
  AND pni.value > 1
  WITH row_number(tot.tags ORDER BY pni.value/tot.value DESC, tot.time DESC) <= 1
  ORDER BY 'pneumonia_influenza_deaths, %' DESC, pni.value DESC
  OPTION (ROW_MEMORY_THRESHOLD 500000)
```

`OUTER JOIN` can help find all instances when a city failed to report `pneumonia_and_influenza_deaths` (no data).

```sql
SELECT tot.datetime, tot.value AS 'total',
  ISNULL(pni.value, 'N/A') AS 'pneumonia/influenza'
FROM cdc.all_deaths tot
  OUTER JOIN cdc.pneumonia_and_influenza_deaths pni
WHERE tot.entity = 'mr8w-325u'
  AND tot.tags.city = 'Baton Rouge'
  AND pni.value IS NULL
```

Top 10 cities by all deaths in the current year (year to date):

```sql
SELECT tags.city as 'city', tags.state as 'state', 
  ISNULL(LOOKUP('us-region', tags.region), tags.region) AS 'region', 
  sum(value) as 'all_deaths',
  LOOKUP('city-size', concat(tags.city, ',', tags.state)) AS 'population'
FROM cdc.all_deaths
  WHERE entity = 'mr8w-325u' and tags.city IS NOT NULL
  AND datetime > current_year
GROUP BY tags
ORDER BY 'all_deaths' DESC
  LIMIT 10
  OPTION (ROW_MEMORY_THRESHOLD 500000)
```

Top 10 cities by pneumonia and influenza deaths:

```sql
SELECT tags.city as 'city', tags.state as 'state', 
  ISNULL(LOOKUP('us-region', tags.region), tags.region) AS 'region', 
  sum(value) as 'pneumonia_influenza_deaths',
  LOOKUP('city-size', concat(tags.city, ',', tags.state)) AS 'population'
FROM cdc.pneumonia_and_influenza_deaths
  WHERE entity = 'mr8w-325u' and tags.city IS NOT NULL
  AND datetime > current_year
GROUP BY tags
ORDER BY 'pneumonia_influenza_deaths' DESC
  LIMIT 10
  OPTION (ROW_MEMORY_THRESHOLD 500000)
```

Top 10 cities with the highest percentage of deaths caused by pneumonia and influenza, year-to-date:

```sql
SELECT tot.tags.city as 'city', tot.tags.state as 'state', 
  LOOKUP('us-region', tot.tags.region) AS 'region',  
  sum(tot.value) AS 'all_deaths',
  sum(pni.value) AS 'pneumonia_influenza_deaths',
  sum(pni.value)/sum(tot.value)*100 AS 'pneumonia_influenza_deaths, %',
  LOOKUP('city-size', CONCAT(tot.tags.city, ',', tot.tags.state)) AS 'population'
FROM cdc.all_deaths tot
  JOIN cdc.pneumonia_and_influenza_deaths pni
WHERE tot.entity = 'mr8w-325u' AND tot.tags.city IS NOT NULL
  AND tot.datetime > current_year AND tot.value > 0
GROUP BY tot.tags
  ORDER BY 'pneumonia_influenza_deaths, %' DESC, 'pneumonia_influenza_deaths' DESC
  OPTION (ROW_MEMORY_THRESHOLD 500000)
```

Top 10 cities with the highest percentage of deaths caused by pneumonia and influenza, for the last 12 months (trailing):

```sql
SELECT tot.tags.city as 'city', tot.tags.state as 'state', 
  LOOKUP('us-region', tot.tags.region) AS 'region',  
  sum(tot.value) AS 'all_deaths',
  sum(pni.value) AS 'pneumonia_influenza_deaths',
  sum(pni.value)/sum(tot.value)*100 AS 'pneumonia_influenza_deaths, %',
  LOOKUP('city-size', CONCAT(tot.tags.city, ',', tot.tags.state)) AS 'population'
FROM cdc.all_deaths tot
  JOIN cdc.pneumonia_and_influenza_deaths pni
WHERE tot.entity = 'mr8w-325u' AND tot.tags.city IS NOT NULL
  AND tot.datetime > now-1*YEAR AND tot.value > 0
GROUP BY tot.tags
  ORDER BY 'pneumonia_influenza_deaths, %' DESC, 'pneumonia_influenza_deaths' DESC
  OPTION (ROW_MEMORY_THRESHOLD 500000)
```

Top 10 cities with the highest percentage of deaths caused by pneumonia and influenza, but for the entire period since 1970:

```sql
SELECT tot.tags.city as 'city', tot.tags.state as 'state', 
  LOOKUP('us-region', tot.tags.region) AS 'region',  
  sum(tot.value) AS 'all_deaths',
  sum(pni.value) AS 'pneumonia_influenza_deaths',
  sum(pni.value)/sum(tot.value)*100 AS 'pneumonia_influenza_deaths, %',
  LOOKUP('city-size', CONCAT(tot.tags.city, ',', tot.tags.state)) AS 'population'
FROM cdc.all_deaths tot
  JOIN cdc.pneumonia_and_influenza_deaths pni
WHERE tot.entity = 'mr8w-325u' AND tot.tags.city IS NOT NULL
  AND tot.value > 0
GROUP BY tot.tags
  ORDER BY 'pneumonia_influenza_deaths, %' DESC, 'pneumonia_influenza_deaths' DESC
  OPTION (ROW_MEMORY_THRESHOLD 500000)
```

Number of pneumonia and influenza deaths per month, in Midwest:

```sql
SELECT date_format(time, 'yyyy MMM') as 'date',
  LOOKUP('us-region', tags.region) AS 'region', 
  sum(value) as 'pneumonia_influenza_deaths'
FROM cdc.pneumonia_and_influenza_deaths
  WHERE entity = 'mr8w-325u' and tags.city IS NOT NULL
  AND tags.region = '3'
  AND datetime > now-5*year AND datetime < '2016-10-01T00:00:00Z'
GROUP BY tags.region, period(1 MONTH)
ORDER BY datetime desc, tags.region
  OPTION (ROW_MEMORY_THRESHOLD 500000)+
```

Total pneumonia and influenza deaths in January for region 3:

```sql
SELECT date_format(time, 'yyyy MMM') as 'date',
  LOOKUP('us-region', tags.region) AS 'region', 
  sum(value) as 'pneumonia_influenza_deaths'
FROM cdc.pneumonia_and_influenza_deaths
  WHERE entity = 'mr8w-325u' and tags.city IS NOT NULL
  AND tags.region = '3'
  AND date_format(time, 'MMM') = 'Jan'
GROUP BY tags.region, period(1 MONTH)
ORDER BY datetime, tags.region
  OPTION (ROW_MEMORY_THRESHOLD 500000)
```

Top 3 deadliest pneumonia and influenza Januaries in region 3:

```sql
SELECT date_format(time, 'yyyy MMM') as 'date',
  LOOKUP('us-region', tags.region) AS 'region', 
  sum(value) as 'pneumonia_influenza_deaths'
FROM cdc.pneumonia_and_influenza_deaths
  WHERE entity = 'mr8w-325u' and tags.city IS NOT NULL
  AND tags.region = '3'
  AND date_format(time, 'MMM') = 'Jan'
GROUP BY tags.region, period(1 MONTH)
ORDER BY sum(value) desc
  LIMIT 3
  OPTION (ROW_MEMORY_THRESHOLD 500000)
```  

Deadliest pneumonia and influenza month by region:

```sql
SELECT date_format(time, 'MMM') AS 'Month',
  LOOKUP('us-region', tags.region) AS 'region', 
  sum(value) as 'pneumonia_influenza_deaths'
FROM cdc.pneumonia_and_influenza_deaths
  WHERE entity = 'mr8w-325u' and tags.city IS NOT NULL
GROUP BY tags.region, date_format(time, 'MMM')
  ORDER BY sum(value) DESC
  OPTION (ROW_MEMORY_THRESHOLD 500000)
```

Latest weekly pneumonia and influenza readings for Boston:

```sql
SELECT datetime, value, tags.*
  FROM cdc.pneumonia_and_influenza_deaths
WHERE tags.city = 'Boston'
  ORDER BY datetime DESC
LIMIT 10
```

Latest pneumonia and influenza and total readings for Boston, using JOIN:

```sql
SELECT *
  FROM cdc.pneumonia_and_influenza_deaths pni
    JOIN cdc.all_deaths tot
WHERE pni.tags.city = 'Boston'
  ORDER BY pni.datetime DESC
LIMIT 10
```

Latest pneumonia and influenza and total readings for Boston, with specific tags:

```sql
SELECT datetime, value, tags.city, tags.state, tags.region
  FROM cdc.pneumonia_and_influenza_deaths
WHERE tags.city = 'Boston'
  ORDER BY datetime DESC
LIMIT 10
```

Latest pneumonia and influenza and total readings for Boston, with region code translated to region name using a Replacement Table:

```sql
SELECT datetime, value, tags.city, tags.state, 
   LOOKUP('us-region', tags.region) AS 'region'
  FROM cdc.pneumonia_and_influenza_deaths
WHERE tags.city = 'Boston'
  ORDER BY datetime DESC
LIMIT 10
```

Same as above, except for total for all cities in a given region:

```sql
SELECT datetime, sum(value),  
  LOOKUP('us-region', tags.region) AS 'region'
  FROM cdc.pneumonia_and_influenza_deaths
WHERE tags.region = '2'
  GROUP BY tags.region, datetime
  ORDER BY datetime DESC
LIMIT 10
```

Monthly totals for all cities in region, for a given time-range:

```sql
SELECT datetime, sum(value),  
  LOOKUP('us-region', tags.region) AS 'region'
  FROM cdc.pneumonia_and_influenza_deaths
WHERE tags.region = '2'
  AND datetime >= '2016-01-01T00:00:00Z' AND datetime < '2016-10-01T00:00:00Z'
  GROUP BY tags.region, period(1 MONTH)
  ORDER BY datetime DESC
```

Cities with the highest mortality rate:

```sql
SELECT tags.city as 'city', tags.state as 'state', 
  ISNULL(LOOKUP('us-region', tags.region), tags.region) AS 'region', 
  sum(value) as 'all_deaths',
  cast(LOOKUP('city-size', concat(tags.city, ',', tags.state))) AS 'population',
  sum(value)/cast(LOOKUP('city-size', concat(tags.city, ',', tags.state)))*1000 AS 'mortality_rate'
FROM cdc.all_deaths
  WHERE entity = 'mr8w-325u' and tags.city IS NOT NULL
  AND datetime >= '2015-01-01T00:00:00Z' AND datetime < '2016-01-01T00:00:00Z'
GROUP BY tags
ORDER BY mortality_rate DESC
```

Mortality rates in New York (fixed pop size, provisional):

```sql
SELECT tot.datetime, tot.tags.city as 'city', tot.tags.state as 'state', 
  ISNULL(LOOKUP('us-region', tot.tags.region), tot.tags.region) AS 'region', 
  sum(tot.value - t24.value - t44.value - t64.value - t64o.value) as 'other_deaths',
  sum(t24.value) as '1-24_deaths',
  sum(t44.value) as '24-44_deaths',
  sum(t64.value) as '44-64_deaths',
  sum(t64o.value) as '64+_deaths',
  sum(tot.value) as 'all_deaths',
  cast(LOOKUP('city-size', concat(tot.tags.city, ',', tot.tags.state))) AS 'population',
  sum(tot.value - t24.value - t44.value - t64.value - t64o.value)/cast(LOOKUP('city-size', concat(tot.tags.city, ',', tot.tags.state)))*1000 AS 'other_mortality_rate',
  sum(t24.value)/cast(LOOKUP('city-size', concat(tot.tags.city, ',', tot.tags.state)))*1000 AS '1_24_mortality_rate',
  sum(t64o.value)/cast(LOOKUP('city-size', concat(tot.tags.city, ',', tot.tags.state)))*1000 AS '64_older_mortality_rate',
  sum(tot.value)/cast(LOOKUP('city-size', concat(tot.tags.city, ',', tot.tags.state)))*1000 AS 'total_mortality_rate'
FROM cdc.all_deaths tot
  JOIN cdc._1_24_years t24
  JOIN cdc._25_44_years t44
  JOIN cdc._54_64_years t64
  JOIN cdc._65_years t64o
  WHERE tot.entity = 'mr8w-325u' and tot.tags.city IS NOT NULL
  AND tot.datetime >= '1970-01-01T00:00:00Z' AND tot.datetime < '2016-01-01T00:00:00Z'
  and tot.tags.city = 'New York'
GROUP BY tot.tags, tot.period(1 year)
  HAVING sum(tot.value) > 0
ORDER BY tot.tags.city, tot.datetime
```

2016 mortality rates:

```sql
SELECT tot.tags.city as 'city', tot.tags.state as 'state', 
  ISNULL(LOOKUP('us-region', tot.tags.region), tot.tags.region) AS 'region', 
  sum(tot.value - t24.value - t44.value - t64.value - t64o.value) as 'other_deaths',
  sum(t24.value) as '1-24_deaths',
  sum(t44.value) as '24-44_deaths',
  sum(t64.value) as '44-64_deaths',
  sum(t64o.value) as '64+_deaths',
  sum(tot.value) as 'all_deaths',
  cast(LOOKUP('city-size', concat(tot.tags.city, ',', tot.tags.state))) AS 'population',
  sum(tot.value - t24.value - t44.value - t64.value - t64o.value)/cast(LOOKUP('city-size', concat(tot.tags.city, ',', tot.tags.state)))*1000 AS 'other_mortality_rate',
  sum(t24.value)/cast(LOOKUP('city-size', concat(tot.tags.city, ',', tot.tags.state)))*1000 AS '1_24_mortality_rate',
  sum(t64o.value)/cast(LOOKUP('city-size', concat(tot.tags.city, ',', tot.tags.state)))*1000 AS '64_older_mortality_rate',
  sum(tot.value)/cast(LOOKUP('city-size', concat(tot.tags.city, ',', tot.tags.state)))*1000 AS 'total_mortality_rate'
FROM cdc.all_deaths tot
  JOIN cdc._1_24_years t24
  JOIN cdc._25_44_years t44
  JOIN cdc._54_64_years t64
  JOIN cdc._65_years t64o
  WHERE tot.entity = 'mr8w-325u' and tot.tags.city IS NOT NULL
  AND tot.datetime >= '2015-01-01T00:00:00Z' AND tot.datetime < '2016-01-01T00:00:00Z'
GROUP BY tot.tags, tot.period(1 year)
  HAVING sum(tot.value) > 0
ORDER BY 'total_mortality_rate' desc
```

### Appendix: Death Statistics City List 
----------------------------------------

Akron (OH)<br />
Albany (NY)<br />
Albuquerque	(NM)<br />
Allentown (PA)<br />
Atlanta (GA)<br />
Austin (TX)<br />
Baltimore (MD)<br />
Baton Rouge	(LA)<br />
Berkeley (CA)<br />
Birmingham (AL)<br />
Boise (ID)<br />
Boston (MA)<br />
Bridgeport (CT)<br />
Buffalo (NY)<br />
Cambridge (MA)<br />
Camden (NJ)<br />
Canton (OH)<br />
Charlotte (NC)<br />
Chattanooga (TN)<br />
Chicago (IL)<br />
Cincinnati (OH)<br />
Cleveland (OH)<br />
Colorado Springs (CO)<br />
Columbus (OH)<br />
Corpus Christi (TX)<br />
Dallas (TX)<br />
Dayton (OH)<br />
Denver (CO)<br />
Des Moines (IA)<br />
Detroit (MI)<br />
Duluth (MN)<br />
El Paso (TX)<br />
Elizabeth (NJ)<br />
Erie (PA)<br />
Evansville (IN)<br />
Fall River (MA)<br />
Fort Wayne (IN)<br />
Fort Worth (TX)<br />
Fresno (CA)<br />
Gary (IN)<br />
Glendale (CA)<br />
Grand Rapids (MI)<br />
Hartford (CT)<br />
Honolulu (HI)<br />
Houston (TX)<br />
Indianapolis (IN)<br />
Jacksonville (FL)<br />
Jersey City (NJ)<br />
Kansas City (KS)<br />
Kansas City	(MO)<br />
Knoxville (TN)<br />
Lansing (MI)<br />
Las Vegas (NV)<br />
Lexington (KY)<br />
Lincoln (NE)<br />
Little Rock	(AR)<br />
Long Beach (CA)<br />
Los Angeles	(CA)<br />
Lowell (MA)<br />
Lynn (MA)<br />
Memphis (TN)<br />
Miami (FL)<br />
Milwaukee (WI)<br />
Minneapolis (MN)<br />
Mobile (AL)<br />
Montgomery (AL)<br />
Nashville (TN)<br />
New Bedford (MA)<br />
New Haven (CT)<br />
New Orleans (LA)<br />
New York (NY)<br />
Newark (NJ)<br />
Norfolk	(VA)<br />
Ogden (UT)<br />
Omaha (NE)<br />
Pasadena (CA)<br />
Paterson (NJ)<br />
Peoria (IL)<br />
Philadelphia (PA)<br />
Phoenix	(AZ)<br />
Pittsburgh (PA)<br />
Portland (OR)<br />
Providence (RI)<br />
Pueblo (CO)<br />
Reading	(PA)<br />
Richmond (VA)<br />
Rochester (NY)<br />
Rockford (IL)<br />
Sacramento (CA)<br />
Saint Louis (MO)<br />
Saint Paul (MN)<br />
Saint Petersburg (FL)<br />
Salt Lake City (UT)<br />
San Antonio	(TX)<br />
San Diego (CA)<br />
San Francisco (CA)<br />
San Jose (CA)<br />
Santa Cruz (CA)<br />
Savannah (GA)<br />
Schenectady (NY)<br />
Scranton (PA)<br />
Seattle	(WA)<br />
Shreveport (LA)<br />
Somerville (MA)<br />
South Bend (IN)<br />
Spokane	(WA)<br />
Springfield	(MA)<br />
Syracuse (NY)<br />
Tacoma (WA)<br />
Tampa (FL)<br />
Toledo (OH)<br />
Trenton (NJ)<br />
Tucson (AZ)<br />
Tulsa (OK)<br />
Utica (NY)<br />
Washington (DC)<br />
Waterbury (CT)<br />
Wichita (KS)<br />
Wilmington (DE)<br />
Worcester (MA)<br />
Yonkers (NY)<br />
Youngstown (OH)<br />


