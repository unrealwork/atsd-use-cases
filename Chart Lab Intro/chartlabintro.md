![Titlephoto](Titlephoto.png)

Data Visualization with Chart Lab
==================================

###Introduction###
------------------

Are you looking for clear and concise graphical presentations for your datasets? Are wanting to explore different graphical outputs **all in one place**?

Chart Lab is just the thing you have been looking for!

Chart Lab is a versatile online tool which allows users to try out Axibase Time Series Database (ATSD) visualization capabilites. Chart Lab doesn't require any
registration and allows you to experiment with different layouts and widget settings prior to deploying it in your own ATSD instance.

The purpose of this article is to walk through and showcase all of the different features of Chart Lab.

###Chart Lab Features###
------------------------

A blank, customizeable Chart Lab portal for your use can be found here: **[BLANK](https://apps.axibase.com/chartlab/)**

Within Chart Lab each of the following items are included:

* Source � switch between data sources: random and ATSD
* Widget � append a sample widget to the current configuration
* Run - apply and view a portal based on current configuration
* Save � save current configuration under a new revision in the current directory
* Clone � save current configuration in a new directory
* Editor - toggle configuration editor

Below is an image of the standard Chart Lab configuraton.

![Figure 1](Figure1.png) 

###Source###
------------

Chart Lab supports two data sources:

1. Random data generator
2. ATSD with real, continuously updated data

![Figure 2](Figure2.png)

The Random data generator is a non-existent data set which invokes the math.random() javascript. As defined by the [Mozilla Developer Network](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random), 
this function returns a floating-point, pseudo-random number in the range [0,1], which is inclusive from 0 up to but not including 1. This range can 
be scaled to fit any desired dataset. These numbers have no meaning or value; every 60 seconds new random numbers are generated with the goal of merely
providing different ranges for visualization purposes. 
  
The ATSD data is real life data. Using Chart Lab the user is able to draw upon Axibase datasets. Once the user installs ATSD, they will be able to pull in 
their own data, which will be updated in real time as data is added to their datasets.

###Widget###
------------

Chart Lab contains each of the following Widgets, as shown in the image below. 

![Figure 3](Figure3.png)

Visualizations for each of these Widgets are displayed in the following link:
     
[https://axibase.com/products/axibase-time-series-database/visualization/widgets/](https://axibase.com/products/axibase-time-series-database/visualization/widgets/)

In Chart Lab Widgets are composed of both data and visual inputs. Data inputs determine the how datasets will be processed and visual inputs determine how
they will be presented.   

###Run###
---------

Once a **Source** and **Widget** have been selected, the user may then select **Run** to output a visualization. This will apply and view a portal based on 
Wiget current configuration. 

###Save###
----------

After a visualization has been output, the user has the option of selecting **Save** to save the current configuration under a new revision in the current 
directory. After pressing **Save**, the current configuration will be assigned a unique URL and a revision number. We will run through a quick example to
demonstrate this process.

1.	Open a blank Chart Lab portal.
2.	Select **Random** as the Source.
3.	Select **Run** to output a visualization.
4.	At this point, we have the option to save our current configuration. Select **Save**.

	![Figure 4](Figure4.png)

	After saving, our configuration has been assigned a unique URL and revision number, in this case **https://apps.axibase.com/chartlab/a9977177** and **1**.
	It is worth noting that for a Random Source, that, because of the math.random() javascipt, unique values will not end up being saved. The configuration
	has been saved, but regardless random values will continue to be output afer every 60 seconds.
	
	Let us continue with saving a second revision.

5.	Change Source to **ATSD**.
6.	Select **Save**.

	![Figure 5](Figure5.png)
	
	After saving for a second time, this second configuration has been assigned a totally unique URL and revision number, in this case **https://apps.axibase.com/chartlab/a9977177/2/** and **2**.
	Since **ATSD**, which contains real data, was selected as the Source, both the configuration and the data values will be saved.

	Let us continue with saving a third revision.

7.	Change the **max-range** from 100 to 80.

	![Figure 6](Figure6.png)

8.	Select **Save**.

	![Figure 7](Figure7.png)

	After saving for a third time, this third configuration has been assigned a totally unique URL and revision number, in this case **https://apps.axibase.com/chartlab/a9977177/3/** and **3**.
	Since **ATSD**, which contains real data, was selected as the Source, both the configuration and the data values will be saved. The only change was altering the maximum range from 100 to 80.

	Now the user has the options of toggling between each of the three saved revisions. 
	
	![Figure 8](Figure8.png)





