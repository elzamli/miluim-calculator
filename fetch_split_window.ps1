# Render Log Fetcher - Split window 01/05 11:05-11:10 (2x 2.5min)
# Fetches both [LOG] and GET /config.json

$resourceId = "srv-d7bv8dbbc2fs73fvvtq0"
$maxRetries = 5
$retryDelay = 5
$total = 4
$idx   = 1

Write-Host ""
Write-Host "============================================================"
Write-Host " Split window: 01/05 11:05 -> 11:10  (2 x 2.5min, 2 filters)"
Write-Host "============================================================"
Write-Host ""

# ---- Filter: [LOG] ----
if (-not (Test-Path "C:\RenderLogs\2026-05-01")) { New-Item -ItemType Directory -Path "C:\RenderLogs\2026-05-01" | Out-Null }

Write-Host ("[$idx/$total]  11:05 -> 11:07 [[LOG]]  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-05-01T08:05:00Z" --end "2026-05-01T08:07:30Z" --text "[LOG]" --limit 1000 -o text > "C:\RenderLogs\2026-05-01\logs_2026-05-01_11-05-00_to_11-07-30.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $cnt = (Get-Content "C:\RenderLogs\2026-05-01\logs_2026-05-01_11-05-00_to_11-07-30.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
        Write-Host ("  OK ($cnt lines)")
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
    Write-Host ("  FAILED") -ForegroundColor Red
}
$idx++
Start-Sleep -Milliseconds 500

Write-Host ("[$idx/$total]  11:07 -> 11:10 [[LOG]]  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-05-01T08:07:30Z" --end "2026-05-01T08:10:00Z" --text "[LOG]" --limit 1000 -o text > "C:\RenderLogs\2026-05-01\logs_2026-05-01_11-07-30_to_11-10-00.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $cnt = (Get-Content "C:\RenderLogs\2026-05-01\logs_2026-05-01_11-07-30_to_11-10-00.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
        Write-Host ("  OK ($cnt lines)")
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
    Write-Host ("  FAILED") -ForegroundColor Red
}
$idx++
Start-Sleep -Milliseconds 500

# ---- Filter: GET /config.json ----
if (-not (Test-Path "C:\RenderLogs\config\2026-05-01")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-05-01" | Out-Null }

Write-Host ("[$idx/$total]  11:05 -> 11:07 [GET /config.json]  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-05-01T08:05:00Z" --end "2026-05-01T08:07:30Z" --text "GET /config.json" --limit 1000 -o text > "C:\RenderLogs\config\2026-05-01\config_2026-05-01_11-05-00_to_11-07-30.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $cnt = (Get-Content "C:\RenderLogs\config\2026-05-01\config_2026-05-01_11-05-00_to_11-07-30.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
        Write-Host ("  OK ($cnt lines)")
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
    Write-Host ("  FAILED") -ForegroundColor Red
}
$idx++
Start-Sleep -Milliseconds 500

Write-Host ("[$idx/$total]  11:07 -> 11:10 [GET /config.json]  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-05-01T08:07:30Z" --end "2026-05-01T08:10:00Z" --text "GET /config.json" --limit 1000 -o text > "C:\RenderLogs\config\2026-05-01\config_2026-05-01_11-07-30_to_11-10-00.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $cnt = (Get-Content "C:\RenderLogs\config\2026-05-01\config_2026-05-01_11-07-30_to_11-10-00.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
        Write-Host ("  OK ($cnt lines)")
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
    Write-Host ("  FAILED") -ForegroundColor Red
}
$idx++
Start-Sleep -Milliseconds 500

Write-Host ""
Write-Host "Done!" -ForegroundColor Green
Write-Host "============================================================"