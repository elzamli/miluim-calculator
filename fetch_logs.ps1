# תיקיית יעד לשמירת הלוגים
$outputDir = "C:\RenderLogs"

# צור את התיקייה אם לא קיימת
if (-not (Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir | Out-Null
    Write-Host "Created folder: $outputDir"
}

Write-Host "Starting log collection every 10 minutes. Press Ctrl+C to stop."

while ($true) {
    # שם קובץ עם תאריך ושעה
    $timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm"
    $fileName = "$outputDir\logs_$timestamp.txt"

    Write-Host "[$timestamp] Fetching logs..."

    # הרצת הפקודה
    render logs --resources srv-d7bv8dbbc2fs73fvvtq0 --start 4h --text "[LOG]" -o text --limit 1000 > $fileName

    Write-Host "[$timestamp] Saved to $fileName"

    # המתן 10 דקות
    Start-Sleep -Seconds 600
}
