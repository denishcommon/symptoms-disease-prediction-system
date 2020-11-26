<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Disease Prediction System</title>
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
        <div id="introduction" class="block">
            <h1>Introduction</h1>
            <p>
                Disease Prediction System predicts disease in the basis of symptoms experienced by the patients.
                System take atleast 1 symptom as input parammeter to make prediction. This system's model is trained using Decision Tree Classifier written from scratch in plain Java.
                The final result is decided by the two models which are trained on same training data. Both models are using Decision Tree Classifier to make prediction. One is written in Python and another is written in Java.
            </p>
        </div>

        <div id="objective" class="block">
            <h1>Objective</h1>
            <p>
                The main objective of this project is to modernize and mechanize the process of consulting the patients online.
                Machine Learning is playing a major role in order to automate the preprocess of consultation and diagnosis of patients.
                <br><br>
                Benifits of autmoated pre-consultation are that: there is no need of actual person in order to get most accurate asumption of disease you might have accoring to the symptoms.
                Prototype version needs to have final confirmation from doctor/hospital since we lack of data. 
                <br><br>
                The final version of this project might be a commercial app which will be available for automated consultation.
                <br><br>
                Another objective of this project is to make students aware of how classifier works and how to make it from scratch. Since most new commers direclty jump into making classifier using external libraries, ignoring the concept and maths behind it.
                <br><br>
                <b>NOTE:</b> This is not just a Java Mini Project for submission. There will be a series of making classifier from scratch in plain Java.
            </p>
        </div>

        <div id="prototype-version" class="block">
            <h1>Prototype Version</h1>
            <p>
                This version serves as <b>Mini Project for Java (Terna Engineering College)</b>. Prototype version makes combined prediction by both models. The final score is a combined score of classifier written in Java and Python.
                Model score is approximately in range of 90% - 98% which makes the best fit model among both.

                <br><br>
                <b>NOTE:</b> Do not rely on this prototype version, even though model score is above 90%. Always do final confirmation with your concerned doctor/hospital. Model get trained on data, so it will predict what is fed into it.
            </p>
        </div>

        <div id="dataset" class="block">
            <h1>Dataset</h1>
            <p>
                There is one base dataset which contains the relation of disease with respect to it's corresponding symptoms. In base dataset, the maximum features to any disease can be 17, that means any disease can be mapped to at most 17 symptoms.
                <br><br>
                The base dataset is not ready to be used to train and test both model. It needs to be processed.
                <br><br>
                Base dataset contains 133 features (symptoms) and 4920 samples. There are 41 targets (diseases).
                The features can be one hot encoded because every disease in the base dataset is mapped to atleast one symptom and every symtpom is mapped to atleast one disease.
                <br><br>
                There are two datasets in order to train and test both model. Those datasets are <b>Training</b> and <b>Testing</b> dataset.
                <br><br>
                Nature of all features data which are present in the datasets is in form of <b>Binary</b> and all targets data are in form of <b>Category</b>.
                All symptoms are one hot encoded to it's relation with diseases but disease column are not one hot encoded in order to be able to classify the data with Decision Tree Classifier.
            </p>
        </div>

        <div id="next-version" class="block">
            <h1>The Next Version</h1>
            <p>
                The next version of this project will use Deep Learning model and not Machine Learning. We will be creating Feedforward Deep Learning model from scratch in Java.
                Deep Learning model learns from it's mistake while Machine Learning Decision Tree Classifier makes a pre-built Decision Tree to make predictions.
                <br><br>
                The next version model will be semi supervised learning and not fully supervised learning like Decision Tree Classifier.
                <br><br>
                Stay tuned. Enjoy the next part! Decision Tree Classifier from Scratch in plain Java.
            </p>
        </div>

        <div id="decision-tree-from-scratch" class="block">
            <h1>Decision Tree from Scratch</h1>
            <p>Read the full article by clicking on button below.</p>
            <div class="download-block">
                <span>Decision Tree from Scratch in plain Java</span>
                <a href="/dts" class="btn">Read Article</a>
            </div>
        </div>
    </div>

    <div class="footer">
        Java Mini Project by Denish Sharma &copy; 2020 (Terna Engineering College).
    </div>
</body>
</html>