<script type="text/javascript">
    function clickit(chunk, answer) {
      var runbuttID = "qwebr-button-run-" + chunk;
      var runbutt = document.getElementById(runbuttID);
      runbutt.click();
    }
    function runlink(answer, el) {
      var sibID = el.parentElement.parentElement.previousElementSibling.previousElementSibling.previousElementSibling.id;
      var sibNum = sibID.replace("qwebr-insertion-location-", "");
      var runbuttID = "qwebr-button-run-" + sibNum;
      var runbutt = document.getElementById(runbuttID);
      runbutt.click();
    }
    function checkit(chunk, answer) {
      var buttID = "check-" + chunk + "-button";
      var sibID = document.getElementById(buttID).previousElementSibling.previousElementSibling.id;
      var sibNum = sibID.replace("qwebr-insertion-location-", "");;
      var grabID = "qwebr-output-code-area-" + sibNum;
      <!-- var grabID = "qwebr-output-code-area-" + chunk; -->
      var button = document.getElementById(buttID);
      var grab = document.getElementById(grabID);
      var result = grab.innerText.substring(4).trim();
      var answerA = "" + answer + "";
      var idWait = "feedback-" + chunk + "-wait";
      var idRedo = "feedback-" + chunk + "-redo";
      var idYes = "feedback-" + chunk + "-yes";
      var idNo = "feedback-" + chunk + "-no";
      var feedbackW = document.getElementById(idWait);
      var feedbackR = document.getElementById(idRedo);
      var feedbackY = document.getElementById(idYes);
      var feedbackN = document.getElementById(idNo);
      if (result == "") {
        <!-- button.value = "One more click..."; -->
        <!-- button.style.background = "#ffff99"; -->
        feedbackW.style.display = "none";
        feedbackR.style.display = "block";
        feedbackY.style.display = "none";
        feedbackN.style.display = "none";
      } else if (result == answerA) {
        <!-- button.value = "Yes! Great job!"; -->
        <!-- button.style.background = "#99ff99"; -->
        feedbackW.style.display = "none";
        feedbackR.style.display = "none";
        feedbackY.style.display = "block";
        feedbackN.style.display = "none";
      } else {
        <!-- button.value = "No, try again"; -->
        <!-- button.style.background = "#ff9999"; -->
        feedbackW.style.display = "none";
        feedbackR.style.display = "none";
        feedbackY.style.display = "none";
        feedbackN.style.display = "block";
      }
    }
  </script>
