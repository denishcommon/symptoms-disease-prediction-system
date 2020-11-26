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
            <h1 id="dts-code-main">4 &mdash; Main Algorithm</h1>
            <p>
                In this section, we will code necessary functions and execution of classifier.
            </p>
            <br><br><br>
            <h2 id="dts-code-necessary">4.1 &mdash; Necessary Functions</h2>
            <p>
                We need to code necessary helper functions which will take part in algorithm.
            </p>
            <br><br>
            <h3 id="dts-code-checkpurity-function">4.1.1 &mdash; checkPurity Function</h3>
            <div class="code" style="margin-top: 10px;">
                <pre><code class="language-java">/** Check purity of the data and returns boolean value.
    Returns true if there is only one unique target (label) value. (Pure Data)
    Returns false if there are more than one unique target (label) values. (Impure Data)
 */
public static boolean checkPurity(Data data) {
    List&lt;String> uniqueTargets = getUniqueValues(data.getColumn(data.getShape().get(1) - 1));

    if (uniqueTargets.size() == 1) {
        return true;
    } else {
        return false;
    }
}
</code></pre>
            </div>
            <br><br>
            <h3 id="dts-code-classifydata-function">4.1.2 &mdash; classifyData Function</h3>
            <div class="code" style="margin-top: 10px;">
                <pre><code class="language-java">/** Classify the data and returns KeyValuePair&lt;String, Integer>
    String: Class label (target value)
    Integer: Index of Class in Label column.
 */
public static KeyValuePair&lt;String, Integer> classifyData(Data data) {
    List&lt;String> uniqueTargets = getUniqueValues(data.getColumn(data.getShape().get(1) - 1));
    List&lt;KeyValuePair&lt;String, Integer>> frequencyPair = getFrequency(uniqueTargets, data.getColumn(data.getShape().get(1) - 1));

    List&lt;String> frKeys = new ArrayList&lt;String>();
    List&lt;Integer> frValues = new ArrayList&lt;Integer>();

    for (KeyValuePair&lt;String, Integer> k: frequencyPair) {
        frKeys.add(k.key);
        frValues.add(k.value);
    }

    Integer index = getIndexOfMaxFrequency(frValues);
    String target = frKeys.get(index);

    return new KeyValuePair&lt;String, Integer>(target, index);
}
</code></pre>
            </div>
            <br><br>
            <h3 id="dts-code-getpotentialsplits-function">4.1.3 &mdash; getPotentialSplits Function</h3>
            <div class="code" style="margin-top: 10px;">
                <pre><code class="language-java">/** Returns List of all Potential Splits from the data as List&lt;List&lt;String>>
 */
public static List&lt;List&lt;String>> getPotentialSplits(Data data) {
    Integer columnShape = data.getShape().get(1);

    List&lt;List&lt;String>> potentialSplits = new ArrayList&lt;List&lt;String>>();

    for (int i=0; i < columnShape - 1; i++) {
        List&lt;String> columnvalues = data.getColumn(i);
        List&lt;String> uniqueValues = getUniqueValues(columnvalues);

        potentialSplits.add(uniqueValues);
    }

    return potentialSplits;
}
</code></pre>
            </div>
            <br><br>
            <h3 id="dts-code-splitdata-function">4.1.4 &mdash; splitData Function</h3>
            <div class="code" style="margin-top: 10px;">
                <pre><code class="language-java">/** Splits the data with respect to split value into two subsets of data as Data Below and Data Above.
    Returns List of Data containing Data Below and Data Above respectively.
 */
public static List&lt;Data> splitData(Data data, int splitColumn, String splitValue) {
    List&lt;String> splitColumnValues = data.getColumn(splitColumn);

    Data dataBelow = new Data();
    Data dataAbove = new Data();

    List&lt;DataValue> dataBelowRows = new ArrayList&lt;DataValue>();
    List&lt;DataValue> dataAboveRows = new ArrayList&lt;DataValue>();

    for (int i=0; i < splitColumnValues.size(); i++) {
        if (splitColumnValues.get(i).equals(splitValue)) {
            dataBelowRows.add(data.rows.get(i));
        } else {
            dataAboveRows.add(data.rows.get(i));
        }
    }

    dataBelow = new Data(dataBelowRows);
    dataAbove = new Data(dataAboveRows);

    List&lt;Data> tempData = new ArrayList&lt;Data>();
    tempData.add(dataBelow);
    tempData.add(dataAbove);

    return tempData;
}

// This overload takes best split value as an input.
public static List&lt;Data> splitData(Data data, KeyValuePair&lt;Integer, String> split) {
    return splitData(data, split.key, split.value);
}
</code></pre>
            </div>
            <br><br>
            <h3 id="dts-code-calculateentropy-function">4.1.5 &mdash; calculateEntropy Function</h3>
            <div class="code" style="margin-top: 10px;">
                <pre><code class="language-java">/** Calculates shannon entropy of the data and returns a float value.
 */
public static Float calculateEntropy(Data data) {
    List&lt;String> uniqueTargets = getUniqueValues(data.getColumn(data.getShape().get(1) - 1));
    List&lt;KeyValuePair&lt;String, Integer>> frequencyPair = getFrequency(uniqueTargets, data.getColumn(data.getShape().get(1) - 1));

    List&lt;String> frKeys = new ArrayList&lt;String>();
    List&lt;Integer> frValues = new ArrayList&lt;Integer>();
    for (KeyValuePair&lt;String, Integer> k: frequencyPair) {
        frKeys.add(k.key);
        frValues.add(k.value);
    }

    Integer sumOfFrequency = frValues.stream().mapToInt(Integer::intValue).sum();
    List&lt;Float> probabilities = new ArrayList&lt;Float>();
    for (Integer i: frValues) {
        probabilities.add(i.floatValue() / sumOfFrequency.floatValue());
    }

    List&lt;Float> logValues = new ArrayList&lt;Float>();
    for (Float f: probabilities) {
        logValues.add((float)(Math.log(f) / Math.log(2)));
    }

    List&lt;Double> entropyValues = new ArrayList&lt;Double>();
    for (int i=0; i < logValues.size(); i++) {
        entropyValues.add((double)(probabilities.get(i) * -(logValues.get(i))));
    }

    return (float)entropyValues.stream().mapToDouble(Double::doubleValue).sum();
}
</code></pre>
            </div>
            <br><br>
            <h3 id="dts-code-calculateoverallentropy-function">4.1.6 &mdash; calculateOverallEntropy Function</h3>
            <div class="code" style="margin-top: 10px;">
                <pre><code class="language-java">/** Calculates overall entropy of the data and returns a float value.
 */
public static Float calculateOverallEntropy(Data dataBelow, Data dataAbove) {
    Integer nDataPoints = dataBelow.getLength() + dataAbove.getLength();
    Float pDataBelow = dataBelow.getLength().floatValue() / nDataPoints.floatValue();
    Float pDataAbove = dataAbove.getLength().floatValue() / nDataPoints.floatValue();

    Float overallEntropy = (pDataBelow * calculateEntropy(dataBelow) + pDataAbove * calculateEntropy(dataAbove));
    return overallEntropy;
}
</code></pre>
            </div>
            <br><br>
            <h3 id="dts-code-determinbestsplit-function">4.1.7 &mdash; determineBestSplit Function</h3>
            <div class="code" style="margin-top: 10px;">
                <pre><code class="language-java">/** Determines best split value to split the data into two subsets and returns KeyValuePair&lt;Integer, String>
    Integer: Column Index
    String: Split Value (categorical data)
 */
public static KeyValuePair&lt;Integer, String> determineBestSplit(Data data, List&lt;List&lt;String>> potentialSplits) {
    Float overallEntropy = (float) 999;
    Integer columnIndex = 0;
    String splitValue = "";

    for (List&lt;String> k: potentialSplits) {
        for (String value: k) {
            List&lt;Data> splitDataList = splitData(data, potentialSplits.indexOf(k), value);
            Data dataBelow = splitDataList.get(0);
            Data dataAbove = splitDataList.get(1);

            Float currentOverallEntropy = calculateOverallEntropy(dataBelow, dataAbove);
            if (currentOverallEntropy < overallEntropy) {
                columnIndex = potentialSplits.indexOf(k);
                splitValue = value;
            }
        }
    }

    return new KeyValuePair&lt;Integer, String>(columnIndex, splitValue);
}
</code></pre>
            </div>
            <br><br><br>
            <h2 id="dts-code-tree">4.2 &mdash; Build Decision Tree</h2>
            <p>
                Decision Tree will be built using sub tree.
                <br><br>
                The structure of sub tree will be a Dictionary consist of Question and List of Answers (Yes answer and No answer). Yes answer is the label of the class and no answer is another sub tree. This process will run until there are only Yes answer in the last level of node.
                <br><br>
                Sub tree will look like this: <b>{question: [yes_answer, no_answer]}</b>
            </p>
            <br>
            <div class="code">
                <pre><code class="language-java">/** Function is a recursive function which returns an object of question or answer.
    Finally returns a Decision Tree made of Sub Trees.
 */
public static Object buildDecisionTree(Data data, List&lt;String> columnHeaders) {

    // Check purity of the data.
    // If data is pure then classify the data and return Yes answer (Label of class).
    if (checkPurity(data)) {
        KeyValuePair&lt;String, Integer> classification = classifyData(data);
        return classification.key;

    } else {

        // Get the best split value to make split in the data.
        List&lt;List&lt;String>> potentialSplits = getPotentialSplits(data);
        KeyValuePair&lt;Integer, String> bestSplit = determineBestSplit(data, potentialSplits);

        List&lt;Data> splitDataList = splitData(data, bestSplit);
        Data dataBelow = splitDataList.get(0);
        Data dataAbove = splitDataList.get(1);

        // Check for null data.
        // If null data then classify the data and return Yes answer (Label of class).
        if (dataBelow.getLength() == 0 || dataAbove.getLength() == 0) {
            KeyValuePair&lt;String, Integer> classification = classifyData(data);
            return classification.key;
        }

        // Make categorical question to classify the test data.
        String question = String.format("%s = %s", columnHeaders.get(bestSplit.key), bestSplit.value);

        // Initialize the sub tree.
        // String: Question
        // List&lt;Object>: Answers
        Hashtable&lt;String, List&lt;Object>> subTree = new Hashtable&lt;String, List&lt;Object>>();
        subTree.put(question, new ArrayList&lt;Object>());

        // Recursive function to build inner tree for Data Below and Data Above.
        Object yesAnswer = buildDecisionTree(dataBelow, columnHeaders);
        Object noAnswer = buildDecisionTree(dataAbove, columnHeaders);

        // Add answers to the question.
        ((ArrayList&lt;Object>) subTree.get(question)).add(yesAnswer);
        ((ArrayList&lt;Object>) subTree.get(question)).add(noAnswer);

        return subTree;
    }
}
</code></pre>
            </div>
            <br><br><br>
            <h2 id="dts-code-classify">4.3 &mdash; Classify Test Data</h2>
            <p>
                Classifying process will be done for each test data. Calculating accuracy is your part to do (Try it!!).
                <br><br>
                Function will take input as test data and decision tree. It will travese the decision tree and ask question to the test data and it will compare the question feature value to test data feature value. If answer is correct then it will return yes answer (Label of class) else it will repeat the same process from no answer sub tree until it reaches yes answer.
                <br><br>
                Sub tree looks like this: <b>{question: [yes_answer, no_answer]}</b>
                <br><br>
                For example we have one test data consist of feature <b>A</b>, <b>B</b> and <b>C</b> and our decision tree looks like this:
                <br><br>
                Test Data: <b>{ A = 1, B = 0, C = 1 }</b> -> <b>Label: Blue</b>
                <br><br>
                Decision Tree: <b>{ "A = 0": ["Red", { "B = 1": ["Green", { "C = 1": "Blue", "Red" }] }</b>
                <br><br>
                Classifier will ask questions according to Decision Tree. First it will ask if <b>A = 0</b> and in test data <b>A != 0</b>,
                so we know that it's not <b>Red</b>. Next, it will ask if <b>B = 1</b> and in test data <b>B != 1</b>, so it's not <b>Green</b>.
                Finally, it will ask if <b>C = 1</b> and in test data <b>C = 1</b>, so classifier will say it's <b>Blue</b> according to Decision Tree.
            </p>
            <br>
            <div class="code">
                <pre><code class="language-java">/** Function is a recursive function which returns an object of yes answer or no answer.
    Finally returns a Yes answer (Label of Class).
 */
public static Object classifyExample(Data exampleData, List&lt;String> columnHeaders, Hashtable&lt;String, List&lt;Object>> tree) {
    
    // Get the first question from Decision Tree: Hashtable&lt;String, List&lt;Object>>
    Enumeration&lt;String> keys = tree.keys();
    String question = keys.nextElement();


    // Split the question into feature name and it's value for comparison.
    String featureName = question.split(" ")[0];
    String value = question.split(" ")[2];


    // Initialize answer object.
    Object answer = new Object();
    

    // Ask question to test data. (Comapre the feature value)
    if (exampleData.getColumn(columnHeaders.indexOf(featureName)).get(0).equals(value)) {
        answer = tree.get(question).get(0);
    } else {
        answer = tree.get(question).get(1);
    }
    

    // Chek if answer is yes answer.
    // If not then repeat the process with no answer.
    if (answer instanceof String) {
        return answer;
    } else {
        @SuppressWarnings("unchecked")
        Hashtable&lt;String, List&lt;Object>> residualTree = (Hashtable&lt;String, List&lt;Object>>) answer;
        return classifyExample(exampleData, columnHeaders, residualTree);
    }
}
</code></pre>
            </div>
            <br><br><br>
            <h2 id="dts-code-execution">4.4 &mdash; Main Program to Build and Test Decision Tree</h2>
            <div class="code" style="margin-top: 10px;">
                <pre><code class="language-java">// File: DecisionTree.java

public class DecisionTree {
    
    public static void main(String[] args) {
        
        // Read data from CSV File.
        // Label column must be at the last column.
        List&lt;Object> csvData = readData("path/to/train.csv");

        Data trainData = (Data) csvData.get(2);
        Data testData  = (Data) readData("path/to/test.csv").get(2);

        // Get columnHeaders from training dataset to classify test data.
        @SuppressWarnings("unchecked")
        List&lt;String> columnHeaders = (List&lt;String>) csvData.get(3);



        // Build Decision Tree.
        @SuppressWarnings("unchecked")
        Hashtable&lt;String, List&lt;Object>> decisionTree = (Hashtable&lt;String, List&lt;Object>>) buildDecisionTree(trainData, columnHeaders);

        
        // Classify test data.
        // If there are only one test data then no need to loop.
        for (int i=0; i < testData.getLength(); i++) {
            Object prediction = classifyExample(testData.getOne(i), columnHeaders, decisionTree);

            System.out.println((String) prediction);
        }
    }
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
            <a href="/dts-code-main" class="btn">Previous Part: Code - Helper Class & Functions</a>
            <a href="#" class="btn disabled">Done</a>
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