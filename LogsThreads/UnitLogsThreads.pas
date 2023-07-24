unit UnitLogsThreads;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.SvcMgr, Vcl.Dialogs,
  System.Win.Registry, UnitBackgroundThread;

type
  TLogsThreads = class(TService)
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceExecute(Sender: TService);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure ServicePause(Sender: TService; var Paused: Boolean);
    procedure ServiceContinue(Sender: TService; var Continued: Boolean);
    procedure ServiceAfterInstall(Sender: TService);
  private
    { Private declarations }
    bgThread: TUnitBackgroundThread;
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

procedure TLogsThreads.ServiceAfterInstall(Sender: TService);
var
  reg: TRegistry;
begin
  reg := TRegistry.Create(KEY_READ or KEY_WRITE);

  try
    reg.RootKey := HKEY_LOCAL_MACHINE;

    if reg.OpenKey('SYSTEMCurrentControlSetServices' + name, false) then begin
      reg.WriteString('Description', 'Blog.Embargadeiro.com');
      reg.CloseKey;
    end;
  finally
    reg.Free;
  end;
end;

procedure TLogsThreads.ServiceContinue(Sender: TService;
  var Continued: Boolean);
begin
  bgThread.Continue;
  Continued := True;
end;

procedure TLogsThreads.ServiceExecute(Sender: TService);
begin
  while not Terminated do begin
    ServiceThread.ProcessRequests(False);
    TThread.Sleep(1000);
  end;

end;

procedure TLogsThreads.ServicePause(Sender: TService; var Paused: Boolean);
begin
  bgThread.Pause;
  Paused := True;
end;

procedure TLogsThreads.ServiceStart(Sender: TService; var Started: Boolean);
begin
  bgThread := TUnitBackgroundThread.Create();
  bgThread.Continue;
  Started := True;
end;

procedure TLogsThreads.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  bgThread.Terminate;
  bgThread.WaitFor;
  FreeAndNil(bgThread);
  Stopped := True;
end;

end.
