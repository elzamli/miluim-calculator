# Render Log Fetcher - RETRY for failed windows
# Filter: GET /config.json

$baseDir    = "C:\RenderLogs\config"
$resourceId = "srv-d7bv8dbbc2fs73fvvtq0"
$filterText = "GET /config.json"
$maxRetries = 5
$retryDelay = 5
$total      = 46
$index      = 1
$errors     = @()
$totalLines = 0

Write-Host ""
Write-Host "============================================================"
Write-Host " RETRY - 46 failed windows"
Write-Host "============================================================"
Write-Host ""

# 2026-04-28 10-55_to_11-00
if (-not (Test-Path "C:\RenderLogs\config\2026-04-28")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-28" | Out-Null }
Write-Host ("[$index/$total]  2026-04-28 10-55 -> 11-00  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-28T07:55:00Z" --end "2026-04-28T08:00:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-28\logs_2026-04-28_10-55_to_11-00.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-28\logs_2026-04-28_10-55_to_11-00.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-28 10-55_to_11-00"
    if (Test-Path "C:\RenderLogs\config\2026-04-28\logs_2026-04-28_10-55_to_11-00.txt") { Remove-Item "C:\RenderLogs\config\2026-04-28\logs_2026-04-28_10-55_to_11-00.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-28 13-30_to_13-35
if (-not (Test-Path "C:\RenderLogs\config\2026-04-28")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-28" | Out-Null }
Write-Host ("[$index/$total]  2026-04-28 13-30 -> 13-35  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-28T10:30:00Z" --end "2026-04-28T10:35:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-28\logs_2026-04-28_13-30_to_13-35.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-28\logs_2026-04-28_13-30_to_13-35.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-28 13-30_to_13-35"
    if (Test-Path "C:\RenderLogs\config\2026-04-28\logs_2026-04-28_13-30_to_13-35.txt") { Remove-Item "C:\RenderLogs\config\2026-04-28\logs_2026-04-28_13-30_to_13-35.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-28 13-35_to_13-40
if (-not (Test-Path "C:\RenderLogs\config\2026-04-28")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-28" | Out-Null }
Write-Host ("[$index/$total]  2026-04-28 13-35 -> 13-40  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-28T10:35:00Z" --end "2026-04-28T10:40:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-28\logs_2026-04-28_13-35_to_13-40.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-28\logs_2026-04-28_13-35_to_13-40.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-28 13-35_to_13-40"
    if (Test-Path "C:\RenderLogs\config\2026-04-28\logs_2026-04-28_13-35_to_13-40.txt") { Remove-Item "C:\RenderLogs\config\2026-04-28\logs_2026-04-28_13-35_to_13-40.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-28 16-10_to_16-15
if (-not (Test-Path "C:\RenderLogs\config\2026-04-28")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-28" | Out-Null }
Write-Host ("[$index/$total]  2026-04-28 16-10 -> 16-15  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-28T13:10:00Z" --end "2026-04-28T13:15:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-28\logs_2026-04-28_16-10_to_16-15.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-28\logs_2026-04-28_16-10_to_16-15.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-28 16-10_to_16-15"
    if (Test-Path "C:\RenderLogs\config\2026-04-28\logs_2026-04-28_16-10_to_16-15.txt") { Remove-Item "C:\RenderLogs\config\2026-04-28\logs_2026-04-28_16-10_to_16-15.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-28 16-15_to_16-20
if (-not (Test-Path "C:\RenderLogs\config\2026-04-28")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-28" | Out-Null }
Write-Host ("[$index/$total]  2026-04-28 16-15 -> 16-20  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-28T13:15:00Z" --end "2026-04-28T13:20:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-28\logs_2026-04-28_16-15_to_16-20.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-28\logs_2026-04-28_16-15_to_16-20.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-28 16-15_to_16-20"
    if (Test-Path "C:\RenderLogs\config\2026-04-28\logs_2026-04-28_16-15_to_16-20.txt") { Remove-Item "C:\RenderLogs\config\2026-04-28\logs_2026-04-28_16-15_to_16-20.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-28 16-20_to_16-25
if (-not (Test-Path "C:\RenderLogs\config\2026-04-28")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-28" | Out-Null }
Write-Host ("[$index/$total]  2026-04-28 16-20 -> 16-25  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-28T13:20:00Z" --end "2026-04-28T13:25:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-28\logs_2026-04-28_16-20_to_16-25.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-28\logs_2026-04-28_16-20_to_16-25.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-28 16-20_to_16-25"
    if (Test-Path "C:\RenderLogs\config\2026-04-28\logs_2026-04-28_16-20_to_16-25.txt") { Remove-Item "C:\RenderLogs\config\2026-04-28\logs_2026-04-28_16-20_to_16-25.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-28 18-55_to_19-00
if (-not (Test-Path "C:\RenderLogs\config\2026-04-28")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-28" | Out-Null }
Write-Host ("[$index/$total]  2026-04-28 18-55 -> 19-00  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-28T15:55:00Z" --end "2026-04-28T16:00:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-28\logs_2026-04-28_18-55_to_19-00.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-28\logs_2026-04-28_18-55_to_19-00.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-28 18-55_to_19-00"
    if (Test-Path "C:\RenderLogs\config\2026-04-28\logs_2026-04-28_18-55_to_19-00.txt") { Remove-Item "C:\RenderLogs\config\2026-04-28\logs_2026-04-28_18-55_to_19-00.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-29 03-10_to_03-15
if (-not (Test-Path "C:\RenderLogs\config\2026-04-29")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-29" | Out-Null }
Write-Host ("[$index/$total]  2026-04-29 03-10 -> 03-15  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-29T00:10:00Z" --end "2026-04-29T00:15:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_03-10_to_03-15.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_03-10_to_03-15.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-29 03-10_to_03-15"
    if (Test-Path "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_03-10_to_03-15.txt") { Remove-Item "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_03-10_to_03-15.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-29 03-15_to_03-20
if (-not (Test-Path "C:\RenderLogs\config\2026-04-29")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-29" | Out-Null }
Write-Host ("[$index/$total]  2026-04-29 03-15 -> 03-20  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-29T00:15:00Z" --end "2026-04-29T00:20:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_03-15_to_03-20.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_03-15_to_03-20.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-29 03-15_to_03-20"
    if (Test-Path "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_03-15_to_03-20.txt") { Remove-Item "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_03-15_to_03-20.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-29 03-20_to_03-25
if (-not (Test-Path "C:\RenderLogs\config\2026-04-29")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-29" | Out-Null }
Write-Host ("[$index/$total]  2026-04-29 03-20 -> 03-25  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-29T00:20:00Z" --end "2026-04-29T00:25:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_03-20_to_03-25.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_03-20_to_03-25.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-29 03-20_to_03-25"
    if (Test-Path "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_03-20_to_03-25.txt") { Remove-Item "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_03-20_to_03-25.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-29 05-55_to_06-00
if (-not (Test-Path "C:\RenderLogs\config\2026-04-29")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-29" | Out-Null }
Write-Host ("[$index/$total]  2026-04-29 05-55 -> 06-00  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-29T02:55:00Z" --end "2026-04-29T03:00:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_05-55_to_06-00.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_05-55_to_06-00.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-29 05-55_to_06-00"
    if (Test-Path "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_05-55_to_06-00.txt") { Remove-Item "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_05-55_to_06-00.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-29 06-00_to_06-05
if (-not (Test-Path "C:\RenderLogs\config\2026-04-29")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-29" | Out-Null }
Write-Host ("[$index/$total]  2026-04-29 06-00 -> 06-05  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-29T03:00:00Z" --end "2026-04-29T03:05:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_06-00_to_06-05.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_06-00_to_06-05.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-29 06-00_to_06-05"
    if (Test-Path "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_06-00_to_06-05.txt") { Remove-Item "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_06-00_to_06-05.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-29 06-05_to_06-10
if (-not (Test-Path "C:\RenderLogs\config\2026-04-29")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-29" | Out-Null }
Write-Host ("[$index/$total]  2026-04-29 06-05 -> 06-10  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-29T03:05:00Z" --end "2026-04-29T03:10:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_06-05_to_06-10.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_06-05_to_06-10.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-29 06-05_to_06-10"
    if (Test-Path "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_06-05_to_06-10.txt") { Remove-Item "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_06-05_to_06-10.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-29 08-40_to_08-45
if (-not (Test-Path "C:\RenderLogs\config\2026-04-29")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-29" | Out-Null }
Write-Host ("[$index/$total]  2026-04-29 08-40 -> 08-45  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-29T05:40:00Z" --end "2026-04-29T05:45:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_08-40_to_08-45.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_08-40_to_08-45.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-29 08-40_to_08-45"
    if (Test-Path "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_08-40_to_08-45.txt") { Remove-Item "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_08-40_to_08-45.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-29 08-45_to_08-50
if (-not (Test-Path "C:\RenderLogs\config\2026-04-29")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-29" | Out-Null }
Write-Host ("[$index/$total]  2026-04-29 08-45 -> 08-50  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-29T05:45:00Z" --end "2026-04-29T05:50:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_08-45_to_08-50.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_08-45_to_08-50.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-29 08-45_to_08-50"
    if (Test-Path "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_08-45_to_08-50.txt") { Remove-Item "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_08-45_to_08-50.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-29 11-20_to_11-25
if (-not (Test-Path "C:\RenderLogs\config\2026-04-29")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-29" | Out-Null }
Write-Host ("[$index/$total]  2026-04-29 11-20 -> 11-25  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-29T08:20:00Z" --end "2026-04-29T08:25:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_11-20_to_11-25.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_11-20_to_11-25.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-29 11-20_to_11-25"
    if (Test-Path "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_11-20_to_11-25.txt") { Remove-Item "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_11-20_to_11-25.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-29 11-25_to_11-30
if (-not (Test-Path "C:\RenderLogs\config\2026-04-29")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-29" | Out-Null }
Write-Host ("[$index/$total]  2026-04-29 11-25 -> 11-30  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-29T08:25:00Z" --end "2026-04-29T08:30:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_11-25_to_11-30.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_11-25_to_11-30.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-29 11-25_to_11-30"
    if (Test-Path "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_11-25_to_11-30.txt") { Remove-Item "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_11-25_to_11-30.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-29 14-00_to_14-05
if (-not (Test-Path "C:\RenderLogs\config\2026-04-29")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-29" | Out-Null }
Write-Host ("[$index/$total]  2026-04-29 14-00 -> 14-05  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-29T11:00:00Z" --end "2026-04-29T11:05:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_14-00_to_14-05.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_14-00_to_14-05.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-29 14-00_to_14-05"
    if (Test-Path "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_14-00_to_14-05.txt") { Remove-Item "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_14-00_to_14-05.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-29 14-05_to_14-10
if (-not (Test-Path "C:\RenderLogs\config\2026-04-29")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-29" | Out-Null }
Write-Host ("[$index/$total]  2026-04-29 14-05 -> 14-10  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-29T11:05:00Z" --end "2026-04-29T11:10:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_14-05_to_14-10.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_14-05_to_14-10.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-29 14-05_to_14-10"
    if (Test-Path "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_14-05_to_14-10.txt") { Remove-Item "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_14-05_to_14-10.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-29 16-40_to_16-45
if (-not (Test-Path "C:\RenderLogs\config\2026-04-29")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-29" | Out-Null }
Write-Host ("[$index/$total]  2026-04-29 16-40 -> 16-45  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-29T13:40:00Z" --end "2026-04-29T13:45:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_16-40_to_16-45.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_16-40_to_16-45.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-29 16-40_to_16-45"
    if (Test-Path "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_16-40_to_16-45.txt") { Remove-Item "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_16-40_to_16-45.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-29 16-45_to_16-50
if (-not (Test-Path "C:\RenderLogs\config\2026-04-29")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-29" | Out-Null }
Write-Host ("[$index/$total]  2026-04-29 16-45 -> 16-50  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-29T13:45:00Z" --end "2026-04-29T13:50:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_16-45_to_16-50.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_16-45_to_16-50.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-29 16-45_to_16-50"
    if (Test-Path "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_16-45_to_16-50.txt") { Remove-Item "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_16-45_to_16-50.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-29 19-20_to_19-25
if (-not (Test-Path "C:\RenderLogs\config\2026-04-29")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-29" | Out-Null }
Write-Host ("[$index/$total]  2026-04-29 19-20 -> 19-25  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-29T16:20:00Z" --end "2026-04-29T16:25:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_19-20_to_19-25.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_19-20_to_19-25.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-29 19-20_to_19-25"
    if (Test-Path "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_19-20_to_19-25.txt") { Remove-Item "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_19-20_to_19-25.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-29 19-25_to_19-30
if (-not (Test-Path "C:\RenderLogs\config\2026-04-29")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-29" | Out-Null }
Write-Host ("[$index/$total]  2026-04-29 19-25 -> 19-30  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-29T16:25:00Z" --end "2026-04-29T16:30:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_19-25_to_19-30.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_19-25_to_19-30.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-29 19-25_to_19-30"
    if (Test-Path "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_19-25_to_19-30.txt") { Remove-Item "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_19-25_to_19-30.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-29 22-00_to_22-05
if (-not (Test-Path "C:\RenderLogs\config\2026-04-29")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-29" | Out-Null }
Write-Host ("[$index/$total]  2026-04-29 22-00 -> 22-05  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-29T19:00:00Z" --end "2026-04-29T19:05:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_22-00_to_22-05.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_22-00_to_22-05.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-29 22-00_to_22-05"
    if (Test-Path "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_22-00_to_22-05.txt") { Remove-Item "C:\RenderLogs\config\2026-04-29\logs_2026-04-29_22-00_to_22-05.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-30 00-35_to_00-40
if (-not (Test-Path "C:\RenderLogs\config\2026-04-30")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-30" | Out-Null }
Write-Host ("[$index/$total]  2026-04-30 00-35 -> 00-40  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-29T21:35:00Z" --end "2026-04-29T21:40:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_00-35_to_00-40.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_00-35_to_00-40.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-30 00-35_to_00-40"
    if (Test-Path "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_00-35_to_00-40.txt") { Remove-Item "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_00-35_to_00-40.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-30 00-40_to_00-45
if (-not (Test-Path "C:\RenderLogs\config\2026-04-30")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-30" | Out-Null }
Write-Host ("[$index/$total]  2026-04-30 00-40 -> 00-45  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-29T21:40:00Z" --end "2026-04-29T21:45:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_00-40_to_00-45.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_00-40_to_00-45.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-30 00-40_to_00-45"
    if (Test-Path "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_00-40_to_00-45.txt") { Remove-Item "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_00-40_to_00-45.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-30 00-45_to_00-50
if (-not (Test-Path "C:\RenderLogs\config\2026-04-30")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-30" | Out-Null }
Write-Host ("[$index/$total]  2026-04-30 00-45 -> 00-50  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-29T21:45:00Z" --end "2026-04-29T21:50:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_00-45_to_00-50.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_00-45_to_00-50.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-30 00-45_to_00-50"
    if (Test-Path "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_00-45_to_00-50.txt") { Remove-Item "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_00-45_to_00-50.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-30 03-20_to_03-25
if (-not (Test-Path "C:\RenderLogs\config\2026-04-30")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-30" | Out-Null }
Write-Host ("[$index/$total]  2026-04-30 03-20 -> 03-25  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-30T00:20:00Z" --end "2026-04-30T00:25:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_03-20_to_03-25.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_03-20_to_03-25.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-30 03-20_to_03-25"
    if (Test-Path "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_03-20_to_03-25.txt") { Remove-Item "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_03-20_to_03-25.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-30 03-25_to_03-30
if (-not (Test-Path "C:\RenderLogs\config\2026-04-30")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-30" | Out-Null }
Write-Host ("[$index/$total]  2026-04-30 03-25 -> 03-30  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-30T00:25:00Z" --end "2026-04-30T00:30:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_03-25_to_03-30.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_03-25_to_03-30.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-30 03-25_to_03-30"
    if (Test-Path "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_03-25_to_03-30.txt") { Remove-Item "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_03-25_to_03-30.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-30 03-30_to_03-35
if (-not (Test-Path "C:\RenderLogs\config\2026-04-30")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-30" | Out-Null }
Write-Host ("[$index/$total]  2026-04-30 03-30 -> 03-35  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-30T00:30:00Z" --end "2026-04-30T00:35:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_03-30_to_03-35.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_03-30_to_03-35.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-30 03-30_to_03-35"
    if (Test-Path "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_03-30_to_03-35.txt") { Remove-Item "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_03-30_to_03-35.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-30 06-05_to_06-10
if (-not (Test-Path "C:\RenderLogs\config\2026-04-30")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-30" | Out-Null }
Write-Host ("[$index/$total]  2026-04-30 06-05 -> 06-10  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-30T03:05:00Z" --end "2026-04-30T03:10:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_06-05_to_06-10.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_06-05_to_06-10.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-30 06-05_to_06-10"
    if (Test-Path "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_06-05_to_06-10.txt") { Remove-Item "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_06-05_to_06-10.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-30 08-40_to_08-45
if (-not (Test-Path "C:\RenderLogs\config\2026-04-30")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-30" | Out-Null }
Write-Host ("[$index/$total]  2026-04-30 08-40 -> 08-45  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-30T05:40:00Z" --end "2026-04-30T05:45:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_08-40_to_08-45.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_08-40_to_08-45.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-30 08-40_to_08-45"
    if (Test-Path "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_08-40_to_08-45.txt") { Remove-Item "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_08-40_to_08-45.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-30 08-45_to_08-50
if (-not (Test-Path "C:\RenderLogs\config\2026-04-30")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-30" | Out-Null }
Write-Host ("[$index/$total]  2026-04-30 08-45 -> 08-50  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-30T05:45:00Z" --end "2026-04-30T05:50:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_08-45_to_08-50.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_08-45_to_08-50.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-30 08-45_to_08-50"
    if (Test-Path "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_08-45_to_08-50.txt") { Remove-Item "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_08-45_to_08-50.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-30 11-20_to_11-25
if (-not (Test-Path "C:\RenderLogs\config\2026-04-30")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-30" | Out-Null }
Write-Host ("[$index/$total]  2026-04-30 11-20 -> 11-25  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-30T08:20:00Z" --end "2026-04-30T08:25:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_11-20_to_11-25.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_11-20_to_11-25.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-30 11-20_to_11-25"
    if (Test-Path "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_11-20_to_11-25.txt") { Remove-Item "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_11-20_to_11-25.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-30 11-25_to_11-30
if (-not (Test-Path "C:\RenderLogs\config\2026-04-30")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-30" | Out-Null }
Write-Host ("[$index/$total]  2026-04-30 11-25 -> 11-30  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-30T08:25:00Z" --end "2026-04-30T08:30:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_11-25_to_11-30.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_11-25_to_11-30.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-30 11-25_to_11-30"
    if (Test-Path "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_11-25_to_11-30.txt") { Remove-Item "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_11-25_to_11-30.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-30 11-30_to_11-35
if (-not (Test-Path "C:\RenderLogs\config\2026-04-30")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-30" | Out-Null }
Write-Host ("[$index/$total]  2026-04-30 11-30 -> 11-35  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-30T08:30:00Z" --end "2026-04-30T08:35:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_11-30_to_11-35.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_11-30_to_11-35.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-30 11-30_to_11-35"
    if (Test-Path "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_11-30_to_11-35.txt") { Remove-Item "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_11-30_to_11-35.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-30 14-05_to_14-10
if (-not (Test-Path "C:\RenderLogs\config\2026-04-30")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-30" | Out-Null }
Write-Host ("[$index/$total]  2026-04-30 14-05 -> 14-10  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-30T11:05:00Z" --end "2026-04-30T11:10:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_14-05_to_14-10.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_14-05_to_14-10.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-30 14-05_to_14-10"
    if (Test-Path "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_14-05_to_14-10.txt") { Remove-Item "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_14-05_to_14-10.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-30 14-10_to_14-15
if (-not (Test-Path "C:\RenderLogs\config\2026-04-30")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-30" | Out-Null }
Write-Host ("[$index/$total]  2026-04-30 14-10 -> 14-15  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-30T11:10:00Z" --end "2026-04-30T11:15:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_14-10_to_14-15.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_14-10_to_14-15.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-30 14-10_to_14-15"
    if (Test-Path "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_14-10_to_14-15.txt") { Remove-Item "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_14-10_to_14-15.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-30 14-15_to_14-20
if (-not (Test-Path "C:\RenderLogs\config\2026-04-30")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-30" | Out-Null }
Write-Host ("[$index/$total]  2026-04-30 14-15 -> 14-20  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-30T11:15:00Z" --end "2026-04-30T11:20:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_14-15_to_14-20.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_14-15_to_14-20.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-30 14-15_to_14-20"
    if (Test-Path "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_14-15_to_14-20.txt") { Remove-Item "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_14-15_to_14-20.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-30 16-50_to_16-55
if (-not (Test-Path "C:\RenderLogs\config\2026-04-30")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-30" | Out-Null }
Write-Host ("[$index/$total]  2026-04-30 16-50 -> 16-55  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-30T13:50:00Z" --end "2026-04-30T13:55:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_16-50_to_16-55.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_16-50_to_16-55.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-30 16-50_to_16-55"
    if (Test-Path "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_16-50_to_16-55.txt") { Remove-Item "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_16-50_to_16-55.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-04-30 16-55_to_17-00
if (-not (Test-Path "C:\RenderLogs\config\2026-04-30")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-04-30" | Out-Null }
Write-Host ("[$index/$total]  2026-04-30 16-55 -> 17-00  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-30T13:55:00Z" --end "2026-04-30T14:00:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_16-55_to_17-00.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_16-55_to_17-00.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-04-30 16-55_to_17-00"
    if (Test-Path "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_16-55_to_17-00.txt") { Remove-Item "C:\RenderLogs\config\2026-04-30\logs_2026-04-30_16-55_to_17-00.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-05-01 02-55_to_03-00
if (-not (Test-Path "C:\RenderLogs\config\2026-05-01")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-05-01" | Out-Null }
Write-Host ("[$index/$total]  2026-05-01 02-55 -> 03-00  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-04-30T23:55:00Z" --end "2026-05-01T00:00:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-05-01\logs_2026-05-01_02-55_to_03-00.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-05-01\logs_2026-05-01_02-55_to_03-00.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-05-01 02-55_to_03-00"
    if (Test-Path "C:\RenderLogs\config\2026-05-01\logs_2026-05-01_02-55_to_03-00.txt") { Remove-Item "C:\RenderLogs\config\2026-05-01\logs_2026-05-01_02-55_to_03-00.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-05-01 03-00_to_03-05
if (-not (Test-Path "C:\RenderLogs\config\2026-05-01")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-05-01" | Out-Null }
Write-Host ("[$index/$total]  2026-05-01 03-00 -> 03-05  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-05-01T00:00:00Z" --end "2026-05-01T00:05:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-05-01\logs_2026-05-01_03-00_to_03-05.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-05-01\logs_2026-05-01_03-00_to_03-05.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-05-01 03-00_to_03-05"
    if (Test-Path "C:\RenderLogs\config\2026-05-01\logs_2026-05-01_03-00_to_03-05.txt") { Remove-Item "C:\RenderLogs\config\2026-05-01\logs_2026-05-01_03-00_to_03-05.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-05-01 05-35_to_05-40
if (-not (Test-Path "C:\RenderLogs\config\2026-05-01")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-05-01" | Out-Null }
Write-Host ("[$index/$total]  2026-05-01 05-35 -> 05-40  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-05-01T02:35:00Z" --end "2026-05-01T02:40:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-05-01\logs_2026-05-01_05-35_to_05-40.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-05-01\logs_2026-05-01_05-35_to_05-40.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-05-01 05-35_to_05-40"
    if (Test-Path "C:\RenderLogs\config\2026-05-01\logs_2026-05-01_05-35_to_05-40.txt") { Remove-Item "C:\RenderLogs\config\2026-05-01\logs_2026-05-01_05-35_to_05-40.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-05-01 05-40_to_05-45
if (-not (Test-Path "C:\RenderLogs\config\2026-05-01")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-05-01" | Out-Null }
Write-Host ("[$index/$total]  2026-05-01 05-40 -> 05-45  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-05-01T02:40:00Z" --end "2026-05-01T02:45:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-05-01\logs_2026-05-01_05-40_to_05-45.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-05-01\logs_2026-05-01_05-40_to_05-45.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-05-01 05-40_to_05-45"
    if (Test-Path "C:\RenderLogs\config\2026-05-01\logs_2026-05-01_05-40_to_05-45.txt") { Remove-Item "C:\RenderLogs\config\2026-05-01\logs_2026-05-01_05-40_to_05-45.txt" }
}
$index++
Start-Sleep -Milliseconds 800

# 2026-05-01 08-15_to_08-20
if (-not (Test-Path "C:\RenderLogs\config\2026-05-01")) { New-Item -ItemType Directory -Path "C:\RenderLogs\config\2026-05-01" | Out-Null }
Write-Host ("[$index/$total]  2026-05-01 08-15 -> 08-20  fetching...") -NoNewline
$success = $false
for ($attempt = 1; $attempt -le $maxRetries; $attempt++) {
    $tmpErr = [System.IO.Path]::GetTempFileName()
    render logs --resources $resourceId --start "2026-05-01T05:15:00Z" --end "2026-05-01T05:20:00Z" --text "$filterText" --limit 1000 -o text > "C:\RenderLogs\config\2026-05-01\logs_2026-05-01_08-15_to_08-20.txt" 2>$tmpErr
    $errContent = Get-Content $tmpErr -ErrorAction SilentlyContinue
    Remove-Item $tmpErr -ErrorAction SilentlyContinue
    $hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
    if (-not $hasError) {
        $lines = (Get-Content "C:\RenderLogs\config\2026-05-01\logs_2026-05-01_08-15_to_08-20.txt" -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
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
    Write-Host ("  FAILED") -ForegroundColor Red
    $errors += "2026-05-01 08-15_to_08-20"
    if (Test-Path "C:\RenderLogs\config\2026-05-01\logs_2026-05-01_08-15_to_08-20.txt") { Remove-Item "C:\RenderLogs\config\2026-05-01\logs_2026-05-01_08-15_to_08-20.txt" }
}
$index++
Start-Sleep -Milliseconds 800

Write-Host ""
Write-Host "============================================================"
Write-Host (" Done! Total lines: $totalLines") -ForegroundColor Cyan
if ($errors.Count -gt 0) {
    Write-Host (" Still failed (" + $errors.Count + "):") -ForegroundColor Yellow
    $errors | ForEach-Object { Write-Host ("   - " + $_) -ForegroundColor Yellow }
} else {
    Write-Host " All retried successfully!" -ForegroundColor Green
}
Write-Host "============================================================"