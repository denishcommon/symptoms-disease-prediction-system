<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Disease Prediction System from Scratch</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/prism/1.21.0/themes/prism-tomorrow.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
</head>
<body>
    <div class="header">
        <div class="navbar">
            <div class="logo">
                Disease Prediction System
                <span class="tag report">Report In Process</span>
            </div>

            <ul class="nav-links">
                <li class="nav-link"><a class="active" href="/">Home</a></li>
                <li class="nav-link"><a href="/predict">Predict</a></li>
                <li class="nav-link"><a class="/downloads" href="/downloads">Downloads</a></li>
            </ul>
        </div>
    </div>


    <div class="container">
        <div class="context-list">
            <ul style="list-style-type: decimal;">
                <li><a href="/dts-overview">Decision Tree Algorithm - Overview & Flow</a>
                    <ul style="list-style-type: decimal;">
                        <li><a href="/dts-overview#dts-pseudocode">Decision Tree Algorithm Pseudocode</a></li>
                        <li><a href="/dts-overview#dts-flow">Flow of Algorithm</a></li>
                    </ul>
                </li>
                <li><a href="/dts-entropy">Best feature to split the data?</a>
                    <ul style="list-style-type: decimal;">
                        <li><a href="/dts-entropy#dts-feature-selection">Feature Selection</a></li>
                        <li><a href="/dts-entropy#dts-entropy">Entropy</a></li>
                        <li><a href="/dts-entropy#dts-uncertainity-value">Uncertainity Value</a></li>
                        <li><a href="/dts-entropy#dts-best-worst-case">Best and worst case scenarios for making predictions?</a></li>
                        <li><a href="/dts-entropy#dts-overall-entropy">Overall Entropy</a></li>
                        <li><a href="/dts-entropy#dts-potential-splits">Potential Splits</a></li>
                        <li><a href="/dts-entropy#dts-best-split-feature">Best feature to split the data? (reviewed)</a></li>
                    </ul>
                </li>
                <li><a href="/dts-code-helper">Code - Helper Class & Functions</a>
                    <ul style="list-style-type: decimal;">
                        <li><a href="/dts-code-helper#dts-code-data-class">Data Class</a></li>
                        <li><a href="/dts-code-helper#dts-code-independent">Independent Helper Class & Functions</a>
                            <ul style="list-style-type: decimal;">
                                <li><a href="/dts-code-helper#dts-code-keyvaluepair-class">KeyValuePair Class</a></li>
                                <li><a href="/dts-code-helper#dts-code-getuniquevalues-function">getUniqueValues Function</a></li>
                                <li><a href="/dts-code-helper#dts-code-getfrequency-function">getFrequency Function</a></li>
                                <li><a href="/dts-code-helper#dts-code-getindexofmaxfrequency-function">getIndexOfMaxFrequency Function</a></li>
                                <li><a href="/dts-code-helper#dts-code-readdata-function">readData Function</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li><a href="/dts-code-main">Code - Main Algorithm</a>
                    <ul style="list-style-type: decimal;">
                        <li><a href="/dts-code-main#dts-code-necessary">Necessary Functions</a>
                            <ul style="list-style-type: decimal;">
                                <li><a href="/dts-code-main#dts-code-checkpurity-function">checkPurity Function</a></li>
                                <li><a href="/dts-code-main#dts-code-classifydata-function">classifyData Function</a></li>
                                <li><a href="/dts-code-main#dts-code-getpotentialsplits-function">getPotentialSplits Function</a></li>
                                <li><a href="/dts-code-main#dts-code-splitdata-function">splitData Function</a></li>
                                <li><a href="/dts-code-main#dts-code-calculateentropy-function">calculateEntropy Function</a></li>
                                <li><a href="/dts-code-main#dts-code-calculateoverallentropy-function">calculateOverallEntropy Function</a></li>
                                <li><a href="/dts-code-main#dts-code-determinebestsplit-function">determineBestSplit Function</a></li>
                            </ul>
                        </li>
                        <li><a href="/dts-code-main#dts-code-tree">Build Decision Tree</a></li>
                        <li><a href="/dts-code-main#dts-code-classify">Classify Test Data</a></li>
                        <li><a href="/dts-code-main#dts-code-execution">Main Program to Build and Test Decision Tree</a></li>
                    </ul>
                </li>
            </ul>
        </div>

        <div class="block">
            <h1 id="dts-code-helper">3 &mdash; Helper Class & Functions</h1>
            <p>
                In this article, we will only code to handle categorical data and not continuous data (which is your part to do).
            </p>
            <br><br><br>
            <h2 id="dts-code-data-class">3.1 &mdash; Data Class</h2>
            <p>
                We will write code for <b>Data</b> class. Which will be used to store training and testing dataset. Every processing will be done on Data class.
            </p>
            <br>
            <div class="code">
                <pre><code class="language-java">// File: Data.java

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


/** Data class to store dataset that will be loaded from CSV file.
 */
public class Data {
    List&lt;DataValue> rows = new ArrayList&lt;DataValue>();


    public Data() {}
    public Data(List&lt;DataValue> rows) {
        this.rows = rows;
    }



    /** Get one row from the data and return as Data class.
     */
    public Data getOne(int index) {
        List&lt;DataValue> row = new ArrayList&lt;DataValue>();
        row.add(rows.get(index));
        return new Data(row);
    }



    /** Get sub data from the data and return as Data class.
     */
    public Data get(int rowCount) {
        return new Data(rows.subList(0, rowCount));
    }
    public Data get(int fromIndex, int rowCount) {
        return new Data(rows.subList(fromIndex, rowCount));
    }
    


    /** Get all the values from the column and return as List of String.
     */
    public List&lt;String> getColumn(int columnIndex) {
        List&lt;String> tempColumn = new ArrayList&ltString>();

        for (int i=0; i < rows.size(); i++) {
            tempColumn.add(rows.get(i).values.get(columnIndex));
        }

        return tempColumn;
    }



    /** Convert Data class to 2D List of String to print it for verification.
     */
    public List&lt;List&lt;String>> toList() {
        List&lt;List&lt;String>> tempList = new ArrayList&lt;List&lt;String>>();

        for (DataValue row: rows) {
            tempList.add(row.values);
        }
        
        return tempList;
    }



    /** Get length of the data. (Size of rows)
     */
    public Integer getLength() {
        return rows.size();
    }



    /** Get all the unique values from the column and return as List of String.
     */
    public List&lt;String> getUniqueValues(int columnIndex) {
        String[] uniqueValues = this.getColumn(columnIndex).stream().distinct().toArray(String[]::new);
        return Arrays.asList(uniqueValues);
    }



    /** Get shape of the data. (Rows x Columns)
     */
    public List&lt;Integer> getShape() {
        List&lt;Integer> tempShape = new ArrayList&lt;Integer>();
        tempShape.add(rows.size());
        if (rows.size() > 0) {
            tempShape.add(rows.get(0).values.size());
        } else { tempShape.add(0); }
        return tempShape;
    }
}
</code></pre>
            </div>
            <br>
            <p>
                Now Data class is dependent on <b>DataValue</b> class, which hold the values of columns. Let's code DataValue class.
            </p>
            <br>
            <div class="code">
                <pre><code class="language-java">// File: DataValue.java
                    
import java.util.ArrayList;
import java.util.List;


/** DataValue class to store value of columns.
    One DataValue class represent the column values for one row.
 */
public class DataValue {
    List&lt;String> values = new ArrayList&lt;String>();


    public DataValue() {}
    public DataValue(List&lt;String> values) {
        this.values = values;
    }
}
</code></pre>
            </div>
            <br><br><br>
            <h2 id="dts-code-independent">3.2 &mdash; Independent Helper Class & Functions</h2>
            <p>
                We need some class and functions to process the data independently. That means, it doesn't take part in algorithm process. Let's code those class and functions!!
            </p>
            <br><br>
            <h3 id="dts-code-keyvaluepair-class">3.2.1 &mdash; KeyValuePair Class</h3>
            <p>
                KeyValuePair Class is to store related values as Key and Value. Value is mapped to the Key.
            </p>
            <br>
            <div class="code">
                <pre><code class="language-java">// File: KeyValuePair.java

/** KeyValuePair Class stores related value pair.
    K: DataType of Key.
    V: DataType of Value.
 */
public class KeyValuePair&lt;K, V> {
    K key;
    V value;

    public KeyValuePair() {}
    public KeyValuePair(K key, V value) {
        this.key = key;
        this.value = value;
    }
}
</code></pre>
            </div>
            <br><br>
            <h3 id="dts-code-getuniquevalues-function">3.2.2 &mdash; getUniqueValues Function</h3>
            <div class="code" style="margin-top: 10px;">
                <pre><code class="language-java">/** Get unique all values from List of String.
 */
public static List&lt;String> getUniqueValues(List&lt;String> values) {
    String[] uniqueValues = values.stream().distinct().toArray(String[]::new);
    return Arrays.asList(uniqueValues);
}
</code></pre>
            </div>
            <br><br>
            <h3 id="dts-code-getfrequency-function">3.2.3 &mdash; getFrequency Function</h3>
            <div class="code" style="margin-top: 10px;">
                <pre><code class="language-java">/** Get frequency of all unique values from List of String. i.e. number of occurance of unique values in the list.
    Returns KeyValuePair&lt;String, Integer>
    String: Unique value.
    Integer: Count of unique value.
 */
 public static List&lt;KeyValuePair&lt;String, Integer>> getFrequency(List&lt;String> uniqueValues, List&lt;String> list) {
    List&lt;KeyValuePair&lt;String, Integer>> tempList = new ArrayList&lt;KeyValuePair&lt;String, Integer>>();

    for (String s: uniqueValues) {
        tempList.add(new KeyValuePair&lt;String, Integer>(s, Collections.frequency(list, s)));
    }

    return tempList;
}
</code></pre>
            </div>
            <br><br>
            <h3 id="dts-code-getindexofmaxfrequency-function">3.2.4 &mdash; getIndexOfMaxFrequency Function</h3>
            <div class="code" style="margin-top: 10px;">
                <pre><code class="language-java">/** Get index of maximum frequency from frequency list.
 */
 public static Integer getIndexOfMaxFrequency(List&lt;Integer> frequencyList) {
    Integer max = frequencyList.get(0);
    for (Integer x: frequencyList) {
        if (x > max) { max = x; }
    }         
    return frequencyList.indexOf(max);
}
</code></pre>
            </div>
            <br><br>
            <h3 id="dts-code-readdata-function">3.2.5 &mdash; readData Function</h3>
            <div class="code" style="margin-top: 10px;">
                <pre><code class="language-java">/** Read data from CSV file and build Data class from it and returns List of Object.
    Return Object 1: Row Count
    Return Object 2: Column Count
    Return Object 3: Data Class
    Return Object 4: Column Header (List of Column Name)
 */
public static List&lt;Object> readData(String filePath) {
    String line = "";
    String delimiter = ",";

    Integer rowCount = 0;
    Integer columnCount = 0;
    Data tempData = new Data();
    List&lt;String> columnHeaders = new ArrayList&lt;String>();

    List&lt;Object> tempList = new ArrayList&lt;Object>();

    try {
        BufferedReader br = new BufferedReader(new FileReader(filePath));

        List&lt;DataValue> tempDataValues = new ArrayList&lt;DataValue>();
        
        while ((line = br.readLine()) != null) {
            String[] rowValues = line.split(delimiter);

            if (rowCount == 0) {
                for (int i=0; i < rowValues.length; i++) {
                    columnHeaders.add(rowValues[i]);
                    columnCount++;
                }

            } else {
                List&lt;String> tempDataValue = new ArrayList&lt;String>();

                for (int i=0; i < rowValues.length; i++) {
                    tempDataValue.add(rowValues[i]);
                }

                tempDataValues.add(new DataValue(tempDataValue));
            }

            rowCount++;
        }

        br.close();

        tempData = new Data(tempDataValues);

        tempList.add(rowCount);
        tempList.add(columnCount);
        tempList.add(tempData);
        tempList.add(columnHeaders);
    } catch (Exception e) { e.printStackTrace(); }

    return tempList;
}
</code></pre>
            </div>
        </div>

        <div class="block">
            <div class="credits">
                <p>Just someone trying to explain his understanding of data science concepts.</p>
            </div>
        </div>

        <div class="block" style="display: flex; grid-gap: 10px;">
            <a href="/dts-entropy" class="btn">Previous Part: Best feature to split the data?</a>
            <a href="/dts-code-main" class="btn">Next Part: Code - Main Algorithm</a>
        </div>
    </div>

    <div class="footer">
        Java Mini Project by Denish Sharma &copy; 2020 (Terna Engineering College).
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.21.0/components/prism-core.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.21.0/plugins/autoloader/prism-autoloader.min.js"></script>
    <script>
        
    </script>
</body>
</html>