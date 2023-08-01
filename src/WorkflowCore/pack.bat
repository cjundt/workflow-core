REM numéro de version à modifier dans ../Directory.Build.props

dotnet pack -p:Configuration=Release

REM dotnet nuget push -k SINALYS -s http://srv-sinv29.i.sinalys.com/BaGetRoot/BaGet/v3/index.json .\bin\Release\WorkflowCore.3.8.301.nupkg