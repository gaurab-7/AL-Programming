var shown = true;

function click() {
  let loader = document.getElementById("circle");
  if (shown == true) {
    loader.classList.add("loader");
    shown = false;
  } else {
    loader.classList.remove("loader");
    shown = true;
  }
}

function transferData() {
  let inputValue = document.getElementById("Input").value;
  Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("inputData", [inputValue]);
}
