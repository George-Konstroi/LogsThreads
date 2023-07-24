object LogsThreads: TLogsThreads
  OldCreateOrder = False
  DisplayName = 'Service de Logs com Threads'
  AfterInstall = ServiceAfterInstall
  OnContinue = ServiceContinue
  OnExecute = ServiceExecute
  OnPause = ServicePause
  OnStart = ServiceStart
  OnStop = ServiceStop
  Height = 150
  Width = 215
end
