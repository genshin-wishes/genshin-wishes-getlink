$logLocation = "%userprofile%\AppData\LocalLow\miHoYo\Genshin Impact\output_log.txt";
$LogLocationChina = "%userprofile%\AppData\LocalLow\miHoYo\$([char]0x539f)$([char]0x795e)\output_log.txt";

function tryTestPath($p){
    try {
        $test = Test-Path -Path $p -ErrorAction Stop
        return $test
    }
    catch {
        if ($_ -like "*Access is denied*") {
            Write-Host "No permission to open file, try running PowerShell with Administrator rights." -ForegroundColor Red
            return "denied"
        }
    }
}

$path = [System.Environment]::ExpandEnvironmentVariables($logLocation)
$test = tryTestPath($path)
if ($test -match "denied") { return; }
if ($test -ne $true) {

    $path = [System.Environment]::ExpandEnvironmentVariables($LogLocationChina)
    $test = tryTestPath($path)
    if ($test -match "denied") { return }
    if ($test -ne $true) {

        Write-Host "We cannot find the log file! Make sure to open the wish history ingame first!" -ForegroundColor Red
        return
    }
}

try {
    $logs = Get-Content -Path $path -ErrorAction Stop
}
catch {
    if ($_ -like "*is denied.*") {
        Write-Host "No permission to open file, try running PowerShell with Administrator rights." -ForegroundColor Red
        return
    }
}

$match = $logs -match "^OnGetWebViewPageFinish.*log$"
if (-Not $match) {
    Write-Host "We cannot find the wish history url! Make sure to open the wish history ingame first!" -ForegroundColor Red
    return
}
[string] $wishHistoryUrl = $match[$match.count-1] -replace 'OnGetWebViewPageFinish:', ''
Write-Host $wishHistoryUrl
Set-Clipboard -Value $wishHistoryUrl
Write-Host "Link copied to clipboard, paste it on Genshin Wishes" -ForegroundColor Green
