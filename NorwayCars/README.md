![TitlePhoto](Images/TitlePhoto.png)

Norway: Electric Vehicles Close the Gap with Diesel in 2016.
==============

The Norway's central statistical agency, [SSB](https://www.ssb.no/statistikkbanken/selecttable/hovedtabellHjem.asp?KortNavnWeb=bilreg&CMSSubjectArea=transport-og-reiseliv&PLanguage=1&checked=true), released its annual car registration statistics on March 28, 2017. While the key trends such as the rotation out of gasoline models were still in place, the dataset delivered a few surprises.

* 2016 was the first year when the total car fleet in Norway registered an annual decline of **-15K** units.
* Gasoline (petrol) models were hit particularly hard. The net change in registered vehicles was **-87K** - the largest drop in the installed base of petrol cars on record.
* The electric vehicles (EVs) continued to gain ground however the pace of growth has slowed down. The installed base of EVs reached **100K** units, the annual increase was 29179 vehicles compared to 31271 vehicles in calendar year 2015.
* The unit growth of the EV installed base is getting closer to being on par with the diesel segment: 29179/42824 or **68%** in 2016 versus 31271/64708 or **48%** in 2015.
* The number of registered Tesla Motors cars increased by 3361 units in 2016 compared to 3904 units in 2015, suggesting competition with less expensive EV models. Tesla's share in new EV registrations decreased to **11.5%** from **12.5%** in 2015 and from 18.7% in 2014.

---

### Total Vehicle Registrations by Fuel Type

![](Images/chart-total.png)

[![](Images/button.png)](https://apps.axibase.com/chartlab/bbc5e671/7/#fullscreen)

---

### Installed Base Changes by Make over a 5-year period

![](Images/chart-winner-losers.png)

[![](Images/button.png)](https://apps.axibase.com/chartlab/bbc5e671/7/#fullscreen)

---

### Tesla Motors Performance


![](Images/chart-tesla.png)

[![](Images/button.png)](https://apps.axibase.com/chartlab/bbc5e671/7/#fullscreen)

---

You can take a closer
look at the statistics by following the below steps to install your own [Axibase Time Series Database](http://axibase.com/products/axibase-time-series-database/) instance.

1. Install the ATSD database from a Docker image:

   ```sql
    docker run \
      --detach \
      --name=atsd \
      --publish 8443:8443 \
      axibase/atsd:latest
   ```

2. Login into ATSD and configure the pre-defined administrator account.
3. Import the [`csv-parser-nor-configs.xml`](Resources/travel_visas.xml) parser definitios on **Configuration > Parsers: CSV** page.
4. Export files from Statbank in Matrix TSV format (see instructions at the end of this article) or upload prepared tsv files as outlined in steps 5 and 6 below.
5. Upload the [`total.tsv`](Resources/total.tsv) file using the `nor-transport` parser.
6. Upload the [`by-make-1.tsv`](Resources/by-make-1.tsv) and [`by-make-2.tsv`](Resources/by-make-2.tsv) files using the `nor-transport-make` parser.
7. To check that data has been imported, open the SQL tab in the top menu and execute the following query:

  ```sql
  SELECT datetime, value
    FROM nor.registered_vehicles_by_make
  WHERE tags.make = 'Tesla Motors'
    ORDER BY datetime
  ```

8. Execute SQL queries for `nor.registered_vehicles` and `nor.registered_vehicles_by_make` to analyze statistics in tabular format using [SQL](https://github.com/axibase/atsd-docs/tree/master/api/sql#overview) syntax implemented in ATSD.
9. Create new [visualizations](http://axibase.com/products/axibase-time-series-database/visualization/) on **Configuration > Portals** page using chart configurations from the Chartlab examples above.

> Feel free to contact us with installation and technical support issues via the [feedback](https://axibase.com/feedback/) form.

----

### Exporting data from StatBank

1. Registered motor vehicles, by type of transport and type of fuel (M).
  - Configuration Form: [link](https://www.ssb.no/statistikkbanken/selectvarval/Define.asp?subjectcode=&ProductId=&MainTable=RegKjoretoy2&nvl=&PLanguage=1&nyTmpVar=true&CMSSubjectArea=transport-og-reiseliv&KortNavnWeb=bilreg&StatVariant=&checked=true)
  - Format: Matrix TSV  
  - Summation: by Contents

  ![TitlePhoto](Images/table-total.png)

2. Registered vehicles, by type of vehicle and trade mark (M).

  * Configuration Form: [link](https://www.ssb.no/statistikkbanken/selectvarval/Define.asp?subjectcode=&ProductId=&MainTable=RegKjoretoy&nvl=&PLanguage=1&nyTmpVar=true&CMSSubjectArea=transport-og-reiseliv&KortNavnWeb=bilreg&StatVariant=&checked=true)
  * Format: Matrix TSV

  ![TitlePhoto](Images/table-by-make.png)
