# Importing CSV Parsers

![](./images/parser.png)

CSV Parser is a collection of rules that describe how to read and translate CSV files into series, properties, and message commands inserted into the database. The parser contains instructions which columns contain entity names, metric names, timestamps, and command tags.

Follow this process to upload a CSV Parser configuration to your local ATSD instance.

1. Expand the **Data** menu and select **CSV Parsers**.

    ![](./images/data-csv-path.png)

2. From the **CSV** page, expand the split button, click **Import**.

    ![](./images/csv-import.png)

3. Select the appropriate XML file from your local machine. Click **Import**.

![](./images/import-parser-config.png)

Return to the **CSV** page to view the newly-uploaded CSV Parser.

## Uploading Multiple Configuration Files

Note that multiple files may be uploaded together or as an archive by opening the **Settings** menu, expanding the **Diagnostics** section, selecting the **Backup Import** page, and completing the form.

![](./images/backup-import.png)
