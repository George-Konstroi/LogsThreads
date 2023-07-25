unit UnitLogsThreads2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  System.Win.Registry, UnitBackgroundThread;

type
  TForm3 = class(TForm)
    ButtonExec: TButton;
    ButtonStart: TButton;
    ButtonPause: TButton;
    ButtonStop: TButton;
    ButtonContinue: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

end.
