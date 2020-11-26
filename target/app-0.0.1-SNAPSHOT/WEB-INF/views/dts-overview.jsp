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
            <h1 id="dts-overview">1 &mdash; Overview & Flow</h1>
            <p>
                Decision Tree algorithm belongs to the family of supervised learning algorithms specifically non-parametric supervised learning. 
                Unlike other supervised learning algorithms, Decision Tree algorithm can be used for solving regression and classification problems. 
                In our case, we will be using to solve classification probelm which is classifying (predicting) disease based on given symptoms.
                <br><br>
                Decision Tree is easy to understand as compared with other classification algorithms. It tries to solve probelm by making Decision Tree by using tree representation (mostly Binary Tree).
                Each node corresponds to an attribute (symptom) and each leaf node corresponds to a class label (disease).
                <br><br><br>
                <h2 id="dts-pseudocode">1.1 &mdash; Decision Tree Algorithm Pseudocode</h2>
                <ul style="list-style-type: decimal;">
                    <li>Place the best attribute of the dataset at the <b>root</b> of the tree. (Root node: Origin of the tree)</li>
                    <li>Split the training data into <b>subsets</b>. Subsets should be made in such a way that each subset contains data with the same value for an attribute. (Lowest Entropy: Less randomness in the data i.e atlease one subset must contain maximum number of label for an attribute)</li>
                    <li>Repeat <b>step 1</b> and <b>step 2</b> on each subset until you find <b>leaf nodes</b> in all the branches of the tree.</li>
                </ul>
            </p>
            <br><br>
            <h2 id="dts-flow">1.2 &mdash; Flow of Algorithm</h2>
            <p>
                <ul style="list-style-type: decimal; margin-top: 8px;">
                    <li><hl>Check Purity</hl>: Check if data is pure. Pure data means if every record of data has same label (disease) or data cannot be distinguished further. If yes then continue else go to <hl>step 4</hl>.</li>
                    <li><hl>Classify</hl>: Get the label of data from every record. (There must be one unique label, if not then data cannot be classified)</li>
                    <li><hl>Leaf Node</hl>: Create leaf node containing the label after classification of pure data. (This is where classification stops, that means no further classification is needed)</li>
                    <li><hl>Best Feature</hl>: Find best feature/attribute to split the data into two sets of data one of which or both has lowest entropy. (One set contains records of data which are smaller and equal to the feature value i.e. <hl>Data Below</hl> and another set contains records of data which are greater than feature value i.e. <hl>Data Above</hl></li>
                    <li><hl>Split Data</hl>: Split the data into Data Below and Data Above using Best Feature as split point.</li>
                    <li>Repeat this until all data is pure and we create leaf nodes in all branches. Go to <hl>setp 1</hl>, with input data as Data Below and Data Above.</li>
                </ul>
            </p>
        </div>

        <div class="block">
            <div class="credits">
                <p>Just someone trying to explain his understanding of data science concepts.</p>
            </div>
        </div>

        <div class="block" style="display: flex; grid-gap: 10px;">
            <a href="/dts-entropy" class="btn">Next Part: Best feature to split the data?</a>
        </div>
    </div>

    <div class="footer">
        Java Mini Project by Denish Sharma &copy; 2020 (Terna Engineering College).
    </div>
</body>
</html>