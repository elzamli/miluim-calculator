# Render Log Fetcher - 5min windows from 28.4 08:00 Israel time
# Filter: GET /config.json
# Save to date folders under config
$baseDir    = "C:\RenderLogs\config"
$resourceId = "srv-d7bv8dbbc2fs73fvvtq0"
$filterText = "GET /config.json"
$israelOffsetHours = 3
$maxRetries = 3
$retryDelay = 3

if (-not (Test-Path $baseDir)) {
    New-Item -ItemType Directory -Path $baseDir | Out-Null
    Write-Host "Created folder: $baseDir"
}

$startIL  = [DateTime]::new(2026, 4, 28, 8, 0, 0)
$startUtc = $startIL.AddHours(-$israelOffsetHours)
$nowUtc   = (Get-Date).ToUniversalTime()
$israelNow = $nowUtc.AddHours($israelOffsetHours)

Write-Host ""
Write-Host "============================================================"
Write-Host " Render Log Fetcher - config.json requests"
Write-Host "============================================================"
Write-Host (" Start (IL): " + $startIL.ToString("yyyy-MM-dd HH:mm"))
Write-Host (" Now   (IL): " + $israelNow.ToString("yyyy-MM-dd HH:mm"))
Write-Host (" Filter:     GET /config.json")
Write-Host "============================================================"
Write-Host ""

$total = [math]::Ceiling(($nowUtc - $startUtc).TotalMinutes / 5)
Write-Host "Total windows to fetch: $total"
Write-Host ""

$windowStart = $startUtc
$index       = 1
$errors      = @()
$totalLines  = 0

while ($windowStart -lt $nowUtc) {

    $windowEnd = $windowStart.AddMinutes(5)
    if ($windowEnd -gt $nowUtc) { $windowEnd = $nowUtc }

    $ilStart = $windowStart.AddHours($israelOffsetHours)
    $ilEnd   = $windowEnd.AddHours($israelOffsetHours)

    $dateStr   = $ilStart.ToString("yyyy-MM-dd")
    $outputDir = "$baseDir\$dateStr"

    if (-not (Test-Path $outputDir)) {
        New-Item -ItemType Directory -Path $outputDir | Out-Null
        Write-Host "  Created folder: $outputDir"
    }

    $label    = $ilStart.ToString("HH-mm") + "_to_" + $ilEnd.ToString("HH-mm")
    $fileName = "$outputDir\logs_${dateStr}_$label.txt"

    $startStr = $windowStart.ToString("yyyy-MM-ddTHH:mm:ssZ")
    $endStr   = $windowEnd.ToString("yyyy-MM-ddTHH:mm:ssZ")

    Write-Host ("[$index/$total]  " + $ilStart.ToString("dd/MM HH:mm") + " -> " + $ilEnd.ToString("dd/MM HH:mm") + "  fetching...") -NoNewline

    $success = $false
    for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {

        $tmpErr = [System.IO.Path]::GetTempFileName()

        render logs --resources $resourceId --start "$startStr" --end "$endStr" --text "$filterText" --limit 1000 -o text > $fileName 2>$tmpErr

        $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
        Remove-Item $tmpErr -ErrorAction SilentlyContinue

        $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")

        if (-not $hasError) {
            $lines = (Get-Content $fileName -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
            Write-Host ("  OK ($lines lines)")
            $totalLines += $lines
            $success = $true
            break
        } else {
            if ($attempt -lt $maxRetries) {
                Write-Host ("  retry $attempt/$maxRetries...") -NoNewline
                Start-Sleep -Seconds $retryDelay
            }
        }
    }

    if (-not $success) {
        Write-Host ("  FAILED after $maxRetries attempts") -ForegroundColor Red
        $errors += "$dateStr $label"
        if (Test-Path $fileName) { Remove-Item $fileName }
    }

    $windowStart = $windowStart.AddMinutes(5)
    $index++

    Start-Sleep -Milliseconds 500
}

Write-Host ""
Write-Host "============================================================"
Write-Host (" Done! Logs saved to: $baseDir")
Write-Host (" Total lines fetched: $totalLines") -ForegroundColor Cyan

if ($errors.Count -gt 0) {
    Write-Host ""
    Write-Host (" Failed windows (" + $errors.Count + "):") -ForegroundColor Yellow
    $errors | ForEach-Object { Write-Host ("   - " + $_) -ForegroundColor Yellow }
    Write-Host ""
    Write-Host " Copy the list above and send to Claude for a retry script" -ForegroundColor Yellow
} else {
    Write-Host " All windows fetched successfully!" -ForegroundColor Green
}
Write-Host "============================================================"
