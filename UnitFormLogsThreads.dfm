object FormLogsThreads: TFormLogsThreads
  Left = 0
  Top = 0
  Caption = 'FormLogsThreads'
  ClientHeight = 104
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonExec: TButton
    Left = 96
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Executar'
    TabOrder = 0
    OnClick = ButtonExecClick
  end
  object ButtonStart: TButton
    Left = 192
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Iniciar'
    TabOrder = 1
    OnClick = ButtonStartClick
  end
  object ButtonPause: TButton
    Left = 288
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Pausar'
    TabOrder = 2
    OnClick = ButtonPauseClick
  end
  object ButtonStop: TButton
    Left = 480
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Parar'
    TabOrder = 3
    OnClick = ButtonStopClick
  end
  object ButtonContinue: TButton
    Left = 384
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Continuar'
    TabOrder = 4
    OnClick = ButtonContinueClick
  end
end
