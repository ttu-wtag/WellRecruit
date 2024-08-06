document.addEventListener("DOMContentLoaded", function() {
    var timerDisplay = document.getElementById('timer');
    var form = document.getElementById('assessment-form');

    function updateTimer() {
        var now = new Date().getTime();
        var timeLeft = endTime - now;

        if (timeLeft <= 0) {
            clearInterval(timerInterval);
            timerDisplay.innerHTML = "Time's up!";
            document.getElementById('submit-button').disabled = true;
            alert("Time's up! You can't submit this participation anymore.");
            // form.submit();
            // return;
        }

        var hours = Math.floor((timeLeft % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((timeLeft % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((timeLeft % (1000 * 60)) / 1000);

        timerDisplay.innerHTML = hours + "h " + minutes + "m " + seconds + "s ";
    }

    var timerInterval = setInterval(updateTimer, 1000);
    updateTimer(); // Initial call to set the timer immediately
});
