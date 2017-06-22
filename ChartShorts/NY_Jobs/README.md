New York City's Most Crowded Industries
===

![NY1](Images/NY_Jobs1.png)

[![](Images/button.png)](https://apps.axibase.com/chartlab/6402f01c/19/#fullscreen)

>Visualizations made using the [Axibase Time Series Database](https://axibase.com)

Running New York City is a big business. In fact, according to [data](https://catalog.data.gov/dataset/jobs-by-industry)
released by the State of New York that tracks employment figures by industry, the top two industries
are partially staffed or entirely staffed by government employees and the third position
is sure to include government staffers on the payroll as well. That's big news considering 
the state's annual budget for the current fiscal year (2017) was ranked second in the union at a whopping 
[$153 billion dollars](https://www.nysenate.gov/newsroom/articles/senate-passes-2017-18-state-budget-protects-taxpayers-provides-record-investments)
and the City of New York has its own [local budget](http://council.nyc.gov/budget/) that totals about half that number as well.
New York City and State officials have stood behind the expansion and implementation of the Affordable Care Act 
locally, which has seen the health care and social assistance industry add over 100,000 new jobs over the past four 
years in the Big Apple alone.

![NY2](Images/NY_Jobs3.png)

[![](Images/button.png)](https://apps.axibase.com/chartlab/6402f01c/20/)

Additionally, the number of working government positions in the city has increased by roughly 38,000
and using the SQL Console from the [Axibase Time Series Database](https://axibase.com),
statewide figures can be observed as well:

```sql
| tags.industry                                                            | total     | 
|--------------------------------------------------------------------------|-----------| 
| Health Care and Social Assistance                                        | 1490611.0 | 
| Government                                                               | 1461296.0 | 
| Retail Trade                                                             | 967686.0  | 
| Accommodation and Food Services                                          | 738279.0  | 
| Professional, Scientific, and Technical Services                         | 717452.0  | 
| Finance and Insurance                                                    | 517559.0  | 
| Administrative and Support and Waste Management and Remediation Services | 478621.0  | 
| Other Services (except Public Administration)                            | 472521.0  | 
| Manufacturing                                                            | 461920.0  | 
| Educational Services (Private)                                           | 443827.0  | 
| Construction                                                             | 440951.0  | 
| Wholesale Trade                                                          | 321104.0  | 
| Transportation and Warehousing                                           | 290617.0  | 
| Information                                                              | 266837.0  | 
| Real Estate and Rental and Leasing                                       | 212393.0  | 
| Arts, Entertainment, and Recreation                                      | 207120.0  | 
| Management of Companies and Enterprises                                  | 137955.0  | 
| Agriculture, Forestry, Fishing and Hunting                               | 43486.0   | 
| Unclassified Industry                                                    | 37759.0   | 
| Utilities                                                                | 37302.0   | 
| Mining, Quarrying, and Oil and Gas Extraction                            | 4708.0    | 

```

Using Big Data tools that are designed to operate in the [Socrata](https://github.com/axibase/axibase-collector/blob/master/jobs/socrata.md) 
environment, comprehensive and comprehensible visualizations can be made in order to process and
analyze tremendous amounts of publicly-available data and glean otherwise missed information to 
give your data implementation project an extra competitive edge.

