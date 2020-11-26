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
            <h1 id="dts-data-entropy">2 &mdash; Best feature to split the data?</h1>
            <p>
                Entropy is a measure of randomness or uncertainity of variable X. (Data).
                <br><br><br>
                <h2 id="dts-feature-selection">2.1 &mdash; Feature Selection</h2>
                <p>
                    If dataset consists of "<hl>n</hl>" features then deciding which feature to be use as split point (i.e. which feature to place at the root node or at internal nodes). Selecting any feature to be the root node cannot solve the issue.
                    If we follow a random approach, it may give us bad results with low accuracy.
                    <br><br>
                    For solving this feature selection problem, we have to set some criteria i.e. when and where to split the data which results in lowest entropy in any one subset of data after splitting.
                    There are many criterion out there to find the best split. In our case, we will be using criterion like <hl>Information Gain</hl> and <hl>Gini Index</hl>. These criterions will calculate values for every features.
                    The values are stored, and features are placed in the tree by following order i.e the feature with high value (in case of information gain) is placed at the root.
                    <br><br>
                    We will be assuming that features are categorical when using Information Gain and continous (Numbers with more variation) when using Gini Index.
                </p>
                <br><br><br>
                <h2 id="dts-entropy">2.2 &mdash; Entropy</h2>
                <p>
                    In this section, we will see how entropy decides the criteria for splitting the data and how it affect the decision making. To explain this, we will take an example of Iris dataset.
                    Below you can see how features (Petal width and Petal length) are related, the graph we plotted is called <b>scatter plot</b>. It shows how our data is distributed to relation of features.
                </p>
                <br><br>
                <div class="tp"> <div class="img"><img src="img/iris-split-entropy.png" alt=""></div></div>
                <br>
                <p>
                    So, if we look at the above graph we can see that the best split point to split data into two subsets (Data Below & Data Above) is petal width of <b>0.8</b> (cm). Which result in all <b>Iris-setosa</b> in left part (Data Below) i.e. pure seperation of data and all other <b>Iris-versicolor</b> and <b>Iris-virginica</b> to the right part (Data Above).
                </p>    
                <br>
                <div class="tp"><div class="img"><img src="img/iris-split-entropy-unknown.png" alt=""></div></div>
                <br>
                <p>
                    In other words, the probability of green dots in left region/area is <b>1</b>. This is what we want, because if now we pick a new unknown flower (Black dot in above figure) and it falls somewhere to the left of the split line (Left region) then we can predict with 100% certainity that this flower is an <b>Iris-setosa</b>.
                </p>
                <br>
                <div class="tp"><div class="img"><img src="img/iris-split-side-entropy-unknown.png" alt=""></div></div>
                <br>
                <p>
                    If we slightly move split line to the right like in figure above, then probability of the green dots isn't <b>1</b> anymore but less than 1 because of presence of orange dots (Iris-versicolor). We would still predict this new unknown flower to be an <b>Iris-setosa</b> because majority of the dots in left region are green (Iris-setosa).
                    But certainity of that prediction will decrease (we are not 100% sure if that unknown flower is Iris-setosa or Iris-versicolor) because there will be a slight chance that unknown flower is an Iris-versicolor.
                    <br><br>
                    So probability of an class (target) in such region plays an important role in making predictions.
                </p>
                <br>
                <div class="tp"><div class="img sm"><img src="https://latex.codecogs.com/svg.latex?\uparrow&space;Probability\;\cong\;\;\uparrow&space;Certainity" title="\uparrow Probability\;\cong\;\;\uparrow Certainity" /></div></div>
                <br>
                <p>
                     The higher the probability, the higher the certainity of our prediction about new unknown flower that falls into left region. Since, ultimate goal of our decision tree is to make such predictions then metric we use to automatically build that decision tree must make use of probability in some way. There are many metrics that make use of probability to make prediction, the one we will use is known as <b>Snannon Entropy</b>.
                </p>
                <br>
                <div class="tp"><div class="img sm" style="width: 300px; height: 60px"><img src="https://latex.codecogs.com/svg.latex?Entropy\;=\;-\sum_{i&space;=&space;1}^{c}p_i*\log_2p_i" title="Entropy\;=\;-\sum_{i = 1}^{c}p_i*\log_2p_i" /></div></div>
                <br>
                <p>
                    The formula for <b>Entropy</b> looks like in above figure. We multipy probability of the class (<b>p<sub>i</sub></b>) with the logarithm base 2 of that probability (<b>log<sub>2</sub>p<sub>i</sub></b>) and we do that for the number for class we have (<b>c</b>) and we sum up those values (<b>&Sigma;</b>) and lastly we take negative of that sum (<b>&mdash;</b>).
                    <br><br>
                    And this formula might look complicated or unintuitive at first galnce. So lets have a look at what different parts do and how we might interpret them.
                    <br><br>
                    So, as exprected metric (Entropy) makes use of probability of the classes and it even includes it two times (<b>p<sub>i</sub></b> and <b>log<sub>2</sub>p<sub>i</sub></b>) but only the second one (<b>log<sub>2</sub>p<sub>i</sub></b>) is used in a way we thought about probability, when we discussed about how probabilities affect the certainity of our predictions.
                </p>
                <br><br><br>
                <h2 id="dts-uncertainity-value">2.3 &mdash; Uncertainity Value</h2>
                <p>
                    The formula of Entropy does something strange with it. It calculates the <b>log<sub>2</sub></b> of the probability. Why does it do that?
                    <br><br>
                    Earlier we stated that: The higher the probability of a class, the higher the certainity of our prediction (Lets call this as statement 1 from now on). This statement can also be stated as: The higher the probability, the lower the uncertainity of our prediction (Lets call this as statement 2 from now on).
                </p>
                <br>
                <div class="tp"><div class="img sm" style="height: fit-content; display: flex; flex-direction: column; grid-gap: 10px;">
                    <img src="https://latex.codecogs.com/svg.latex?\uparrow&space;Probability\;\cong\;\;\uparrow&space;Certainity" title="\uparrow Probability\;\cong\;\;\uparrow Certainity" />
                    <img src="https://latex.codecogs.com/svg.latex?\uparrow&space;Probability\;\cong\;\;\downarrow&space;Uncertainity" title="\uparrow Probability\;\cong\;\;\downarrow Uncertainity" />
                </div></div>
                <br>
                <p>
                    Both statements have the same meaning, they are only expressed in a different way. And taking the logarithm of the probability represents that second statement. To be more precise, taking the negative of the logarithm of the probability. To understand why, let's look at a diagram of the <b>log<sub>2</sub></b>.
                </p>
                <br>
                <div class="tp"><div class="img"><img src="img/log2-graph.png" alt=""></div></div>
                <br>
                <p>
                    And since we are dealing with probabilities, which can take on only values between 0 and 1, we only need to look at the part of the graph where x is between 0 and 1.
                </p>
                <br>
                <div class="tp"><div class="img"><img src="img/log2p-graph.png" alt=""></div></div>
                <br>
                <p>
                    And what we can see here is that the logarithm function returns large negative numbers for low probabilities and as the probability increases, the function increases as well. So, it seems to represent statement 1.
                    <br><br>
                    But there is a problem. As the probability reaches its highest possible value (<b>1</b>), the function returns a zero. So, for the decision boundary where there were only green dots on the left side of the split (scatter plot at the top), 
                    the certainity of our prediction would be zero, meaning that we have no certainity. This, obviously, makes no sense because this is the best possible scenario for making predictions and we are absolutely certain that the new flower is an <b>Iris-setosa</b>.
                    <br><br>
                    So, the <b>log<sub>2</sub></b> graph, after all, doesn't really represent the first statement. But if we flip it, simply by adding a minus in front of the logarithm, then it perfectly represents the second statement.
                </p>
                <br>
                <div class="tp"><div class="img"><img src="img/minus-log2p-graph.png" alt=""></div></div>
                <br>
                <p>
                    For low probabilities it returns high values. So, for example, in the left side of the bottom scatter plot, the probability of the orange dots is very low. And if we would predict the new flower to be an Iris-versicolor, then the uncertainty of that prediction would be very high. And that's simply because it is much more likely to be an Iris-setosa.
                    So, this scenario is appropriately reflected by the <b>-log<sub>2</sub></b> graph.
                    <br><br>
                    And then, as the probability increases, the <b>-log<sub>2</sub></b> graph decreases until it ultimately reaches <b>0</b> when the probability is <b>1</b>.
                    Meaning this time, that we have absolutely no uncertainty about our prediction. And that is a more accurate description of the situation that we encountered on the left side of the upper scatter plot.
                    <br><br>
                    So, as you can see, the <b>-log<sub>2</sub></b> graph perfectly represents the second statement. There is, however, one edge case and it is when the probability is 0. And that's because you can't take the logarithm of zero. So, by convention it is defined as being zero.
                    <br><br>
                    And if you think about it, it makes perfect sense. For instance, in the left side of the upper scatter plot, there are no orange and blue dots.
                    So, their probability is <b>0</b>. If we would now predict the new flower to be either an <b>Iris-versicolor</b> or an <b>Iris-virginica</b>, then our uncertainty about that prediction wouldn't be infinitely high like the <b>-log<sub>2</sub></b> graph might suggest.
                    But it would be <b>0</b> because we know that there is absolutely no chance that this flower is an Iris-versicolor or Iris-virginica.
                    <br><br>
                </p>
                <br>
                <div class="tp"><div class="img"><img src="img/uncertainity-value-graph.png" alt=""></div></div>
                <br>
                <p>
                    So now, since this <b>-log<sub>2</sub></b> graph reflects statement 2, we can interpret the y-axis of the graph as the "<b>uncertainty value</b>" that is associated with predicting a new flower to be a certain class that has probability <b>p</b>.
                    <br><br>
                    But as you have probably already noticed, in the entropy formula, the minus sign is actually in front of the sigma and not in front of the logarithm. But this is not a problem because you could also just write the formula in such a way that the minus sign is in front of the logarithm.
                </p>
                <br>
                <div class="tp"><div class="img sm" style="height: fit-content; display: flex; flex-direction: column; grid-gap: 10px;">
                    <img src="https://latex.codecogs.com/svg.latex?Entropy\;=\;-\sum_{i&space;=&space;1}^{c}p_i*\log_2p_i" title="Entropy\;=\;-\sum_{i = 1}^{c}p_i*\log_2p_i" />
                    <img src="https://latex.codecogs.com/svg.latex?Entropy\;=\;\sum_{i&space;=&space;1}^{c}p_i*(-\log_2p_i)" title="Entropy\;=\;\sum_{i = 1}^{c}p_i*(-\log_2p_i)" />
                </div></div>
                <br>
                <p>
                    This means the same thing because it doesn't matter if you add up a bunch of negative numbers and then take the negative of this sum. Or if you just add up those numbers as positive values. The result is the same.
                    <br><br>
                    But writing the formula in this new way, we can now indicate that the expression with the second "<b>p</b>" in the formula can be interpreted as the uncertainty value.
                </p>
                <br>
                <div class="tp"><div class="img sm"><img src="https://latex.codecogs.com/svg.latex?Uncertainity\;Value\;=\;-\log_2p_i" title="Uncertainity\;Value\;=\;-\log_2p_i" /></div></div>
                <br>
                <p>
                    So now, we know what the second "<b>p</b>" of the entropy formula does. But what about the first one?
                    <br><br>
                    To explain that, we need to think about what the best and worst cases actually are for making predictions. So, which probabilities result in a low uncertainty and which probabilities result in a high uncertainty.
                </p>
                <br><br><br>
                <h2 id="dts-best-worst-case">2.4 &mdash; Best and worst case scenarios for making predictions?</h2>
                <p>
                    The best case scenario for making predictions, we have already covered when we looked at the "<b>uncertainity value</b>" part of the formula.
                    <br><br>
                    And it was either a probability of 0 or 1. And that’s because the resulting uncertainty would be zero. So, if we would just take that part of the formula as our final formula for the entropy, then the best case scenarios would be represented appropriately. But what about the worst case scenario?
                    <br><br>
                    Well, according to the "<b>uncertainity value</b>" graph the worst case (where the uncertainity is the highest) would be a very low probability. This, however, doesn't really make sense because we have to keep in mind that the probabilities of the different cases in a split region/area add up to <b>1</b>.
                </p>
                <br>
                <div class="tp"><div class="img"><img src="img/iris-split-side-entropy-unknown.png" alt=""></div></div>
                <br>
                <p>
                    So, for example if there are just two classes (left side of the bottom scatter plot) and one of those classes has a low probability (orange dots), then the other inherenlty must have a high probability (green dots).
                    <br><br>
                    And obviously, we would then make our predictions based on the class with the high probability. And therefore, the uncertainity value of our prediction would be relatively low. So, after all, a low probability can't be the worst-case scenario for making predictions.
                    <br><br>
                    But this begs the question: What is the worst case scenario?
                </p>
                <br>
                <div class="tp"><div class="img"><img src="img/iris-split-entropy.png" alt=""></div></div>
                <br>
                <p>
                    Well, if you think about it, the worst case really is when the probabilities of the different classes are equal. So, let's say for example that there is an equal number of orange and blue dots on the right side of the upper scatter plot.
                    If a new flower now falls into this area, then we are completely uncertain about our prediction because both types, <b>Iris-versicolor</b> and <b>Iris-virginica</b>, are equal.
                    <br><br>
                    And the situation gets even worse, the more classes there are. So, for example, if there would be an additional equal number of let's say yellow dots in this area, then we would be even more uncertain about our prediction of what type this unknown flower is.
                    <br><br>
                    So, those are the two characteristics of the worst-case scenario for making predictions: the probabilities of the different classes being equal and, generally speaking, the more classes there are, the worse the situation. And accordingly, our metric should return higher values if those conditions are met.
                    <br><br>
                    And that's what the first part of the entropy formula is for. It's basically just a weighted sum.
                </p>
                <br>
                <div class="tp"><div class="img sm"><img src="https://latex.codecogs.com/svg.latex?Weighted\;Sum\;=\;\sum_{i=1}^{c}p_i" title="Weighted\;Sum\;=\;\sum_{i=1}^{c}p_i" /></div></div>
                <br>
                <p>
                    And what it does is, it sums up the different uncertainty values associated with predicting all the different classes. But those values only contribute to the final sum proportionally to how prevalent the respective class is in a split area.
                    So, if a class doesn't appear that often, it shouldn't have a large impact on the overall sum.
                    <br><br>
                    And this has an interesting effect because we know that if the probability of a class is low (orange dots on the left side of the bottom scatter plot), then the uncertainty of predicting that class is high. But we also know that if the probability of one class is low and if there are just two classes, then the probability of the other class must be high (green dots) and its uncertainty value correspondingly is low.
                    <br><br>
                    So, one class has a low weight but a high uncertainty value. And the other class has a high weight but a low uncertainty value. So, in a sense, they cancel each other out. And this results in our desired behavior that the entropy is maximized for a given number of different classes, when the probabilities of these classes are equal.
                    <br><br>
                    And since the formula is a sum over all the classes, it generally is larger, the more classes there are because you simply have to add up more elements. So, both conditions of the worst-case scenario for making predictions are being met by this formula.
                    <br><br>
                    And to show that this is really true, let's look at the graph of the entropy for the case where there are just 2 classes.
                </p>
                <br>
                <div class="tp"><div class="img"><img src="img/entropy-graph.png" alt=""></div></div>
                <br>
                <p>
                    At the bottom x-axis, the probability of the first class is depicted and at the top the probability of the second class is depicted. And as already said before they both have to add up to one. So, when the bottom probability is for example 0.1, the top has to be 0.9 and vice versa.
                    <br><br>
                    At the y-axis, the entropy is depicted which was simply calculated using the formula with the respective probabilities. And as you can see, it reaches its peak, which represents the worst case for making predictions, when both probabilities are equal. And as soon as one probability deviates from this point, the entropy starts to decrease until it reaches zero when either of the probabilities is 1 or 0. So, the graph also represents the best-case scenario for making predictions.
                    <br><br>
                    So, let's now have a look at how the "<b>max entropy</b>" value behaves as the number of classes increase.
                </p>
                <br>
                <div class="tp"><div class="img"><img src="img/max-entropy-chart.png" alt=""></div></div>
                <br>
                <p>
                    As we have seen in the entropy-graph, "<b>max entropy</b>" means that the probabilities of the classes are equal. So, in case there are 3 classes, each class has a probability of 1/3. In case there are 4 classes, each has a probability of 1/4 and so on. And as you can see, the entropy values increase as the number of classes increases.
                    <br><br>
                    So, to conclude, the formula for the entropy appropriately reflects the best- and worst-case scenarios for making predictions. And with it we can, so to say, calculate an average uncertainty that is associated with making predictions in a split area.
                </p>
                <br>
                <div class="tp"><div class="img"><img src="img/entropy-calc1.png" alt=""></div></div>
                <br>
                <p>
                    And therefore, we obviously need to know exactly how many orange and blue dots there are. And as you can see next to the legend, there is an equal number of orange and blue dots. Hence, we are exactly at the peak of the entropy diagram and thus, the entropy of that split area is <b>1</b>.
                    <br><br>
                    And now, let's also determine the entropy values for the decision boundary in the bottom scatter plot. Here, the probabilities aren't so convenient that we can simply look up the entropy in the graph. So, we have to actually calculate them. Let's start with the left side.
                </p>
                <br>
                <div class="tp"><div class="img"><img src="img/entropy-calc2.png" alt=""></div></div>
                <br>
                <p>
                    To calculate the entropy, you have to know that there are actually 6 orange dots and not just 5. And that's because two have the exact same values and therefore they overlap. So, in total, there are 52 dots in the left area and accordingly the probability of the green dots is 46/52. And the probability of the orange dots is 6/52. And this equates to an entropy of 0.516.
                </p>
                <br>
                <div class="tp"><div class="img"><img src="img/split-entropy-calc2.png" alt=""></div></div>
                <br>
                <p>
                    In the same manner we can calculate the entropy of the right side.
                </p>
                <br>
                <div class="tp"><div class="img"><img src="img/split-entropy-calc3.png" alt=""></div></div>
                <br><br><br>
                <h2 id="dts-overall-entropy">2.5 &mdash; Overall Entropy</h2>
                <p>
                    So now, let's compare the two decision boundaries with each other.
                </p>
                <br>
                <div class="tp"><div class="img" style="height: 680px;"><img src="img\entropy-compare.png" alt=""></div></div>
                <br>
                <p>
                    As we can see, the entropy on the left side of the split is lower in the upper scatter plot. Whereas, the entropy on the right side is lower in the bottom scatter plot. So, as we move the split more to the right (from a petal width of 0.8cm to 1.05cm), the situation for making predictions gets worse on the left side, but for the right side the situation gets better.
                    <br><br>
                    This is a problem. How do we now decide which of these splits is better?
                    <br><br>
                    And I know in this case it's probably easy to say because the situation on the left side gets a lot worse, whereas the situation on the right side only improves slightly.
                    But it might not always be this obvious, so we need a metric that exactly tells us which of these splits is better. And therefore, we calculate, so to say, the overall entropy for the entire graph that is the result of making a certain split.
                </p>
                <br>
                <div class="tp"><div class="img sm"><img src="https://latex.codecogs.com/svg.latex?\dpi{120}&space;Overall\;Entropy\;=\;\sum_{j=1}^{2}p_j*Entropy_j" title="Overall\;Entropy\;=\;\sum_{j=1}^{2}p_j*Entropy_j" /></div></div>
                <br>
                <p>
                    And we compute it, similar as before, with a weighted sum. But this time it’s a sum over the two areas. So, the weights are the number of dots in the respective area divided by the number of dots in the whole plot. So, let’s calculate the overall entropy values for the decision boundary in the upper scatter plot.         
                </p>
                <br>
                <div class="tp"><div class="img"><img src="img/overall-entropy-calc1.png" alt=""></div></div>
                <br>
                <p>
                    And then, let's do the same for the bottom scatter plot.
                </p>
                <br>
                <div class="tp"><div class="img"><img src="img/overall-entropy-calc2.png" alt=""></div></div>
                <br>
                <p>
                    So, as we can see, the split in the upper scatter plot at a petal width of 0.8cm results in a lower overall entropy and therefore it is the better option out of those two splits.
                    <br><br>
                    Side note: I want to quickly mention that conventionally, this step of ultimately choosing between splits is done using a metric called "information gain". However, calculating this overall entropy is essentially the same, but I think it has the advantage of being a little bit more intuitive than the information gain.
                </p>
                <br><br><br>
                <h2 id="dts-potential-splits">2.6 &mdash; Potential Splits</h2>
                <p>
                    So now, we finally have a metric to decide which of these two splits is better. And this leaves only one final question to answer, What are the splits that we should we compare with each other in the first place?
                    <br><br>
                    In our original analysis we decided to make the split at a petal width of 0.8. But we could have also chosen a petal width of 0.79 or 0.799 or 0.7999 and so on. So, there are infinitely many that we could potentially choose from which begs the question: How do we know which ones we should compare with each other?
                    <br><br>
                    Well, for a split to make sense, it must be between two dots. And ideally, it is exactly in the middle, so that it is as far away from both points as possible. So, a simple approach for finding potential splits is to consider all the values that lie exactly in the middle of two points as potential splits.
                </p>
                <br>
                <div class="tp"><div class="img" style="height: 680px;"><img src="img/potential-splits.png" alt=""></div></div>
                <br>
                <p>
                    So, those are all the potential splits that you need to consider with respect to the petal width and length. And, obviously, you also need to do the same thing for the sepal length and width. And then, you simply calculate the overall entropy values for all those splits and choose the one that results in the lowest overall entropy.
                </p>
                <br><br><br>
                <h2 id="dts-best-feature-split">2.7 &mdash; Best feature to split the data? (reviewed)</h2>
                <p>
                    So now, we can finally answer the question what it actually means to find the best feature to split the data.
                    <br><br>
                    First we need to determine all potential splits and then, we choose the one that results in the lowest overall entropy. And based on that, we split the data into two parts.
                    <br><br>
                    And this is now a decision tree algorithm that can be automated using code.
                </p>
            </p>
        </div>

        <div class="block">
            <div class="credits">
                <p>Just someone trying to explain his understanding of data science concepts.</p>
            </div>
        </div>

        <div class="block" style="display: flex; grid-gap: 10px;">
            <a href="/dts-overview" class="btn">Previous Part: Overview & Flow</a>
            <a href="/dts-code-helper" class="btn">Next Part: Code - Helper Class & Functions</a>
        </div>
    </div>

    <div class="footer">
        Java Mini Project by Denish Sharma &copy; 2020 (Terna Engineering College).
    </div>
</body>
</html>