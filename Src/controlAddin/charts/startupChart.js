var addin = document.getElementById("controlAddIn");

addin.innerHTML =
  '<div id="main"><button id="GenerateBtn">Generate !</button><div id="piechart"><canvas id="myChart" style="width:100%;max-width:600px"></canvas></div></div>';

let GenerateBtn = document.getElementById("GenerateBtn");

GenerateBtn.addEventListener("click", () => {
  setData();
});

var xValues = ["Italy", "France", "Spain", "USA", "Argentina"];
var yValues = array;
var barColors = ["#b91d47", "#00aba9", "#2b5797", "#e8c3b9", "#1e7145"];
let array = [];
let Heading = String;

new Chart("myChart", {
  type: "pie",
  data: {
    labels: xValues,
    datasets: [
      {
        backgroundColor: barColors,
        data: yValues,
      },
    ],
  },
  options: {
    title: {
      display: true,
      text: Heading,
    },
  },
});

Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("ChartReady");
