<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Disease Prediction System - Predict</title>
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
                <li class="nav-link"><a href="/">Home</a></li>
                <li class="nav-link"><a class="active" href="/predict">Predict</a></li>
                <li class="nav-link"><a class="/downloads" href="/downloads">Downloads</a></li>
            </ul>
        </div>
    </div>


    <div class="container predictPage">
        <div class="info-box muted">
            Version: Prototype 1.3
        </div>
        <div class="info-box">
            Predicting process can be slow sometimes because app is running on developement server.
        </div>
        
        <br>
        <h1>Enter Symptoms</h1>
        <p>Enter atleast 5 symptoms to predict correctly. It can also take atleast 1 symptom to predict but results may vary.</p>
        <br>
        <div class="form">
            <div class="form-row">
                <div id="addSymptom" class="select-holder">
                    <span class="demText">Select Symptoms</span>
                </div>
            </div>
            <div class="form-row submit">
                <button id="predictButton" class="btn disabled">
                    <div class="loader"></div>
                    <span>Predict</span>
                </button>
            </div>
        </div>

        <div class="form-result">
            <h2>Result</h2>
            <p>Predicted results from two different models which is trained on same dataset.</p>
            <div class="tags">
                <span class="tag">Algorithm: Decision Tree</span>
                <span id="modelScore" class="tag">Score:</span>
            </div>

            <div class="info">
                <h4>You may have:</h4>
                <div id="predictionAnswers"" class="answers">
                    <a href="#" class="answer">Fungal Infection</a>
                    <span class="sep">or</span>
                    <a href="#" class="answer">Allegry</a>
                </div>
            </div>
        </div>
    </div>

    <div class="modal" id="symptomModal">
        <div class="modal-content">
            <div class="modal-header">
                <h4>Select Symptoms</h4>
            </div>

            <div class="modal-body">
                <ul id="symItems" class="sym-items">
                    <c:forEach items="${symList}" var="sym">
                        <li class="sym-item">
                            <input type="checkbox" id="${sym.id}" name="symp" value="${sym.id}">
                            <label for="${sym.id}">${sym.name}</label>
                        </li>
                    </c:forEach>         
                </ul>
            </div>

            <div class="modal-footer">
                <button id="closeSymptomModal" class="btn">Done</button>
            </div>
        </div>
    </div>

    <div class="footer">
        Java Mini Project by Denish Sharma &copy; 2020 (Terna Engineering College).
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script>
        var modal = document.getElementById("symptomModal");
        var btn = document.getElementById("addSymptom");
        var close = document.getElementById("closeSymptomModal");

        btn.onclick = function() {
            modal.style.display = "block";
        }

        close.onclick = function() {
            modal.style.display = "none";
        }

        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }

        var predictResult;

        $('#predictButton').on('click', function() {

            $(this).addClass('disabled');
            $('#predictButton span').html('Predicting...');
            $('#predictButton .loader').show();
            $('#addSymptom').addClass('disabled');
            $('.form-result').hide();

            var checkedVals = $('#symItems li input:checkbox:checked').map(function() {
                return this.value;
            }).get();

            $.ajax({
                url: "/pred",
                type: 'GET',
                traditional: true,
                data: {
                    symp: checkedVals
                },
                success: function(resp) {
                    $('#predictButton').removeClass('disabled');
                    $('#predictButton span').html('Predict');
                    $('#predictButton .loader').hide();
                    $('#addSymptom').removeClass('disabled');
                    predictResult = JSON.parse(resp);

                    $('.form-result #modelScore').html('Score: ' + (predictResult.python.score * 100).toFixed(2) + "%");

                    if (predictResult.java == predictResult.python.prediction[0]) {
                        $('.form-result #predictionAnswers').html('<a href="https://www.google.com/search?q=' + predictResult.java +'" class="answer">' + predictResult.java + '</a>');
                    } else {
                        $('.form-result #predictionAnswers').html(
                            '<a href="https://www.google.com/search?q=' + predictResult.java +'" target="_blank" class="answer">' + titleCase(predictResult.java) + '</a>' + 
                            '<span class="sep">or</span>' + 
                            '<a href="https://www.google.com/search?q=' + predictResult.python.prediction[0] +'" target="_balnk" class="answer">' + titleCase(predictResult.python.prediction[0]) + '</a>'
                        );
                    }

                    $('.form-result').show();
                },
                error: function(e) {
                    console.log('Error: ' + e);
                }
            });
        });

        function titleCase(str) {
            var splitStr = str.toLowerCase().split(' ');
            for (var i = 0; i < splitStr.length; i++) {
                splitStr[i] = splitStr[i].charAt(0).toUpperCase() + splitStr[i].substring(1);     
            }
            return splitStr.join(' '); 
        }
        
        $('#symItems li label').on('click', function() {
            var inputId = $(this).attr('for');
            var labelValue = $(this).html();
    
            var checkBox = $('#symItems li #' + inputId);
            if (checkBox.prop('checked')) {
                $('#addSymptom #' + inputId).remove();
            } else {
                var html = '<span id="' + checkBox.attr('value') + '" class="select-option">' + labelValue + '${labelValue}</span>';
                $('#addSymptom').append(html); 
                checkBox.prop('checked', true);
            }

            if ($('#addSymptom .select-option').length == 0) {
                $('#addSymptom').append('<span class="demText">Select Symptoms</span>');
                $('#predictButton').addClass('disabled');
            } else {
                $('#addSymptom .demText').remove();
                $('#predictButton').removeClass('disabled');
            }
        });
    </script>
</body>
</html>