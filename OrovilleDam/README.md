![Figure 4](Images/Figure4.png)

Realtime Analysis of the Oroville Dam Disaster 
==============================================

In February 2017, reservoir levels for the tallest dam in the United States, located near [Oroville, California](http://www.water.ca.gov/swp/facilities/Oroville/LakeDam.cfm), were
beginning to reach capacity from unseasonably high rainfall totals. Officials decided to begin using the primary dam spillway, which quickly began to deteriorate, and by 
February 10th, a hole 300 feet wide, 500 feet long, and 45 feet deep had appeared in the spillway. [On February 11th](http://www.latimes.com/local/california/la-live-updates-oroville-dam-oroville-dam-spillway-expected-to-fail-1486953074-htmlstory.html), 
officials decided to begin using an auxiliary, spillway made from earthen materials. The emergency spillway quickly began to erode and water began to spill over its concrete top. On 
February 12th, due to the "hazardous situation" surrounding the dam, more than [200,000 people](http://www.npr.org/sections/thetwo-way/2017/02/14/515172686/with-more-rain-forecast-crews-work-to-reinforce-oroville-dam)
from downstream communities were ordered to evacuate the area.  
 
In this article we will analyze a dataset from the [California Department of Water Resources (CDWR)](https://cdec.water.ca.gov/index.html) looking at the several vital statistics from the
Oroville dam. This article provides **real-time analysis** with Chart Lab graphs (updated **hourly** with data taken from the CDWR website), which show the current situation at the Oroville dam. Additionally, this article illustrates 
how publicly available data from the California DWR can be easily loaded into the non-relational [Axibase Time Series Database (ATSD)](http://axibase.com/products/axibase-time-series-database/) 
for interactive analysis with graphical representation of open data published by government organizations. 

### Oroville Dam Dataset
------------------------

Let's begin by gathering current data for the Oroville dam from [cdec.water.ca.gov](https://cdec.water.ca.gov/index.html). This dataset can be found [here](https://cdec.water.ca.gov/cgi-progs/queryF?s=ORO&d=13-Feb-2017+02:57&span=1year). 

Data is collected hourly for the Oroville dam reservoir for the following metrics:

* Reservoir Elevation (feet)
* Reservoir Storage (acre-foot)
* Dam Outflow (cubic feet/second)
* Dam Inflow (cubic feet/second)
* Spillway Outflow (cubic feet/second)
* Rain (inches)
 
You can graph each of these metrics on the CDWR website. The website's graphical outputs, however, have very little interactive features. Ouput shows minimum and maximum values for a given range,
and you cannot toggle over the series to display any of the intermediate values. Additionally, you are only able to display one metric per graph. The CDWR website does not 
give any options for downloading the dataset. Using programs such as Excel to process this information can provide quick answers. However, when it comes to more in depth analysis, it is
much more convenient to interact with the data once it is loaded into a database.  

### Axibase Time Series Database (ATSD)
---------------------------------------

The [Axibase Time Series Database](http://axibase.com/products/axibase-time-series-database/) (ATSD) is a powerful tool when it comes to storing, analyzing, and visualising 
datasets. 

**You do not need to install ATSD to look the real-time Oroville dam analysis in this article**. 

If you are interested in reading more on the various capabilities of ATSD, check out our articles on [employee compensation numbers in Iowa](https://github.com/axibase/atsd-use-cases/blob/master/SocrataIowaCompensation/README.md) and
[Hawaii gas prices](https://github.com/axibase/atsd-use-cases/blob/master/HawaiiGasPrices/hawaii_gas_prices.md).

You can load the dataset into your ATSD instance by following the steps provided at the [end of the article](#action-items).

### The Current Situation - Realtime Analysis
---------------------------------------------

Below is a screenshot showing the change in capacity of the Oroville dam from Saturday February 11th, 2017, to the early hours of February 14th, 2017 (the time this article was published).
The threshold capacity is **3,537,577 af**, as marked by the orange line in the image. As a note, you can scroll over horizontally and up or down vertically by left-clicking and dragging in the direction you
would like to shift. We can see the approximate time that the dam **exceeded the threshold capacity** was between 2:00 and 3:00 am U.S. pacific time (PT) with 3,539,160 af recorded at 2:00 am on February 11th, and **returned to 
below this limit** between 11:00 pm on February 12th and 12:00 am (PT) on February 13th with 3,533,936 af recorded at midnight (both times marked below). Additionally, we can observe that the dam hit its peak storage 
of 3,578,686 af on Sunday February 12th at 3:00 am.  
    
![Figure 3](Images/Figure3.png)

You can explore this portal by clicking the button below:

[![](Images/button.png)](https://apps.axibase.com/chartlab/dee79515#fullscreen)

### Reservoir Storage Levels
----------------------------

Below is an image showing the change in reservoir storage per hour going back to February 2016 at the Oroville dam. The blue line represents the hourly, absolute value of the 
reservoir storage, with values shown on the left hand side of the graph. Change in the dam storage is represented by the yellow and green columns: yellow represents an increase
in the reservoir storage, while green represents a decrease. These delta values are displayed on the right hand side of the graph. Hourly delta values are not shown; rather, all 
hourly values are summed up and a total delta value for a single day is displayed.

![Figure 4](Images/Figure4.png)

Zooming into the last couple of months, we can take a look at how storage levels were changing at the time of the dam overflow.

![Figure 5](Images/Figure5.png)

Reservoir levels experienced their first significant uptick on December 10th, 2016, with an increase of 34,571 af added to the reservoir storage. Over the next several weeks,
the dam experienced increase in storage (with the exception of a handful of days). By toggling over each of the individual columns, we can see the change in the storage 
for February 9th (237,689 af), 10th (39,522 af), and 11th (53,896 af), which was when the dam was overtopped.      

You can explore this portal by clicking on the button below:
 
[![](Images/button.png)](https://apps.axibase.com/chartlab/dee79515/2#fullscreen)

### Reservoir Inflow and Outflows
---------------------------------

Below is an image showing dam inflow (orange) and outflow (dark green), as well as spillway outflow (light green), all given in cubic feet per second (cfs). The image below shows these values for February 14th at 3:00 am 
PT. At this time dam inflow is 30,805 cfs, dam outflow is 99,960 cfs, and spillway outflow is 118,031 cfs. The given number in light green (217,697 cfs) is the sum of the outflows.  
 
![Figure 6](Images/Figure6.png)

You can explore this portal by clicking on the button below:

[![](Images/button.png)](https://apps.axibase.com/chartlab/dee79515/5/#fullscreen)

### The Next Several Days
-------------------------

In the last several days, the storage level in the dam has dropped back down below the threshold capacity. The crisis, however, is not over quite yet. The main driving force behind
the Oroville dam disaster has been a record setting amount of rainfall in California. Below is an image showing daily precipitation totals together with the dam storage levels. 
By toggling over any of the columns, we can see the values and time of these variables. We can see that after a period of rainfall, storage levels experience almost an immediate hike. 

![Figure 7](Images/Figure7.png)

Below is a table of four of the most recent and significant rainfalls. We can see that periods having rainfall accumulations over 6 inches led to massive increases in dam storage 
levels. Periods with rainfall accumulation less than 4 inches experienced much less drastic increases.     
     
| Rainfall Period  | Accumulation (in) | Reservoir Storage Change (af) (Values at 12:00 pm PT) | Net Change (af) |
|------------------|-------------------|------------------------------------------------------------|-----------------| 
| Dec-07 to Dec-10 |      3.8          | 1,468,037 (Dec-06) to 1,586,443 (Dec-12) |    118,406      |
| Jan-07 to Jan-10 |      6.2          | 2,050,031 (Jan-06) to 2,830,139 (Jan-14) |  **780,108**    |
| Jan-18 to Jan-22 |      3.0          | 2,811,974 (Jan-17) to 2,884,036 (Jan-25) |     72,062      |
| Feb-02 to Feb-10 |      7.3          | 2,799,106 (Feb-05) to 3,578,686 (Feb-12) |  **779,580**    | 

You can explore this portal by clicking on the button below: 
 
[![](Images/button.png)](https://apps.axibase.com/chartlab/dee79515/7/#fullscreen)

Below is an image of the situation at the time this article was published. As of 23:00 pm PT on February 14th, the reservoir storage level was at 3,266,396 af, which is 271,181 af
less than the dam threshold. We can also see that for the last several days, the storage level has been decreasing. However, rain has been [forecast](https://weather.com/en/weather/tenday/l/95966:4:US) for the next several days.
If the total rain accumulation remains under 4 inches, the situation at the Oroville dam should continue to get better. If more than 6 inches accumulate, this could
result in a drastic storage level increase, again topping the threshold of the dam, and spelling a continuation of the disaster.   

![Figure 8](Images/Figure8.png)

Come back to this article in the coming days and look at our **real-time analysis** for updates on the Oroville dam. **You do not need to install ATSD** to continue to monitor
the situation. Simply by clicking on each of the **Chart Lab buttons**, you can keep up to date on dam storage levels, dam inflow, dam outflow, spillway outflow, and precipitation.

### Action Items
----------------

Below are the summarized steps to follow to install local configurations of ATSD and Axibase Collector for analyzing the Oroville dam disaster:

1. Install [Docker](https://docs.docker.com/engine/installation/linux/ubuntulinux/).
2. [Install the ATSD database](https://github.com/axibase/atsd-docs/blob/master/installation/docker.md#option-2-configure-collector-account-manually) on in your local Docker configuration. 
3. Save the [Oroville dam dataset](https://cdec.water.ca.gov/cgi-progs/queryF?s=ORO&d=13-Feb-2017+02:57&span=1year) in CSV format.
4. Login to ATSD by navigating to `https://docker_host:8443/`. 
5. Import the `cdec.water.ca.gov-shef-parser.xml` file into ATSD. For a more detailed description, refer to step 9 from the following [step-by-step walkthrough](https://github.com/axibase/atsd-use-cases/blob/master/USMortality/configuration.md) from our article on [U.S. mortality statistics](https://github.com/axibase/atsd-use-cases/blob/master/USMortality/README.md). 
6. Upload the Excel file saved in `.csv` format into ATSD. Refer to step 10 from this same walkthrough. 

If you require assistance in installing this software or have any questions, please feel free to [contact us](https://axibase.com/feedback/) and we would be happy to be of assistance!




