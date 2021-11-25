﻿$logLocation = "%userprofile%\AppData\LocalLow\miHoYo\Genshin Impact\output_log.txt";
$path = [System.Environment]::ExpandEnvironmentVariables($logLocation);
if (-Not [System.IO.File]::Exists($path)) {
    Write-Host "We cannot find the log file! Make sure to open the wish history ingame first!" -ForegroundColor Red
    Write-Host 'Press any key to quit...'
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
    exit
}
$logs = Get-Content -Path $path
$match = $logs -match "^OnGetWebViewPageFinish.*log$"
if (-Not $match) {
    Write-Host "We cannot find the wish history url! Make sure to open the wish history ingame first!" -ForegroundColor Red
    Write-Host 'Press any key to quit...'
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
    exit
}
[string] $wishHistoryUrl = $match -replace 'OnGetWebViewPageFinish:', ''
Write-Host $wishHistoryUrl
Set-Clipboard -Value $wishHistoryUrl
Write-Host "Link copied to clipboard, paste it on Genshin Wishes" -ForegroundColor Green