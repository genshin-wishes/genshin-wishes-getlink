$logLocation = "%userprofile%\AppData\LocalLow\miHoYo\Genshin Impact\output_log.txt";
$LogLocationChina = "%userprofile%\AppData\LocalLow\miHoYo\$([char]0x539f)$([char]0x795e)\output_log.txt";
$path = [System.Environment]::ExpandEnvironmentVariables($logLocation);
if (-Not [System.IO.File]::Exists($path)) {
    $path = [System.Environment]::ExpandEnvironmentVariables($LogLocationChina);
    if (-Not [System.IO.File]::Exists($path)) {
        Write-Host "We cannot find the log file! Make sure to open the wish history ingame first!" -ForegroundColor Red
        return
    }
}
$logs = Get-Content -Path $path
$match = $logs -match "^OnGetWebViewPageFinish.*log$"
if (-Not $match) {
    Write-Host "We cannot find the wish history url! Make sure to open the wish history ingame first!" -ForegroundColor Red
    return
}
[string] $wishHistoryUrl = $match -replace 'OnGetWebViewPageFinish:', ''
$friendlyUrl = $wishHistoryUrl.Split(" ")
Write-Host $friendlyUrl[0]
Set-Clipboard -Value $friendlyUrl[0]
Write-Host "Link copied to clipboard, paste it on Genshin Wishes" -ForegroundColor Green