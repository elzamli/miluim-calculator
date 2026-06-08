$resourceId = "srv-d7bv8dbbc2fs73fvvtq0"
$filterText = "[LOG]"
$baseDir    = "C:\RenderLogs"
$maxRetries = 5
$retryDelay = 5
$sleepMs    = 800

$windows = @(
    @{ date="2026-06-03"; label="19-10_to_19-15"; startUtc="2026-06-03T16:10:00Z"; endUtc="2026-06-03T16:15:00Z" },
    @{ date="2026-06-03"; label="21-45_to_21-50"; startUtc="2026-06-03T18:45:00Z"; endUtc="2026-06-03T18:50:00Z" },
    @{ date="2026-06-03"; label="21-50_to_21-55"; startUtc="2026-06-03T18:50:00Z"; endUtc="2026-06-03T18:55:00Z" },
    @{ date="2026-06-03"; label="21-55_to_22-00"; startUtc="2026-06-03T18:55:00Z"; endUtc="2026-06-03T19:00:00Z" },
    @{ date="2026-06-04"; label="00-30_to_00-35"; startUtc="2026-06-03T21:30:00Z"; endUtc="2026-06-03T21:35:00Z" },
    @{ date="2026-06-04"; label="00-35_to_00-40"; startUtc="2026-06-03T21:35:00Z"; endUtc="2026-06-03T21:40:00Z" },
    @{ date="2026-06-04"; label="00-40_to_00-45"; startUtc="2026-06-03T21:40:00Z"; endUtc="2026-06-03T21:45:00Z" },
    @{ date="2026-06-04"; label="03-15_to_03-20"; startUtc="2026-06-04T00:15:00Z"; endUtc="2026-06-04T00:20:00Z" },
    @{ date="2026-06-04"; label="03-20_to_03-25"; startUtc="2026-06-04T00:20:00Z"; endUtc="2026-06-04T00:25:00Z" },
    @{ date="2026-06-04"; label="05-55_to_06-00"; startUtc="2026-06-04T02:55:00Z"; endUtc="2026-06-04T03:00:00Z" },
    @{ date="2026-06-04"; label="06-00_to_06-05"; startUtc="2026-06-04T03:00:00Z"; endUtc="2026-06-04T03:05:00Z" },
    @{ date="2026-06-04"; label="06-05_to_06-10"; startUtc="2026-06-04T03:05:00Z"; endUtc="2026-06-04T03:10:00Z" },
    @{ date="2026-06-04"; label="08-40_to_08-45"; startUtc="2026-06-04T05:40:00Z"; endUtc="2026-06-04T05:45:00Z" },
    @{ date="2026-06-04"; label="08-45_to_08-50"; startUtc="2026-06-04T05:45:00Z"; endUtc="2026-06-04T05:50:00Z" },
    @{ date="2026-06-04"; label="08-50_to_08-55"; startUtc="2026-06-04T05:50:00Z"; endUtc="2026-06-04T05:55:00Z" },
    @{ date="2026-06-04"; label="11-25_to_11-30"; startUtc="2026-06-04T08:25:00Z"; endUtc="2026-06-04T08:30:00Z" },
    @{ date="2026-06-04"; label="11-30_to_11-35"; startUtc="2026-06-04T08:30:00Z"; endUtc="2026-06-04T08:35:00Z" },
    @{ date="2026-06-04"; label="11-35_to_11-40"; startUtc="2026-06-04T08:35:00Z"; endUtc="2026-06-04T08:40:00Z" },
    @{ date="2026-06-04"; label="14-10_to_14-15"; startUtc="2026-06-04T11:10:00Z"; endUtc="2026-06-04T11:15:00Z" },
    @{ date="2026-06-04"; label="14-15_to_14-20"; startUtc="2026-06-04T11:15:00Z"; endUtc="2026-06-04T11:20:00Z" },
    @{ date="2026-06-04"; label="14-20_to_14-25"; startUtc="2026-06-04T11:20:00Z"; endUtc="2026-06-04T11:25:00Z" },
    @{ date="2026-06-04"; label="16-55_to_17-00"; startUtc="2026-06-04T13:55:00Z"; endUtc="2026-06-04T14:00:00Z" },
    @{ date="2026-06-04"; label="17-00_to_17-05"; startUtc="2026-06-04T14:00:00Z"; endUtc="2026-06-04T14:05:00Z" },
    @{ date="2026-06-04"; label="17-05_to_17-10"; startUtc="2026-06-04T14:05:00Z"; endUtc="2026-06-04T14:10:00Z" },
    @{ date="2026-06-04"; label="19-40_to_19-45"; startUtc="2026-06-04T16:40:00Z"; endUtc="2026-06-04T16:45:00Z" },
    @{ date="2026-06-04"; label="19-45_to_19-50"; startUtc="2026-06-04T16:45:00Z"; endUtc="2026-06-04T16:50:00Z" },
    @{ date="2026-06-04"; label="19-50_to_19-55"; startUtc="2026-06-04T16:50:00Z"; endUtc="2026-06-04T16:55:00Z" },
    @{ date="2026-06-04"; label="22-25_to_22-30"; startUtc="2026-06-04T19:25:00Z"; endUtc="2026-06-04T19:30:00Z" },
    @{ date="2026-06-04"; label="22-30_to_22-35"; startUtc="2026-06-04T19:30:00Z"; endUtc="2026-06-04T19:35:00Z" },
    @{ date="2026-06-04"; label="22-35_to_22-40"; startUtc="2026-06-04T19:35:00Z"; endUtc="2026-06-04T19:40:00Z" },
    @{ date="2026-06-05"; label="01-10_to_01-15"; startUtc="2026-06-04T22:10:00Z"; endUtc="2026-06-04T22:15:00Z" },
    @{ date="2026-06-05"; label="01-15_to_01-20"; startUtc="2026-06-04T22:15:00Z"; endUtc="2026-06-04T22:20:00Z" },
    @{ date="2026-06-05"; label="01-20_to_01-25"; startUtc="2026-06-04T22:20:00Z"; endUtc="2026-06-04T22:25:00Z" },
    @{ date="2026-06-05"; label="03-55_to_04-00"; startUtc="2026-06-05T00:55:00Z"; endUtc="2026-06-05T01:00:00Z" },
    @{ date="2026-06-05"; label="04-00_to_04-05"; startUtc="2026-06-05T01:00:00Z"; endUtc="2026-06-05T01:05:00Z" },
    @{ date="2026-06-05"; label="04-05_to_04-10"; startUtc="2026-06-05T01:05:00Z"; endUtc="2026-06-05T01:10:00Z" },
    @{ date="2026-06-05"; label="06-40_to_06-45"; startUtc="2026-06-05T03:40:00Z"; endUtc="2026-06-05T03:45:00Z" },
    @{ date="2026-06-05"; label="06-45_to_06-50"; startUtc="2026-06-05T03:45:00Z"; endUtc="2026-06-05T03:50:00Z" },
    @{ date="2026-06-05"; label="06-50_to_06-55"; startUtc="2026-06-05T03:50:00Z"; endUtc="2026-06-05T03:55:00Z" },
    @{ date="2026-06-05"; label="09-25_to_09-30"; startUtc="2026-06-05T06:25:00Z"; endUtc="2026-06-05T06:30:00Z" },
    @{ date="2026-06-05"; label="09-30_to_09-35"; startUtc="2026-06-05T06:30:00Z"; endUtc="2026-06-05T06:35:00Z" },
    @{ date="2026-06-05"; label="09-35_to_09-40"; startUtc="2026-06-05T06:35:00Z"; endUtc="2026-06-05T06:40:00Z" },
    @{ date="2026-06-05"; label="12-10_to_12-15"; startUtc="2026-06-05T09:10:00Z"; endUtc="2026-06-05T09:15:00Z" },
    @{ date="2026-06-05"; label="12-15_to_12-20"; startUtc="2026-06-05T09:15:00Z"; endUtc="2026-06-05T09:20:00Z" },
    @{ date="2026-06-05"; label="12-20_to_12-25"; startUtc="2026-06-05T09:20:00Z"; endUtc="2026-06-05T09:25:00Z" },
    @{ date="2026-06-05"; label="14-55_to_15-00"; startUtc="2026-06-05T11:55:00Z"; endUtc="2026-06-05T12:00:00Z" },
    @{ date="2026-06-05"; label="15-00_to_15-05"; startUtc="2026-06-05T12:00:00Z"; endUtc="2026-06-05T12:05:00Z" },
    @{ date="2026-06-05"; label="15-05_to_15-10"; startUtc="2026-06-05T12:05:00Z"; endUtc="2026-06-05T12:10:00Z" },
    @{ date="2026-06-05"; label="17-40_to_17-45"; startUtc="2026-06-05T14:40:00Z"; endUtc="2026-06-05T14:45:00Z" },
    @{ date="2026-06-05"; label="17-45_to_17-50"; startUtc="2026-06-05T14:45:00Z"; endUtc="2026-06-05T14:50:00Z" },
    @{ date="2026-06-05"; label="17-50_to_17-55"; startUtc="2026-06-05T14:50:00Z"; endUtc="2026-06-05T14:55:00Z" },
    @{ date="2026-06-05"; label="20-25_to_20-30"; startUtc="2026-06-05T17:25:00Z"; endUtc="2026-06-05T17:30:00Z" },
    @{ date="2026-06-05"; label="20-30_to_20-35"; startUtc="2026-06-05T17:30:00Z"; endUtc="2026-06-05T17:35:00Z" },
    @{ date="2026-06-05"; label="20-35_to_20-40"; startUtc="2026-06-05T17:35:00Z"; endUtc="2026-06-05T17:40:00Z" },
    @{ date="2026-06-05"; label="23-10_to_23-15"; startUtc="2026-06-05T20:10:00Z"; endUtc="2026-06-05T20:15:00Z" },
    @{ date="2026-06-05"; label="23-15_to_23-20"; startUtc="2026-06-05T20:15:00Z"; endUtc="2026-06-05T20:20:00Z" },
    @{ date="2026-06-05"; label="23-20_to_23-25"; startUtc="2026-06-05T20:20:00Z"; endUtc="2026-06-05T20:25:00Z" },
    @{ date="2026-06-06"; label="01-55_to_02-00"; startUtc="2026-06-05T22:55:00Z"; endUtc="2026-06-05T23:00:00Z" },
    @{ date="2026-06-06"; label="02-00_to_02-05"; startUtc="2026-06-05T23:00:00Z"; endUtc="2026-06-05T23:05:00Z" },
    @{ date="2026-06-06"; label="02-05_to_02-10"; startUtc="2026-06-05T23:05:00Z"; endUtc="2026-06-05T23:10:00Z" },
    @{ date="2026-06-06"; label="04-40_to_04-45"; startUtc="2026-06-06T01:40:00Z"; endUtc="2026-06-06T01:45:00Z" },
    @{ date="2026-06-06"; label="04-45_to_04-50"; startUtc="2026-06-06T01:45:00Z"; endUtc="2026-06-06T01:50:00Z" },
    @{ date="2026-06-06"; label="04-50_to_04-55"; startUtc="2026-06-06T01:50:00Z"; endUtc="2026-06-06T01:55:00Z" },
    @{ date="2026-06-06"; label="07-25_to_07-30"; startUtc="2026-06-06T04:25:00Z"; endUtc="2026-06-06T04:30:00Z" },
    @{ date="2026-06-06"; label="07-30_to_07-35"; startUtc="2026-06-06T04:30:00Z"; endUtc="2026-06-06T04:35:00Z" },
    @{ date="2026-06-06"; label="07-35_to_07-40"; startUtc="2026-06-06T04:35:00Z"; endUtc="2026-06-06T04:40:00Z" },
    @{ date="2026-06-06"; label="10-10_to_10-15"; startUtc="2026-06-06T07:10:00Z"; endUtc="2026-06-06T07:15:00Z" },
    @{ date="2026-06-06"; label="10-15_to_10-20"; startUtc="2026-06-06T07:15:00Z"; endUtc="2026-06-06T07:20:00Z" },
    @{ date="2026-06-06"; label="10-20_to_10-25"; startUtc="2026-06-06T07:20:00Z"; endUtc="2026-06-06T07:25:00Z" },
    @{ date="2026-06-06"; label="12-55_to_13-00"; startUtc="2026-06-06T09:55:00Z"; endUtc="2026-06-06T10:00:00Z" },
    @{ date="2026-06-06"; label="13-00_to_13-05"; startUtc="2026-06-06T10:00:00Z"; endUtc="2026-06-06T10:05:00Z" },
    @{ date="2026-06-06"; label="13-05_to_13-10"; startUtc="2026-06-06T10:05:00Z"; endUtc="2026-06-06T10:10:00Z" },
    @{ date="2026-06-06"; label="15-40_to_15-45"; startUtc="2026-06-06T12:40:00Z"; endUtc="2026-06-06T12:45:00Z" },
    @{ date="2026-06-06"; label="15-45_to_15-50"; startUtc="2026-06-06T12:45:00Z"; endUtc="2026-06-06T12:50:00Z" },
    @{ date="2026-06-06"; label="15-50_to_15-55"; startUtc="2026-06-06T12:50:00Z"; endUtc="2026-06-06T12:55:00Z" },
    @{ date="2026-06-06"; label="18-25_to_18-30"; startUtc="2026-06-06T15:25:00Z"; endUtc="2026-06-06T15:30:00Z" },
    @{ date="2026-06-06"; label="18-30_to_18-35"; startUtc="2026-06-06T15:30:00Z"; endUtc="2026-06-06T15:35:00Z" },
    @{ date="2026-06-06"; label="18-35_to_18-40"; startUtc="2026-06-06T15:35:00Z"; endUtc="2026-06-06T15:40:00Z" },
    @{ date="2026-06-06"; label="21-10_to_21-15"; startUtc="2026-06-06T18:10:00Z"; endUtc="2026-06-06T18:15:00Z" },
    @{ date="2026-06-06"; label="21-15_to_21-20"; startUtc="2026-06-06T18:15:00Z"; endUtc="2026-06-06T18:20:00Z" },
    @{ date="2026-06-06"; label="21-20_to_21-25"; startUtc="2026-06-06T18:20:00Z"; endUtc="2026-06-06T18:25:00Z" },
    @{ date="2026-06-06"; label="23-55_to_00-00"; startUtc="2026-06-06T20:55:00Z"; endUtc="2026-06-06T21:00:00Z" },
    @{ date="2026-06-07"; label="00-00_to_00-05"; startUtc="2026-06-06T21:00:00Z"; endUtc="2026-06-06T21:05:00Z" },
    @{ date="2026-06-07"; label="00-05_to_00-10"; startUtc="2026-06-06T21:05:00Z"; endUtc="2026-06-06T21:10:00Z" },
    @{ date="2026-06-07"; label="02-40_to_02-45"; startUtc="2026-06-06T23:40:00Z"; endUtc="2026-06-06T23:45:00Z" },
    @{ date="2026-06-07"; label="02-45_to_02-50"; startUtc="2026-06-06T23:45:00Z"; endUtc="2026-06-06T23:50:00Z" },
    @{ date="2026-06-07"; label="02-50_to_02-55"; startUtc="2026-06-06T23:50:00Z"; endUtc="2026-06-06T23:55:00Z" },
    @{ date="2026-06-07"; label="05-25_to_05-30"; startUtc="2026-06-07T02:25:00Z"; endUtc="2026-06-07T02:30:00Z" },
    @{ date="2026-06-07"; label="05-30_to_05-35"; startUtc="2026-06-07T02:30:00Z"; endUtc="2026-06-07T02:35:00Z" },
    @{ date="2026-06-07"; label="05-35_to_05-40"; startUtc="2026-06-07T02:35:00Z"; endUtc="2026-06-07T02:40:00Z" },
    @{ date="2026-06-07"; label="08-10_to_08-15"; startUtc="2026-06-07T05:10:00Z"; endUtc="2026-06-07T05:15:00Z" },
    @{ date="2026-06-07"; label="08-15_to_08-20"; startUtc="2026-06-07T05:15:00Z"; endUtc="2026-06-07T05:20:00Z" },
    @{ date="2026-06-07"; label="08-20_to_08-25"; startUtc="2026-06-07T05:20:00Z"; endUtc="2026-06-07T05:25:00Z" },
    @{ date="2026-06-07"; label="10-55_to_11-00"; startUtc="2026-06-07T07:55:00Z"; endUtc="2026-06-07T08:00:00Z" },
    @{ date="2026-06-07"; label="11-00_to_11-05"; startUtc="2026-06-07T08:00:00Z"; endUtc="2026-06-07T08:05:00Z" },
    @{ date="2026-06-07"; label="11-05_to_11-10"; startUtc="2026-06-07T08:05:00Z"; endUtc="2026-06-07T08:10:00Z" },
    @{ date="2026-06-07"; label="13-40_to_13-45"; startUtc="2026-06-07T10:40:00Z"; endUtc="2026-06-07T10:45:00Z" },
    @{ date="2026-06-07"; label="13-45_to_13-50"; startUtc="2026-06-07T10:45:00Z"; endUtc="2026-06-07T10:50:00Z" },
    @{ date="2026-06-07"; label="13-50_to_13-55"; startUtc="2026-06-07T10:50:00Z"; endUtc="2026-06-07T10:55:00Z" },
    @{ date="2026-06-07"; label="16-25_to_16-30"; startUtc="2026-06-07T13:25:00Z"; endUtc="2026-06-07T13:30:00Z" },
    @{ date="2026-06-07"; label="16-30_to_16-35"; startUtc="2026-06-07T13:30:00Z"; endUtc="2026-06-07T13:35:00Z" },
    @{ date="2026-06-07"; label="16-35_to_16-40"; startUtc="2026-06-07T13:35:00Z"; endUtc="2026-06-07T13:40:00Z" },
    @{ date="2026-06-07"; label="19-10_to_19-15"; startUtc="2026-06-07T16:10:00Z"; endUtc="2026-06-07T16:15:00Z" },
    @{ date="2026-06-07"; label="19-15_to_19-20"; startUtc="2026-06-07T16:15:00Z"; endUtc="2026-06-07T16:20:00Z" },
    @{ date="2026-06-07"; label="19-20_to_19-25"; startUtc="2026-06-07T16:20:00Z"; endUtc="2026-06-07T16:25:00Z" },
    @{ date="2026-06-07"; label="21-55_to_22-00"; startUtc="2026-06-07T18:55:00Z"; endUtc="2026-06-07T19:00:00Z" },
    @{ date="2026-06-07"; label="22-00_to_22-05"; startUtc="2026-06-07T19:00:00Z"; endUtc="2026-06-07T19:05:00Z" },
    @{ date="2026-06-07"; label="22-05_to_22-10"; startUtc="2026-06-07T19:05:00Z"; endUtc="2026-06-07T19:10:00Z" },
    @{ date="2026-06-08"; label="00-40_to_00-45"; startUtc="2026-06-07T21:40:00Z"; endUtc="2026-06-07T21:45:00Z" },
    @{ date="2026-06-08"; label="00-45_to_00-50"; startUtc="2026-06-07T21:45:00Z"; endUtc="2026-06-07T21:50:00Z" },
    @{ date="2026-06-08"; label="00-50_to_00-55"; startUtc="2026-06-07T21:50:00Z"; endUtc="2026-06-07T21:55:00Z" },
    @{ date="2026-06-08"; label="03-25_to_03-30"; startUtc="2026-06-08T00:25:00Z"; endUtc="2026-06-08T00:30:00Z" },
    @{ date="2026-06-08"; label="03-30_to_03-35"; startUtc="2026-06-08T00:30:00Z"; endUtc="2026-06-08T00:35:00Z" },
    @{ date="2026-06-08"; label="03-35_to_03-40"; startUtc="2026-06-08T00:35:00Z"; endUtc="2026-06-08T00:40:00Z" },
    @{ date="2026-06-08"; label="06-10_to_06-15"; startUtc="2026-06-08T03:10:00Z"; endUtc="2026-06-08T03:15:00Z" },
    @{ date="2026-06-08"; label="06-15_to_06-20"; startUtc="2026-06-08T03:15:00Z"; endUtc="2026-06-08T03:20:00Z" },
    @{ date="2026-06-08"; label="08-50_to_08-55"; startUtc="2026-06-08T05:50:00Z"; endUtc="2026-06-08T05:55:00Z" },
    @{ date="2026-06-08"; label="08-55_to_09-00"; startUtc="2026-06-08T05:55:00Z"; endUtc="2026-06-08T06:00:00Z" },
    @{ date="2026-06-08"; label="09-00_to_09-05"; startUtc="2026-06-08T06:00:00Z"; endUtc="2026-06-08T06:05:00Z" },
    @{ date="2026-06-08"; label="11-35_to_11-40"; startUtc="2026-06-08T08:35:00Z"; endUtc="2026-06-08T08:40:00Z" },
    @{ date="2026-06-08"; label="11-40_to_11-45"; startUtc="2026-06-08T08:40:00Z"; endUtc="2026-06-08T08:45:00Z" },
    @{ date="2026-06-08"; label="11-45_to_11-50"; startUtc="2026-06-08T08:45:00Z"; endUtc="2026-06-08T08:50:00Z" }
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
