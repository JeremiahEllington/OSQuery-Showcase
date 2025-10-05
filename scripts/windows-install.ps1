#requires -Version 5.1
param([switch]$Force)
$ErrorActionPreference = 'Stop'

Write-Host "Installing osquery for Windows..." -ForegroundColor Cyan
$exeUrl = 'https://pkg.osquery.io/windows/osquery-5.14.1.msi'
$temp = Join-Path $env:TEMP 'osquery.msi'
Invoke-WebRequest -Uri $exeUrl -OutFile $temp -UseBasicParsing

# Install silently
Start-Process msiexec.exe -ArgumentList "/i `"$temp`" /qn /norestart" -Wait -NoNewWindow

$osqueryi = Join-Path $env:ProgramFiles 'osquery\osqueryi.exe'
if (-not (Test-Path $osqueryi)) {
  Write-Error 'osqueryi.exe not found after install.'
}

Write-Host "osquery installed. Try: `\"$osqueryi --help`\"" -ForegroundColor Green
