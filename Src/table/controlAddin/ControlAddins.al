controladdin MyProgressBar
{
    Scripts = 'Src\table\controlAddin\script.js';
    StyleSheets = 'Src\table\controlAddin\progress.css';
    StartupScript = 'Src\table\controlAddin\startup.js';
    MinimumHeight = 50;
    MaximumHeight = 50;
    HorizontalStretch = true;

    event IAmReady();
    procedure SetProgress(Progress: Integer);
    procedure alert();
    procedure appendName(name: Text[100]; compName: Text[100]);
}