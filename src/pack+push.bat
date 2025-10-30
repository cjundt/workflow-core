REM numéro de version à modifier dans .\Directory.Build.props
set VERSION=3.17.0

dotnet pack -p:Configuration=Release ".\WorkflowCore\WorkflowCore.csproj"
dotnet pack -p:Configuration=Release ".\providers\WorkflowCore.Persistence.Oracle\WorkflowCore.Persistence.Oracle.csproj"

dotnet nuget push -k SINALYS -s https://srv-sinv29.i.sinalys.com/BaGetRoot/BaGet/v3/index.json ".\WorkflowCore\bin\Release\WorkflowCore.%VERSION%.nupkg"
dotnet nuget push -k SINALYS -s https://srv-sinv29.i.sinalys.com/BaGetRoot/BaGet/v3/index.json ".\providers\WorkflowCore.Persistence.Oracle\bin\Release\WorkflowCore.Persistence.Oracle.%VERSION%.nupkg"