controladdin detailControl
{
    Scripts = 'Src\controlAddin\DetailControlAddin\script.js';
    StyleSheets = 'Src\controlAddin\DetailControlAddin\style.css';
    StartupScript = 'Src\controlAddin\DetailControlAddin\startup.js';
    HorizontalStretch = true;
    MinimumHeight = 500;
    MaximumHeight = 500;

    event MeReady();

    procedure click();

    event inputData(text: Text[30]);

    procedure data1(text: Text[100]);
}