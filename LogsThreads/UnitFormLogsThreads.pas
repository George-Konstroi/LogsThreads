unit UnitFormLogsThreads;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  System.Win.Registry, UnitBackgroundThread, Vcl.ExtCtrls, System.IOUtils;

type
  TFormLogsThreads = class(TForm)
    ButtonExec: TButton;
    ButtonStart: TButton;
    ButtonPause: TButton;
    ButtonStop: TButton;
    ButtonContinue: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ButtonExecClick(Sender: TObject);
    procedure ButtonStartClick(Sender: TObject);
    procedure ButtonPauseClick(Sender: TObject);
    procedure ButtonStopClick(Sender: TObject);
    procedure ButtonContinueClick(Sender: TObject);
  private
    { Private declarations }
    bgThread: TUnitBackgroundThread;
  public
    { Public declarations }
  end;

var
  FormLogsThreads: TFormLogsThreads;

implementation

{$R *.dfm}

procedure TFormLogsThreads.ButtonContinueClick(Sender: TObject);
begin
  bgThread.Continue;
end;

procedure TFormLogsThreads.ButtonExecClick(Sender: TObject);
begin
  bgThread := TUnitBackgroundThread.Create();
  bgThread.Continue;
end;

procedure TFormLogsThreads.ButtonPauseClick(Sender: TObject);
begin
  bgThread.Pause;
end;

procedure TFormLogsThreads.ButtonStartClick(Sender: TObject);
begin
  bgThread := TUnitBackgroundThread.Create();
  bgThread.Continue;
end;

procedure TFormLogsThreads.ButtonStopClick(Sender: TObject);
begin
  bgThread.Terminate;
  bgThread.WaitFor;
  FreeAndNil(bgThread);
end;

procedure TFormLogsThreads.FormCreate(Sender: TObject);
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


end.
