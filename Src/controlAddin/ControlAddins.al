controladdin MyProgressBar
{
    Scripts = 'Src\controlAddin\script.js';
    StyleSheets = 'Src\controlAddin\progress.css';
    StartupScript = 'Src\controlAddin\startup.js';
    MinimumHeight = 50;
    MaximumHeight = 50;
    HorizontalStretch = true;

    event IAmReady();
    procedure SetProgress(Progress: Integer);
    procedure alert();
    procedure appendName(name: Text[100]; compName: Text[100]);
}