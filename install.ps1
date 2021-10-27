# Install OhMyPosh
winget install JanDeDobbeleer.OhMyPosh

# Reload path
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Install modules
Install-Module -Name Terminal-Icons -Repository PSGallery -Force
Install-Module -Name PSReadLine -AllowPrerelease -Force

# Update profile configuration

# 1. Import all required params
$powershellConfig = (Get-Location).Path + "\configs\powershell\phmyposh.json"
Write-Output @'
function Reload-Path {
  $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}

Reload-Path
'@ | Out-File -FilePath $PROFILE
Write-Output 'Import-Module -Name Terminal-Icons' | Out-File -FilePath $PROFILE -Append
Write-Output @'
if ($host.Name -eq 'ConsoleHost')
{
    Import-Module -Name PSReadLine
}
'@ | Out-File -FilePath $PROFILE -Append
Write-Output "oh-my-posh --init --shell pwsh --config '$powershellConfig' | Invoke-Expression" | Out-File -FilePath $PROFILE -Append

# 2. Configure PSReadLine | Predictive Intellisense
Write-Output 'Set-PSReadLineOption -PredictionSource History' | Out-File -FilePath $PROFILE -Append
Write-Output 'Set-PSReadLineOption -PredictionViewStyle ListView' | Out-File -FilePath $PROFILE -Append
Write-Output 'Set-PSReadLineOption -EditMode Windows' | Out-File -FilePath $PROFILE -Append

# Reload profile
. $PROFILE