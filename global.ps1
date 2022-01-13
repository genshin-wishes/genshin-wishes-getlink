$logLocation = "%userprofile%\AppData\LocalLow\miHoYo\Genshin Impact\output_log.txt";
$LogLocationChina = "%userprofile%\AppData\LocalLow\miHoYo\$([char]0x539f)$([char]0x795e)\output_log.txt";
$path = [System.Environment]::ExpandEnvironmentVariables($logLocation);
if ([System.IO.File]::Exists($path)) {
    $pathChina = [System.Environment]::ExpandEnvironmentVariables($LogLocationChina);
    $lastChange = (Get-ItemProperty -Path $pathChina -Name LastWriteTime).lastwritetime
    $lastChangeChina = (Get-ItemProperty -Path $path -Name LastWriteTime).lastwritetime
    if ([System.IO.File]::Exists($pathChina)) {
        if(($lastChange - $lastChangeChina) -gt 0) {
            $path = $pathChina
        }
    }
} else {
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
[string] $wishHistoryUrl = $match[$match.count-1] -replace 'OnGetWebViewPageFinish:', ''
Write-Host $wishHistoryUrl
Set-Clipboard -Value $wishHistoryUrl
Write-Host "Link copied to clipboard, paste it on Genshin Wishes" -ForegroundColor Green
