//
var addins = document.getElementById("controlAddIn");

addins.innerHTML = `<div id="myProgress">
  <div id="myBar"></div>
  </div>
  <div id="space1">Hello! I am from <span id ="name1"></span></div>
  <div id="space">And I know you are from <span id ="name"></span></div>`;

Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("IAMReady");
