<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Disease Prediction System from Scratch</title>
    <link rel="stylesheet" href="css/style.css">
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
        <div id="decision-tree-from-scratch" class="block">
            <h1>Decision Tree from Scratch</h1>
            <p>
                Creating Decision Tree Classifier from scratch in plain Java (No external libraries needed).
                <br><br>
                The classifier we will be making is used in this project. We will take <b>Test</b> dataset in order to train and test model built from scratch in plain Java. Since processing 4920 samples in Java takes more time to tarin model.
                Also Test dataset contains 41 samples each with unique disease. So we will be training model with <b>Test</b> dataset and testing model with subset of Test dataset.
                <br><br>
                To explain algorithm and process, we will be using example dataset. (Iris Dataset)
                <br><br>
                Topics covered will be:
            </p>
        </div>

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
            <div class="credits">
                <p>Just someone trying to explain his understanding of data science concepts.</p>
            </div>
        </div>
    </div>

    <div class="footer">
        Java Mini Project by Denish Sharma &copy; 2020 (Terna Engineering College).
    </div>
</body>
</html>