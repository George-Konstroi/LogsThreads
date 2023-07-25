unit UnitBackgroundThread;

interface

uses
  System.Classes,
  System.SysUtils, System.IOUtils;

type
  TUnitBackgroundThread = class(TThread)
    private
    protected
      procedure Execute; override;
    public
      procedure Pause;
      procedure Continue;
    var
      logFile: TextFile;
      paused: Boolean;
  end;

implementation

{ TUnitBackgroundThread }

procedure TUnitBackgroundThread.Continue;
begin
  paused := False;
end;

procedure TUnitBackgroundThread.Execute;
var
  line: string;
begin
  try
    paused := False;
    AssignFile(logFile, 'C:\Users\konstroidev\Documents\LogsThreads\Win32\Debug\TempLogs.log');
    Rewrite(logFile);

    while not Terminated do begin
      if not paused then begin
        line := 'Logs From Background Thread: ' + DateTimeToStr(Now);
        Writeln(logFile, line);
      end;

      TThread.Sleep(1000);
    end;
  finally
    CloseFile(logFile);
  end;
end;

procedure TUnitBackgroundThread.Pause;
begin
  paused := True;
end;

end.
