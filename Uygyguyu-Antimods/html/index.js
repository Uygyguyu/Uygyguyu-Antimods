
window.addEventListener('message', function (event) {
    if (event.data.action == 'show') {
        document.body.style.display = 'block';
    } else if (event.data.action == 'close') {
        document.body.style.display = 'none';
    } else if (event.data.action == 'godmodefix') {
        var godmodefixElement = document.getElementById('godmodefix');
        godmodefixElement.style.transition = 'width 3s ease'; 
        godmodefixElement.style.width = '100%';
        var godmodefix2Element = document.getElementById('godmodefix2');
        godmodefix2Element.style.transition = 'width 3s ease'; 
        var currentPercentage = 0;
        var interval = setInterval(function() {
            if (currentPercentage < 100) {
                currentPercentage++;
                godmodefix2Element.textContent = currentPercentage + '%';
            } else {
                clearInterval(interval); 
            }
        }, 30); 
    } else if (event.data.action == 'aimbotfix') {
        var aimbotfixElement = document.getElementById('aimbotfix');
        aimbotfixElement.style.transition = 'width 3s ease'; 
        aimbotfixElement.style.width = '100%';
        var aimbotfix2Element = document.getElementById('aimbotfix2');
        aimbotfix2Element.style.transition = 'width 3s ease'; 
        var currentPercentage = 0;
        var interval = setInterval(function() {
            if (currentPercentage < 100) {
                currentPercentage++;
                aimbotfix2Element.textContent = currentPercentage + '%';
            } else {
                clearInterval(interval); 
            }
        }, 30); 
    }
    
    
    

});

