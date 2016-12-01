![TitlePhoto](Images/TitlePhoto.png)

Knockin on Heaven's Door - Computing U.S. Mortality Statistics 
==============================================================

### Introduction
----------------

Death. Along with taxes, it is one of the few certainties in life. While we all will meet our end some day, the end is becoming farther and farther away and the risk of death is decreasing.
According to [infoplease.com](http://www.infoplease.com/ipa/A0005148.html), life expectancy from 1935 to 2010 for both sexes in the U.S. increased from 61.7 to 78.7 years. 
According to the [Center for Disease Control and Prevention (CDC)](http://www.cdc.gov/nchs/data/databriefs/db88.htm#x2013;2010%3C/a%3E>), the crude death rate in the United States fell from 1,094.5 to 798.7 deaths per 100,000 people from 1935 to 2010, translating to 
a 27% decrease. However, the population of the U.S. as a whole was getting older during this time period. When this affect of aging was removed from calculation, the CDC estimates that the age
adjusted **risk of dying dropped by 60 percent from 1935 to 2010**. 
 
The death rate for the 1 to 4 years of age group dropped by **94 percent** from 1935 to 2010.
 
The death rate for the 65 to 74 years of age group dropped by **62 percent** from 1935 yo 2010.  

Below is an image showcasing the percent change in death rates by age in the U.S. from the [CDC](http://www.cdc.gov/nchs/data/databriefs/db88_fig3.png):

![Figure 1](Images/Figure1.png)

In this article we will look at weekly death total statistics collected for over 100 cities for over 50 years. We will next incorporate population figures to calculate mortality rates for each
individual city. We also will explore additional datasets to see if there are any correlations between their behavior and that of our computed mortality rates. As the icing on the cake, we will
walk through Axibase's powerful SQL capabilities to help make sense and digest all of this information on death in the United States.  

### Death Statistics for 122 U.S. Cities
------------------------------------

Let's take a look at the dataset **Deaths in 122 U.S. cities - 1962-2016. 122 Cities Mortality Reporting System** from data.gov.

This dataset can be found here: [https://catalog.data.gov/dataset/deaths-in-122-u-s-cities-1962-2016-122-cities-mortality-reporting-system](https://catalog.data.gov/dataset/deaths-in-122-u-s-cities-1962-2016-122-cities-mortality-reporting-system)

This file contains data for the weekly death totals collected from 1962 to 2016 in 122 U.S. cities. The system was retired on October 6th, 2016. While the system was running, the vital statistics
offices of 122 cities across the United States reported the total number of death certificates processed and the number of those for which pneumonia or influenza was listed as the underlying 
or contributing cause of death by age group. Deaths from under the age of 1 year are not included in this dataset. Deaths in this dataset are split into the following categories:

* 1 - 24 years (all causes of death)
* 25 - 44 years (all causes of death)
* 45 - 64 years (all causes of death)
* 65 + years (all causes of death)
* All deaths
* Pneumonia and influenza deaths

In the Appendix of this article, you can can find a complete list of the cities (with their corresponding state) included in this dataset.

Deaths can be sorted by geographic region, all of which are shown below.  

1 - Connecticut (CT), Massachusetts (MA), Rhode Island (RI)
2 - Pennsylvania (PA), New Jersey (NJ), New York (NY)
3 - Illinois (IL), Indian (IN), Michigan (MI), Ohio (OH), Wisconsin (WI)
4 - Iowa (IA), Kansas (KS), Minnesota (MN), Missouri (MO), Nebraska (NE)
5 - Delaware (DE), District of Columbia (DC), Florida (FL), Georgia (GA), Maryland (MD), North Carolina (NC), Virginia (VA)
6 - Alabama (AL), Kentucky (KY), Tennessee (TN)
7 - Arkansas (AR), Louisiana (LA), Oklahoma (OK), Texas (TX)
8 - Arizona (AZ), Colorado (CO), Idaho (ID), New Mexico (NM), Nevada (NV), Utah (UT)
9 - California (CA), Hawaii (HI), Oregon (OR), Washington (WA)

### Appendix 
---------

Akron (OH)
Albany (NY)
Albuquerque	(NM)
Allentown (PA)
Atlanta (GA)
Austin (TX)
Baltimore (MD)
Baton Rouge	LA
Berkeley (CA)
Birmingham (AL)
Boise (ID)
Boston (MA)
Bridgeport (CT)
Buffalo (NY)
Cambridge (MA)
Camden (NJ)
Canton (OH)
Charlotte (NC)
Chattanooga (TN)
Chicago (IL)
Cincinnati (OH)
Cleveland (OH)
Colorado Springs (CO)
Columbus (OH)
Corpus Christi (TX)
Dallas (TX)
Dayton (OH)
Denver (CO)
Des Moines (IA)
Detroit (MI)
Duluth (MN)
El Paso (TX)
Elizabeth (NJ)
Erie (PA)
Evansville (IN)
Fall River (MA)
Fort Wayne (IN)
Fort Worth (TX)
Fresno (CA)
Gary (IN)
Glendale (CA)
Grand Rapids (MI)
Hartford (CT)
Honolulu (HI)
Houston (TX)
Indianapolis (IN)
Jacksonville (FL)
Jersey City (NJ)
Kansas City (KS)
Kansas City	(MO)
Knoxville (TN)
Lansing (MI)
Las Vegas (NV)
Lexington (KY)
Lincoln (NE)
Little Rock	(AR)
Long Beach (CA)
Los Angeles	(CA)
Lowell (MA)
Lynn (MA)
Memphis (TN)
Miami (FL)
Milwaukee (WI)
Minneapolis (MN)
Mobile (AL)
Montgomery (AL)
Nashville (TN)
New Bedford (MA)
New Haven (CT)
New Orleans (LA)
New York (NY)
Newark (NJ)
Norfolk	(VA)
Ogden (UT)
Omaha (NE)
Pasadena (CA)
Paterson (NJ)
Peoria (IL)
Philadelphia (PA)
Phoenix	(AZ)
Pittsburgh (PA)
Portland (OR)
Providence (RI)
Pueblo (CO)
Reading	(PA)
Richmond (VA)
Rochester (NY)
Rockford (IL)
Sacramento (CA)
Saint Louis (MO)
Saint Paul (MN)
Saint Petersburg (FL)
Salt Lake City (UT)
San Antonio	(TX)
San Diego (CA)
San Francisco (CA)
San Jose (CA)
Santa Cruz (CA)
Savannah (GA)
Schenectady (NY)
Scranton (PA)
Seattle	(WA)
Shreveport (LA)
Somerville (MA)
South Bend (IN)
Spokane	(WA)
Springfield	(MA)
Syracuse (NY)
Tacoma (WA)
Tampa (FL)
Toledo (OH)
Trenton (NJ)
Tucson (AZ)
Tulsa (OK)
Utica (NY)
Washington (DC)
Waterbury (CT)
Wichita (KS)
Wilmington (DE)
Worcester (MA)
Yonkers (NY)
Youngstown (OH)


