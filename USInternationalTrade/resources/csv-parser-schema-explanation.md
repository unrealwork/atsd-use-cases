## Description of schema based parser
The CSV file represents table  structure, for example, our script uses for parsing 
the following file:

```csv
year,CTY_CODE,CTYNAME,IJAN,...,IDEC,IYR,EJAN,...,EDEC,EYR
1985,0001,OPEC,1733,...,2426,22801,1033,...,1186,12478
1986,0001,OPEC,2631,...,1327,19751,947,...,813,10844
1987,0001,OPEC,1344,...,1883,23952,739,...,1146,11057
```

that represents the table structure, first line uses for headers:

| year | CTY_CODE | CTYNAME | IJAN | ... | IDEC | IYR   | EJAN | ... | EDEC | EYR   | 
|------|----------|---------|------|-----|------|-------|------|-----|------|-------| 
| 1985 | 0001     | OPEC    | 1733 | ... | 2426 | 22801 | 1033 | ... | 1186 | 12478 | 
| 1986 | 0001     | OPEC    | 2631 | ... | 1327 | 19751 | 947  | ... | 813  | 10844 | 
| 2016 | 0001     | OPEC    | 1344 | ... | 1883 | 23952 | 739  | ... | 1146 | 11057 | 

There is our CSV parser schema:
 
```javascript
select('#row=2-*')
    .select('#col=4-28')
    .filter(!cell(1,col).endsWith('YR'))
    .filter(cell(row,1) != 2016 || cell(1,col).substring(1) != 'DEC')
    .addSeries()
    .entity('usa')
    .metric('us-trade-' + (cell(1,col).startsWith('E')?'export':'import') )
    .tag('ctyname', cell(row, 3))
    .tag('cty_code', cell(row,2))
    .timestamp(cell(row,1)+'-'+cell(1,col).substring(1));
```

#### Select rows

```javascript
select('#row=2-*')
```

The following method select elements from the table for following handling that described in passed in expression.
In our case `'#row=2-*'`  means that we want to select all rows since the row with index 2 ( the first row has index 1).

After execution we will work with following table's cells:

|  Index | 1   | 2    | 3    | 4    |5-14 | 15   | 16    | 17   |18-27|   28|  29   | 
|------|------|------|------|------|-----|------|-------|------|-----|------|-------| 
| **2** | 1985 | 0001 | OPEC | 1733 | ... | 2426 | 22801 | 1033 | ... | 1186 | 12478 | 
| **3** | 1986 | 0001 | OPEC | 2631 | ... | 1327 | 19751 | 947  | ... | 813  | 10844 | 
| **4** | 1987 | 0001 | OPEC | 1344 | ... | 1883 | 23952 | 739  | ... | 1146 | 11057 |
 
#### Select columns  
 
 ```javascript
 select('#col=4-28')
 ```
This expression `'#col=4-28''` means that we want select all columns with indexes from 4 to 28. After selection we will work with the following cells:

|  Index | 4    |5-14 | 15   | 16    | 17   |18-27|   28 |
|-------|-------|-----|------|-------|------|-----|------|
| **2** |  1733 | ... | 2426 | 22801 | 1033 | ... | 1186 | 
| **3** |  2631 | ... | 1327 | 19751 | 947  | ... | 813  |  
| **4** |  1344 | ... | 1883 | 23952 | 739  | ... | 1146 |
 
#### Filter our cells

We don't want to select columns that contain in a column that describes summary values for the year. The columns end with `YR` suffix.

```javascript
 filter(!cell(1,col).endsWith('YR'))
```

For filtering cells, we use `filter` command that takes boolean condition as param.
The method goes through every cell and checks it for the condition.
Let us consider our condition. 

##### Current indexes: `row` and `col`
When we are iterating through cell we can retrieve values of column's and row's indexes by `row` and  `col` variables accordingly.

##### Method `cell` 
Cell method return value of the cell with listed indexes of row and column.

For example, for the first iteration, we will retrieve a value of the cell that contains the first row in the fourth column. And it has value `IJAN`.

##### Standard Javascript methods 
The cell method return value as a string, and we can use standard javascript call methods and properties from [String](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String) class.
We will use method [endsWith](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String) to determine whether a string ends with `YR` string.

##### Filtering cells
We discard column with header `IYR` from our cells and
 we will work with following cells:

|  Index | 1   | 2    | 3    | 4    |5-14 | 15  | 17   |18-27|   28  | 
|------|------|------|------|------|-----|------|------|-----|-------|
| **2** | 1985 | 0001 | OPEC | 1733 | ... | 2426 | 1033 | ... | 1186 | 
| **3** | 1986 | 0001 | OPEC | 2631 | ... | 1327 | 947  | ... | 813  | 
| **4** | 1987 | 0001 | OPEC | 1344 | ... | 1883 | 739  | ... | 1146 |


#### Filter last missing data

We want to discard data for December of 2016 and we will use the following filter for it

```javascript
filter(cell(row,1) != 2016 || cell(1,col).substring(1) != 'DEC')
```

For example for first iteration we will check following condition:

```javascript
filter((1985 != 2016) || ('JAN' != 'DEC'))
```
that equals true

#### Add Series 

We will use `addSeries()` method to add series for each cells.

```javascript
addSeries()
```

After filtering our cells, we will iterate through cells and use cell value as `series` value. But we need to specify necessary series fields.

##### Series fields
###### 1.  Entity
    
   We should specify entity with `entity` method that takes entity name as string param. 
   
   ```javascript
    entity('usa')
   ```
    
###### 2.  Metric
   To specify metrc we can use `metric` command.
    
   ```javascript
    metric('us-trade-' + (cell(1,col).startsWith('E')?'export':'import') )
   ```
   
   Then we decide what metric we will use for the series
    Our metric depends on the first letter in column header if header starts with 'E' we will use 'us-trade-export' else the name of metric will be 'us-trade-import'

###### 3. Tags
   We can specify tags by `tag` method that takes `key` and `value` of a tag as param.
   
   ```javascript
        tag('ctyname', cell(row, 3))
        .tag('cty_code', cell(row,2))
   ```
   
   By the following methods we specify tags  `ctyname` and `cty_code` tags.
        
###### 4. Timestamp
   We should represent appropriate string that describes time of series' sample,
   and then will be parsed by some timestamp pattern. We can do it by the `timestamp` method:
   ```javascript
   timestamp(cell(row,1)+'-'+cell(1,col).substring(1))
   ```
###### Result   
   
   In our case, we pass a  string that is a result of concatenating value of the first column in the row and a substring of current column's header.
    
For example for first iteration we get series with following fields:
 
 
| Date                 | Metric          | Entity | Tags                             | Value | 
|----------------------|-----------------|--------|----------------------------------|-------| 
| 1985-01-01T00:00:00Z | us-trade-import | usa    | cty_code = 0001, ctyname = OPEC  | 1,733 | 


