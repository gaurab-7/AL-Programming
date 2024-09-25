controladdin chartsAddIns
{
    Scripts = 'https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js', 'Src/controlAddin/charts/script.js';
    StartupScript = 'Src\controlAddin\charts\startupChart.js';
    StyleSheets = 'Src\controlAddin\charts\style.css';
    HorizontalStretch = true;
    VerticalStretch = true;
    MinimumHeight = 200;
    MaximumHeight = 700;
    RequestedHeight = 300;

    event ChartReady();
    procedure setData(title: Text; value: Text);
}