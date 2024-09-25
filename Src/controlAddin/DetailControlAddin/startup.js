var main = document.getElementById("controlAddIn");

main.innerHTML = `<div id="mainDiv">
  <div id="circle">Click</div>
  <div id="inputValue"><input placeholder = "Enter data for EmpName"id="Input" type="text"></input></div>
  <button id="Go">Send</button>
  </div>`;

let button = document.getElementById("Go");
let circle = document.getElementById("circle");
circle.addEventListener("click", () => {
  console.log("Hello");
  let loader = document.getElementById("circle");
  if (shown == true) {
    loader.classList.add("loader");
    shown = false;
  } else {
    loader.classList.remove("loader");
    shown = true;
  }
});

button.addEventListener("click", () => {
  transferData();
});

Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("MeReady");
