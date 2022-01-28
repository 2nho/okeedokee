 function typeWrite(target) {
            var textHolder = target.text();
            target.text("");
            var toWrite = "";
            var index = 0;
            var interval = setInterval(function() {
                if (index == textHolder.length) {
                clearInterval(interval);
                } else {
                toWrite += textHolder[index];
                index++;
                target.text(toWrite);
                }
            }, 100)
            }

            $(function(){
                typeWrite($("#text"));
        });