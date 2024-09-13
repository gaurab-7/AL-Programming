var addins = document.getElementById("controlAddIn");

addins.innerHTML = `<div id="myProgress">
  <div id="myBar"></div>
  </div>
  <div id="space">And I know you are from <span id ="name"></span></div>
  <span id="ChangeLog">View Change Log</span>`;

Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("IAMReady");

let changelogclick = document.getElementById("ChangeLog");
changelogclick.addEventListener("click", () => {
  Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("Triggerevent");
});
