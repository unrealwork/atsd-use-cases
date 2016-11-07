![TitlePhoto](Images/TitlePhoto.png)

Country Living - Analyzing Employee Compensation in Iowa using Socrata Open 
===========================================================================

### Introduction
----------------

Pigs. Fields of corn. Open prairie. Small towns. These are some of the first things that come to mind when thinking about life in Iowa. While many may see this as a simpleton and
boring way of life, Iowa is one of the most financially diverse and stable states in America. According to the [US Bureau of Labor Statistics](http://www.bls.gov/news.release/laus.nr0.htm),
as of September 2016, Iowa's unemployment rate of 4.2% is lower than then US average of 5.0%. Additionally, from September of 2015 to September 2016, the state of Iowa added 29,600
jobs, which amounted to a growth rate 1.9%. 

In order to better analyze datasets such as employee financial compensation by industry in Iowa, the US government in 2009 established a data collection website, 
[data.gov](https://www.data.gov/). Datasets are available online to conduct research, develop web applications, and design data visualizations, on a variety of topics ranging 
from agriculture, to manufacturing, to health, among  many other.
  
These datasets are published using the Socrata Open Data Format. [Socrata](https://socrata.com/) is a Seattle based company that develops software for
government agencies to publish and manage their data in an open format. According to their website, the Socrata Open Data Format is used by the US
Federal government, 25 US states, 300+ US cities, and contains 4,000+ datasets for numerous US counties.

### Iowa Employee Compensation Dataset
--------------------------------------

Let us take a look at a dataset from [data.gov](https://www.data.gov/) which looks at employee compensation by industry in Iowa.

From 1998 to the present year, the State of Iowa has compiled total state wide employee compensation estimates in thousands of dollars, seasonally adjusted at annual rates. All dollar 
estimates are in current dollars (not adjusted for inflation). Compensation is the total remuneration, both monetary and in kind, payable by employers to employees in return for 
their work during the period. Data is published for each of the following 3 industries:
  
**Farm**, **Government and government enterprises**, **Private non-farm**

In turn, each of these industries is broken down into the following subcategories:

**Farm**:<br> 
Farm

**Government and government enterprises**:<br> 
Federal, civilian<br> 
Military<br> 
State and local<br> 

**Private non-farm**:<br> 
Administrative and support of waste management and remediation services<br> 
Accommodation and food services<br> 
Arts, entertainment, and recreation<br> 
Construction<br> 
Educational services<br> 
Finance and insurance<br> 
Forestry, fishing, and related activities<br> 
Health care and social assistance<br> 
Information<br> 
Management of companies and enterprises<br> 
Manufacturing<br> 
Mining, quarrying, and oil and gas extraction<br> 
Professional, scientific, and technical services<br> 
Real estate and rental and leasing<br> 
Retail trade<br> 
Transportation and warehousing<br> 
Wholesale trade<br> 
Utilities<br> 

Other Services (except public administration)

The dataset from data.gov can be found here: [http://catalog.data.gov/dataset/employee-compensation-by-industry-in-iowa](http://catalog.data.gov/dataset/employee-compensation-by-industry-in-iowa)

On the data.gov website, datasets can be downloaded as a CSV, RDF, JSON, or a XML file. This dataset can easily be parsed into ATSD using the JSON file format.

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
* Write programs to parse and digest these types of files.

Rather, you can configure a scheduled job to retrieve the file from the specified endpoint and have ATSD parse it according to pre-defined rules. Once you
have raw data in ATSD, creating and sharing reports with built-in widgets is fairly trivial. The reports will be continuously updated as new data comes in.

With ATSD, the user is able display the dataset in an easily understandable manner. The below figure shows employee compensation for each of the 23 industries.

![Figure 1](Images/Figure1.png)
  
Using the ATSD default portal for this particular data.gov dataset, the user has the ability to filter for employee compensation by industry in Iowa to their liking. 

The following three filters are applied to the default portal:

* First filter: allows the user to sort by compensation type. In the default portal, the only current option is to filter by thousand of US dollars. 
* Second filter: allows the user to filter between 23 industries. In the case above, all industries have been selected. 
* Third filter: allows the user to filter by industry groups (far, government and government enterprise, and private nonfarm). In the above case, all groups have been selected.

The dataset can be sorted by industry group (farm, government and government enterprises, and private non-farm) or specific industry, and the user can easily toggle through 
comparing different scenarios. 

The below figure shows the output when **farm** is selected as the **[industry_type]** from the third filter. We can see that the total compensation for farming can fluctuates quite
often. There does not seem to be a single pattern that repeats year over year, such as low amount of work in the winter (leading to low figures) and a high amount of work in the fall
(leading to high figures). Rather, we can see that the farming industry is very sensitive to extraneous factors (such as bad weather), which can plunge the industry's overall numbers.      
 
![Figure 7](Images/Figure7.png)

The next figure shows the output when **government and government enterprises** is selected as the **[industry_type]** from the third filter. We can see that the 
**federal, civilian** and **military** metrics are nearly constant and that **state and local** is experiencing steady growth. Unlike with the farming industry, we can see that 
government institutions are less sensitive to extraneous factors (such as bead weather, a poor economy, or civil unrest).  

![Figure 8](Images/Figure8.png)

The below figure shows the output for the private non-farm industry group as a whole.

![Figure 2](Images/Figure2.png)

It appears that most of these metrics are on an upward trend, but it is somewhat difficult to tell. Let us sort for the metrics **Construction** and **Manufacturing**. These images 
for these 2 outputs are shown below, respectively. We can see that both metrics were experiencing steady, upward growth until the late 2000's, where each both metric experienced a 
sharp decline (as marked by the red boxes in the figures below). An extraneous factor at this time that may have contributed to this change was the poor world-wide economy, otherwise
known as the "Great Recession".  
 
![Figure 3](Images/Figure3.png)

![Figure 9](Images/Figure9.png)

Here, you can explore the complete dataset for employee compensation by industry in Iowa:

[![](Images/button.png)](https://apps.axibase.com/chartlab/f5eae012) 

### A Deeper Look at Iowa's Economy
-----------------------------------

In order to provide context to the above dataset, we will now walk through adding additional datasets. By looking at additional information, 
we can see how the rise and fall of employee compensation corresponds to other metrics. For example, does the rise of employee compensation correspond to a rise of the gross number 
of employees in the sate, or is there another factor at play? With a decrease in employee compensation, will unemployment rates and benefits rise as a result? To look into these 
questions, let us navigate to [https://data.iowa.gov](https://data.iowa.gov/). This site contains publicly available information pertaining to Iowa for fields such as the economy,
education, health, and the environment, among many more fields. Let us begin by finding a dataset which provides information on the gross number of employees working in the state.

1. Navigate to [https://data.iowa.gov](https://data.iowa.gov).
2. On the home page, select the **Employment** tab.
3. As shown in the figure below, in the **Employment** tab, scroll to the bottom of the page and click on the **Topics** drop down. Select **Employment**.

   ![Figure 4](Images/Figure4.png)

4. Select the dataset titled **Iowa Seasonally Adjusted Non-Farm Employment by Month and Industry**. This link can be found [here](https://data.iowa.gov/Economy/Iowa-Seasonally-Adjusted-Non-Farm-Employment-by-Mo/sxz8-4swt). 
5. As shown in the image below, click on **Download -> JSON**, which provides the dataset in the Socrata format, which can be easily processed using ATSD.

   ![Figure 5](Images/Figure5.png)
   
Below is an image of the dataset **Iowa Seasonally Adjusted Non-Farm Employment by Month and Industry**. Data has been compiled from 1990 to the present year. The metric shown is 
the total number of employees (in thousands) per industry. 

![Figure 6](Images/Figure6.png)

Here, you can explore the complete dataset for employee compensation by industry in Iowa:

[![](Images/button.png)](https://apps.axibase.com/chartlab/1ac33603)

Data is published for each of the following industry types: **Goods producing**, **Government**, and **Service providing**.  

In turn, each of these industries is broken down into the following subcategories:

**Goods producing**<br>
Construction<br>
Manufacturing<br>
Mining and Logging<br>

**Government**<br>
Federal Government<br>
Local Government<br>
State Government<br>

**Service providing**<br>
Education and Health Services<br>
Financial Activities<br>
Information<br>
Leisure and Hospitality<br>
Professional and Business Services<br>
Retail Trade<br>
Transportation and Utilities<br>
Wholesale Trade<br>

Other Services

The following three filters are applied to the default portal:

* First filter: allows the user to sort by employee type. In the default portal, the only current option is to filter by thousands of employees. 
* Second filter: allows the user to filter between 3 industry types. In the case above, all industry groups are selected. 
* Third filter: allows the user to filter by a specific industry. In the default instance, all industries are selected.



* ytnz-cckp - seasonally adjusted non-farm employment by month
* n74v-z6ct - average monthly non-farm employment by year and category
* jpje-kkb9 - unemployment insurance claims and payments (statewide - monthly)
* njph-rx66 - unemployment insurance claims (statewide - weekly)
* b38f-jgn3 - unemployment insurance benefit payments by industry 
* yhbr-3t8a - unemployment insurance recipients and unemployment insurance benefit payments by county (Annual)
* rmcb-sifx - benefits 
* rigx-2vau - unemployment insurance initial claims by county
* aeyn-twxp - unemployment insurance recipients and unemployment insurance benefit payments by county (Monthly)









