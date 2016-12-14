Creating Local Configurations for ATSD and Axibase Collector using Docker
=========================================================================

Below is a step-by-step walk through for setting up local configurations of ATSD and Axibase Collector. We will use Docker as our host.

1. Install Docker (Xenial Version 16.04). A link for how to install Docker can be found [here](https://docs.docker.com/engine/installation/linux/ubuntulinux/). 
2. Copy the `docker-compose.yml` file from our [GitHub](https://github.com/axibase/axibase-collector-docs/blob/master/docker-bundle.md) page. Save this file to whichever directory you are using
   in Terminal (i.e. Desktop, Documents).
3. In Terminal, launch containers with the below command:

   ```sql
   export USER=myuser; export PASSWORD=mypassword; docker-compose up -d 
   ```
4. Access the ATSD user interface by navigating to the address shown in the image below. Create a username and password. 

   <img src="Images/Figure11.png" width="600" >

5. After completing Step 4, you will be redirected to the page shown below. Login to ATSD with the username and password you just created.

    <img src="Images/Figure12.png" width="500" >
   
6. Access Axibase Collector by navigating to `https://localhost:9443`, and populate the username and password fields. After creating your username and password, you will be prompted to
   login. Enter in your username and password.

    <img src="Images/Figure13.png" width="500" >
    
    After setting up accounts for both ATSD and collector, navigate to **Storage Drivers** in Collector. We want to check if is there is a connection established between Collector and ATSD. 
    If **Write Status** is successful, this means that Collector can send data to ATSD. 
    
    ![Figure 34](Images/Figure34.png)

7. We now want to import a `.xml` job file, which contains rules for how, essentially, the data will be retrieved from the source, in our case [data.gov](https://catalog.data.gov/dataset/deaths-in-122-u-s-cities-1962-2016-122-cities-mortality-reporting-system). In Axibase Collector, click on the **Jobs** tab in the upper left hand corner.

   ![Figure 32](Images/Figure32.png)
   
   Upload the file titled `job.xml`, which can be found [here](https://github.com/axibase/atsd-use-cases/blob/master/USMortality/jobs.xml). Press **Import**.
 
   ![Figure 14](Images/Figure14.png)
    
8. Now click back on the **Jobs** tab. Only jobs that are **Enabled** are shown as the default. After importing, all jobs are automatically set to disabled. Select **ALL** as shown in the first image 
   below. Next, the name of the file that will show up in Collector is `socrata-cdc` (second image). Click on this job, check the **Enabled** checkbox, and hit **Save** as shown in the third figure.
   
   ![Figure 18](Images/Figure18.png)
   
   ![Figure 33](Images/Figure33.png)
      
   ![Figure 15](Images/Figure15.png)
   
9. Navigate back the **Jobs** tab. Since we set `socrata-cdc` to **Enabled**, it shows up by default. Hit **Run**. After a few seconds, refresh your browser. If the data was successfully retrieved
   by Collector, you should see an output as shown in the second image below.

   ![Figure 16](Images/Figure16.png)
   
   ![Figure 17](Images/Figure17.png)
   
10. Now, navigate to the **Entities** tab in ATSD. We can see that the job has created a new entity in ATSD, with the name `mr8w-325u`.  
   
   ![Figure 19](Images/Figure19.png)
   
11. Next, click on **Configuration -> Replacement Tables**.
   
   ![Figure 20](Images/Figure20.png)
   
12. Copy and paste the files included in this repository ([`city-size`](https://github.com/axibase/atsd-use-cases/blob/master/USMortality/city-size) and [`us-regions`](https://github.com/axibase/atsd-use-cases/blob/master/USMortality/us-regions)) into the Replacement Table. Click **Save**. `city-size` contains 2015 population figures for each of the
    122 cities included in this dataset. `us-regions` is a list of all of the regions (i.e. 1=New-England, 2=Middle-Atlantic etc.). These will be used later in this article for performing
    queries. 
   
   ![Figure 21](Images/Figure21.png)
   
13. Navigate to **Configuration -> Parsers:CSV** and import the `parser.xml` file.
 
   ![Figure 22](Images/Figure22.png)
   
   ![Figure 23](Images/Figure23.png)
   
   ![Figure 24](Images/Figure24.png)
   
14. After the parser has been added, we will proceed to uploading our [`us.population.csv`](https://github.com/axibase/atsd-use-cases/blob/master/USMortality/us.population.csv) file. This file contains population estimates from [census.gov](https://http://www.census.gov/data.html) for all 122 cities for 1960, 1970, 1980, 1990, 2000, 2010,
    and 2015. This file will be used for our queries. Click again on the **Parsers:CSV** dropdown. Then, click on the **Upload** button and then select the `us.population.csv` file.          
   
   ![Figure 25](Images/Figure25.png)
   
   ![Figure 26](Images/Figure26.png)
   
   Click on the **To submitted tasks** button.
   
   ![Figure 27](Images/Figure27.png)
   
   If the upload was success, you should see something like the below image. 
   
   ![Figure 28](Images/Figure28.png)
   
15. Next, navigate to **Metrics** and enter in `us.population` into the **Name Mask** bar.     
   
   ![Figure 29](Images/Figure29.png)
   
   Select **Series**. If the data was parsed successfully, you should see something like the second image. 
   
   ![Figure 30](Images/Figure30.png)
   
   ![Figure 31](Images/Figure31.png)
   
We are now ready to begin querying our dataset. [Here](https://github.com/axibase/atsd-use-cases/blob/master/USMortality/README.md#axibase-sql-query-language) is a link back to the article.