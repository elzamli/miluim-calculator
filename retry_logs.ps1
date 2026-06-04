$resourceId = "srv-d7bv8dbbc2fs73fvvtq0"
$filterText = "[LOG]"
$baseDir    = "C:\RenderLogs"
$maxRetries = 5
$retryDelay = 5
$sleepMs    = 800

$windows = @(
    @{ date="2026-05-29"; label="15-03_to_15-08"; startUtc="2026-05-29T12:03:00Z"; endUtc="2026-05-29T12:08:00Z" },
    @{ date="2026-05-29"; label="15-08_to_15-13"; startUtc="2026-05-29T12:08:00Z"; endUtc="2026-05-29T12:13:00Z" },
    @{ date="2026-05-29"; label="17-43_to_17-48"; startUtc="2026-05-29T14:43:00Z"; endUtc="2026-05-29T14:48:00Z" },
    @{ date="2026-05-29"; label="20-18_to_20-23"; startUtc="2026-05-29T17:18:00Z"; endUtc="2026-05-29T17:23:00Z" },
    @{ date="2026-05-29"; label="20-23_to_20-28"; startUtc="2026-05-29T17:23:00Z"; endUtc="2026-05-29T17:28:00Z" },
    @{ date="2026-05-29"; label="22-58_to_23-03"; startUtc="2026-05-29T19:58:00Z"; endUtc="2026-05-29T20:03:00Z" },
    @{ date="2026-05-29"; label="23-03_to_23-08"; startUtc="2026-05-29T20:03:00Z"; endUtc="2026-05-29T20:08:00Z" },
    @{ date="2026-05-30"; label="01-38_to_01-43"; startUtc="2026-05-29T22:38:00Z"; endUtc="2026-05-29T22:43:00Z" },
    @{ date="2026-05-30"; label="01-43_to_01-48"; startUtc="2026-05-29T22:43:00Z"; endUtc="2026-05-29T22:48:00Z" },
    @{ date="2026-05-30"; label="04-18_to_04-23"; startUtc="2026-05-30T01:18:00Z"; endUtc="2026-05-30T01:23:00Z" },
    @{ date="2026-05-30"; label="04-23_to_04-28"; startUtc="2026-05-30T01:23:00Z"; endUtc="2026-05-30T01:28:00Z" },
    @{ date="2026-05-30"; label="06-58_to_07-03"; startUtc="2026-05-30T03:58:00Z"; endUtc="2026-05-30T04:03:00Z" },
    @{ date="2026-05-30"; label="07-03_to_07-08"; startUtc="2026-05-30T04:03:00Z"; endUtc="2026-05-30T04:08:00Z" },
    @{ date="2026-05-30"; label="09-38_to_09-43"; startUtc="2026-05-30T06:38:00Z"; endUtc="2026-05-30T06:43:00Z" },
    @{ date="2026-05-30"; label="09-43_to_09-48"; startUtc="2026-05-30T06:43:00Z"; endUtc="2026-05-30T06:48:00Z" },
    @{ date="2026-05-30"; label="12-18_to_12-23"; startUtc="2026-05-30T09:18:00Z"; endUtc="2026-05-30T09:23:00Z" },
    @{ date="2026-05-30"; label="12-23_to_12-28"; startUtc="2026-05-30T09:23:00Z"; endUtc="2026-05-30T09:28:00Z" },
    @{ date="2026-05-30"; label="14-58_to_15-03"; startUtc="2026-05-30T11:58:00Z"; endUtc="2026-05-30T12:03:00Z" },
    @{ date="2026-05-30"; label="15-03_to_15-08"; startUtc="2026-05-30T12:03:00Z"; endUtc="2026-05-30T12:08:00Z" },
    @{ date="2026-05-30"; label="17-38_to_17-43"; startUtc="2026-05-30T14:38:00Z"; endUtc="2026-05-30T14:43:00Z" },
    @{ date="2026-05-30"; label="17-43_to_17-48"; startUtc="2026-05-30T14:43:00Z"; endUtc="2026-05-30T14:48:00Z" },
    @{ date="2026-05-30"; label="20-18_to_20-23"; startUtc="2026-05-30T17:18:00Z"; endUtc="2026-05-30T17:23:00Z" },
    @{ date="2026-05-30"; label="20-23_to_20-28"; startUtc="2026-05-30T17:23:00Z"; endUtc="2026-05-30T17:28:00Z" },
    @{ date="2026-05-30"; label="20-28_to_20-33"; startUtc="2026-05-30T17:28:00Z"; endUtc="2026-05-30T17:33:00Z" },
    @{ date="2026-05-30"; label="23-03_to_23-08"; startUtc="2026-05-30T20:03:00Z"; endUtc="2026-05-30T20:08:00Z" },
    @{ date="2026-05-30"; label="23-08_to_23-13"; startUtc="2026-05-30T20:08:00Z"; endUtc="2026-05-30T20:13:00Z" },
    @{ date="2026-05-30"; label="23-13_to_23-18"; startUtc="2026-05-30T20:13:00Z"; endUtc="2026-05-30T20:18:00Z" },
    @{ date="2026-05-31"; label="01-48_to_01-53"; startUtc="2026-05-30T22:48:00Z"; endUtc="2026-05-30T22:53:00Z" },
    @{ date="2026-05-31"; label="01-53_to_01-58"; startUtc="2026-05-30T22:53:00Z"; endUtc="2026-05-30T22:58:00Z" },
    @{ date="2026-05-31"; label="04-28_to_04-33"; startUtc="2026-05-31T01:28:00Z"; endUtc="2026-05-31T01:33:00Z" },
    @{ date="2026-05-31"; label="04-33_to_04-38"; startUtc="2026-05-31T01:33:00Z"; endUtc="2026-05-31T01:38:00Z" },
    @{ date="2026-05-31"; label="04-38_to_04-43"; startUtc="2026-05-31T01:38:00Z"; endUtc="2026-05-31T01:43:00Z" },
    @{ date="2026-05-31"; label="07-13_to_07-18"; startUtc="2026-05-31T04:13:00Z"; endUtc="2026-05-31T04:18:00Z" },
    @{ date="2026-05-31"; label="07-18_to_07-23"; startUtc="2026-05-31T04:18:00Z"; endUtc="2026-05-31T04:23:00Z" },
    @{ date="2026-05-31"; label="12-23_to_12-28"; startUtc="2026-05-31T09:23:00Z"; endUtc="2026-05-31T09:28:00Z" },
    @{ date="2026-05-31"; label="12-28_to_12-33"; startUtc="2026-05-31T09:28:00Z"; endUtc="2026-05-31T09:33:00Z" },
    @{ date="2026-05-31"; label="15-03_to_15-08"; startUtc="2026-05-31T12:03:00Z"; endUtc="2026-05-31T12:08:00Z" },
    @{ date="2026-05-31"; label="15-08_to_15-13"; startUtc="2026-05-31T12:08:00Z"; endUtc="2026-05-31T12:13:00Z" },
    @{ date="2026-05-31"; label="17-43_to_17-48"; startUtc="2026-05-31T14:43:00Z"; endUtc="2026-05-31T14:48:00Z" },
    @{ date="2026-05-31"; label="17-48_to_17-53"; startUtc="2026-05-31T14:48:00Z"; endUtc="2026-05-31T14:53:00Z" },
    @{ date="2026-05-31"; label="20-23_to_20-28"; startUtc="2026-05-31T17:23:00Z"; endUtc="2026-05-31T17:28:00Z" },
    @{ date="2026-05-31"; label="20-28_to_20-33"; startUtc="2026-05-31T17:28:00Z"; endUtc="2026-05-31T17:33:00Z" },
    @{ date="2026-05-31"; label="23-03_to_23-08"; startUtc="2026-05-31T20:03:00Z"; endUtc="2026-05-31T20:08:00Z" },
    @{ date="2026-05-31"; label="23-08_to_23-13"; startUtc="2026-05-31T20:08:00Z"; endUtc="2026-05-31T20:13:00Z" },
    @{ date="2026-06-01"; label="01-43_to_01-48"; startUtc="2026-05-31T22:43:00Z"; endUtc="2026-05-31T22:48:00Z" },
    @{ date="2026-06-01"; label="01-48_to_01-53"; startUtc="2026-05-31T22:48:00Z"; endUtc="2026-05-31T22:53:00Z" },
    @{ date="2026-06-01"; label="04-23_to_04-28"; startUtc="2026-06-01T01:23:00Z"; endUtc="2026-06-01T01:28:00Z" },
    @{ date="2026-06-01"; label="04-28_to_04-33"; startUtc="2026-06-01T01:28:00Z"; endUtc="2026-06-01T01:33:00Z" },
    @{ date="2026-06-01"; label="07-03_to_07-08"; startUtc="2026-06-01T04:03:00Z"; endUtc="2026-06-01T04:08:00Z" },
    @{ date="2026-06-01"; label="07-08_to_07-13"; startUtc="2026-06-01T04:08:00Z"; endUtc="2026-06-01T04:13:00Z" },
    @{ date="2026-06-01"; label="09-43_to_09-48"; startUtc="2026-06-01T06:43:00Z"; endUtc="2026-06-01T06:48:00Z" },
    @{ date="2026-06-01"; label="09-48_to_09-53"; startUtc="2026-06-01T06:48:00Z"; endUtc="2026-06-01T06:53:00Z" },
    @{ date="2026-06-01"; label="12-23_to_12-28"; startUtc="2026-06-01T09:23:00Z"; endUtc="2026-06-01T09:28:00Z" },
    @{ date="2026-06-01"; label="12-28_to_12-33"; startUtc="2026-06-01T09:28:00Z"; endUtc="2026-06-01T09:33:00Z" },
    @{ date="2026-06-01"; label="15-03_to_15-08"; startUtc="2026-06-01T12:03:00Z"; endUtc="2026-06-01T12:08:00Z" },
    @{ date="2026-06-01"; label="15-08_to_15-13"; startUtc="2026-06-01T12:08:00Z"; endUtc="2026-06-01T12:13:00Z" },
    @{ date="2026-06-01"; label="17-43_to_17-48"; startUtc="2026-06-01T14:43:00Z"; endUtc="2026-06-01T14:48:00Z" },
    @{ date="2026-06-01"; label="17-48_to_17-53"; startUtc="2026-06-01T14:48:00Z"; endUtc="2026-06-01T14:53:00Z" },
    @{ date="2026-06-01"; label="20-23_to_20-28"; startUtc="2026-06-01T17:23:00Z"; endUtc="2026-06-01T17:28:00Z" },
    @{ date="2026-06-01"; label="20-28_to_20-33"; startUtc="2026-06-01T17:28:00Z"; endUtc="2026-06-01T17:33:00Z" },
    @{ date="2026-06-02"; label="01-28_to_01-33"; startUtc="2026-06-01T22:28:00Z"; endUtc="2026-06-01T22:33:00Z" },
    @{ date="2026-06-02"; label="04-03_to_04-08"; startUtc="2026-06-02T01:03:00Z"; endUtc="2026-06-02T01:08:00Z" },
    @{ date="2026-06-02"; label="04-08_to_04-13"; startUtc="2026-06-02T01:08:00Z"; endUtc="2026-06-02T01:13:00Z" },
    @{ date="2026-06-02"; label="06-43_to_06-48"; startUtc="2026-06-02T03:43:00Z"; endUtc="2026-06-02T03:48:00Z" },
    @{ date="2026-06-02"; label="06-48_to_06-53"; startUtc="2026-06-02T03:48:00Z"; endUtc="2026-06-02T03:53:00Z" },
    @{ date="2026-06-02"; label="09-23_to_09-28"; startUtc="2026-06-02T06:23:00Z"; endUtc="2026-06-02T06:28:00Z" },
    @{ date="2026-06-02"; label="09-28_to_09-33"; startUtc="2026-06-02T06:28:00Z"; endUtc="2026-06-02T06:33:00Z" },
    @{ date="2026-06-02"; label="12-03_to_12-08"; startUtc="2026-06-02T09:03:00Z"; endUtc="2026-06-02T09:08:00Z" },
    @{ date="2026-06-02"; label="12-08_to_12-13"; startUtc="2026-06-02T09:08:00Z"; endUtc="2026-06-02T09:13:00Z" },
    @{ date="2026-06-02"; label="12-13_to_12-18"; startUtc="2026-06-02T09:13:00Z"; endUtc="2026-06-02T09:18:00Z" },
    @{ date="2026-06-02"; label="14-48_to_14-53"; startUtc="2026-06-02T11:48:00Z"; endUtc="2026-06-02T11:53:00Z" },
    @{ date="2026-06-02"; label="14-53_to_14-58"; startUtc="2026-06-02T11:53:00Z"; endUtc="2026-06-02T11:58:00Z" },
    @{ date="2026-06-02"; label="17-28_to_17-33"; startUtc="2026-06-02T14:28:00Z"; endUtc="2026-06-02T14:33:00Z" },
    @{ date="2026-06-02"; label="17-33_to_17-38"; startUtc="2026-06-02T14:33:00Z"; endUtc="2026-06-02T14:38:00Z" },
    @{ date="2026-06-02"; label="20-08_to_20-13"; startUtc="2026-06-02T17:08:00Z"; endUtc="2026-06-02T17:13:00Z" },
    @{ date="2026-06-02"; label="20-13_to_20-18"; startUtc="2026-06-02T17:13:00Z"; endUtc="2026-06-02T17:18:00Z" },
    @{ date="2026-06-02"; label="22-48_to_22-53"; startUtc="2026-06-02T19:48:00Z"; endUtc="2026-06-02T19:53:00Z" },
    @{ date="2026-06-02"; label="22-53_to_22-58"; startUtc="2026-06-02T19:53:00Z"; endUtc="2026-06-02T19:58:00Z" },
    @{ date="2026-06-03"; label="01-28_to_01-33"; startUtc="2026-06-02T22:28:00Z"; endUtc="2026-06-02T22:33:00Z" },
    @{ date="2026-06-03"; label="01-33_to_01-38"; startUtc="2026-06-02T22:33:00Z"; endUtc="2026-06-02T22:38:00Z" },
    @{ date="2026-06-03"; label="04-08_to_04-13"; startUtc="2026-06-03T01:08:00Z"; endUtc="2026-06-03T01:13:00Z" },
    @{ date="2026-06-03"; label="04-13_to_04-18"; startUtc="2026-06-03T01:13:00Z"; endUtc="2026-06-03T01:18:00Z" },
    @{ date="2026-06-03"; label="06-48_to_06-53"; startUtc="2026-06-03T03:48:00Z"; endUtc="2026-06-03T03:53:00Z" },
    @{ date="2026-06-03"; label="06-53_to_06-58"; startUtc="2026-06-03T03:53:00Z"; endUtc="2026-06-03T03:58:00Z" },
    @{ date="2026-06-03"; label="09-28_to_09-33"; startUtc="2026-06-03T06:28:00Z"; endUtc="2026-06-03T06:33:00Z" },
    @{ date="2026-06-03"; label="09-33_to_09-38"; startUtc="2026-06-03T06:33:00Z"; endUtc="2026-06-03T06:38:00Z" },
    @{ date="2026-06-03"; label="12-08_to_12-13"; startUtc="2026-06-03T09:08:00Z"; endUtc="2026-06-03T09:13:00Z" },
    @{ date="2026-06-03"; label="12-13_to_12-18"; startUtc="2026-06-03T09:13:00Z"; endUtc="2026-06-03T09:18:00Z" },
    @{ date="2026-06-03"; label="14-48_to_14-53"; startUtc="2026-06-03T11:48:00Z"; endUtc="2026-06-03T11:53:00Z" },
    @{ date="2026-06-03"; label="14-53_to_14-58"; startUtc="2026-06-03T11:53:00Z"; endUtc="2026-06-03T11:58:00Z" },
    @{ date="2026-06-03"; label="14-58_to_15-03"; startUtc="2026-06-03T11:58:00Z"; endUtc="2026-06-03T12:03:00Z" }
)

$total = $windows.Count
$succeeded = 0
$stillFailed = @()

Write-Host ""
Write-Host "============================================================"
Write-Host (' Retry -- ' + $total + ' failed windows')
Write-Host "============================================================"
Write-Host ""

$index = 1
foreach ($w in $windows) {
    $outputDir = $baseDir + '\' + $w.date
    if (-not (Test-Path $outputDir)) { New-Item -ItemType Directory -Path $outputDir | Out-Null }
    $fileName = $outputDir + '\logs_' + $w.date + '_' + $w.label + '.txt'
    Write-Host ('[' + $index + '/' + $total + ']  ' + $w.date + ' ' + $w.label + '  retrying...') -NoNewline
    $success = $false
    for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
        $tmpErr = [System.IO.Path]::GetTempFileName()
        render logs --resources $resourceId --start $w.startUtc --end $w.endUtc --text $filterText --limit 1000 -o text > $fileName 2>$tmpErr
        $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
        Remove-Item $tmpErr -ErrorAction SilentlyContinue
        $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match 'Error:')
        if (-not $hasError) {
            $lines = (Get-Content $fileName -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
            Write-Host ('  OK (' + $lines + ' lines)')
            $succeeded++
            $success = $true
            break
        } else {
            if ($attempt -lt $maxRetries) {
                Write-Host ('  retry ' + $attempt + '/' + $maxRetries + '...') -NoNewline
                Start-Sleep -Seconds $retryDelay
            }
        }
    }
    if (-not $success) {
        Write-Host '  STILL FAILED' -ForegroundColor Red
        $stillFailed += $w.date + ' ' + $w.label
        if (Test-Path $fileName) { Remove-Item $fileName }
    }
    $index++
    Start-Sleep -Milliseconds $sleepMs
}

Write-Host ""
Write-Host "============================================================"
Write-Host (' Retry complete: ' + $succeeded + '/' + $total + ' succeeded')
if ($stillFailed.Count -gt 0) {
    Write-Host (' Still failed (' + $stillFailed.Count + '):') -ForegroundColor Yellow
    $stillFailed | ForEach-Object { Write-Host ('   - ' + $_) -ForegroundColor Yellow }
} else {
    Write-Host ' All windows recovered!' -ForegroundColor Green
}
Write-Host "============================================================"
