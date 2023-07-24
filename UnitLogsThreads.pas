unit UnitLogsThreads;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.SvcMgr, Vcl.Dialogs;

type
  TLogsThreads = class(TService)
  private
    { Private declarations }
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  LogsThreads: TLogsThreads;

implementation

{$R *.dfm}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  LogsThreads.Controller(CtrlCode);
end;

function TLogsThreads.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

end.
