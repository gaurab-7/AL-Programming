function SetProgress(progress) {
  var CurrentProgress = 0;
  if (CurrentProgress == 0) {
    CurrentProgress = 1;
    var elem = document.getElementById("myBar");
    var width = 0;
    var id = setInterval(frame, 10);
    function frame() {
      if (width >= progress) {
        clearInterval(id);
        CurrentProgress = 0;
      } else {
        width++;
        elem.style.width = width + "%";
        elem.innerHTML = width + "%";
      }
    }
  }
}

function alert() {
  console.log("alert !");
}

function appendName(name, compName) {
  let span = document.getElementById("name");
  let span1 = document.getElementById("name1");
  span.style.color = "blue";
  span.innerHTML = name;

  span1.style.color = "red";
  span1.innerHTML = compName;
}
