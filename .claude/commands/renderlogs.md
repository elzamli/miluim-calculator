---
allowed-tools: PowerShell, Read, Write, Edit, Glob
---

# Render LOG Fetching Skill

מטפל **רק** בלוגים של `[LOG]` (לוגים כלליים של האפליקציה).
לנופש — השתמש ב-`/rendernofesh`.

## Fixed Parameters

- **Script:** `fetch_logs_windows.ps1` — קורא `last_run.json`, שומר ל-`C:\RenderLogs\{date}\logs_*.txt`
- **Retry generator:** `gen_retry.py`
- **Resource ID:** `srv-d7bv8dbbc2fs73fvvtq0`

---

## Step 1 — Main Fetch

הרץ **ללא** Tee-Object (מונע נעילת קבצים):

```powershell
powershell -ExecutionPolicy Bypass -File fetch_logs_windows.ps1
```

הפלט הולך לקובץ המשימה האוטומטי — אחרי שהמשימה מסתיימת, קרא אותו ישירות.

---

## Step 2 — Retry Failed Windows

1. קרא את קובץ הפלט של המשימה (task output file)
2. עדכן `output_file` ב-`gen_retry.py` לנתיב המלא של קובץ המשימה
3. הרץ: `python gen_retry.py` — יוצר `retry_logs.ps1`
4. הרץ: `powershell -ExecutionPolicy Bypass -File retry_logs.ps1`
5. עדכן `retry_output.txt`:
   - אם זו ריצת retry ראשונה: `Copy-Item <task_output> retry_output.txt`
   - אם כבר קיים `retry_output.txt`: שרשר: `(Get-Content <prev> -Raw) + (Get-Content <new> -Raw) | Set-Content retry_output.txt -Encoding UTF8`
6. אם נשארו FAILED — חזור על שלב 2 עד שאין יותר כשלונות

Retry params ב-`gen_retry.py`:
```powershell
$maxRetries = 5
$retryDelay = 5
$sleepMs    = 800
```

---

## Step 3 — Copy Main Output & Generate Excel

```powershell
Copy-Item <task_output_of_step1> run_output.txt -Force
python generate_excel.py
```

מייצר `logs_summary_YYYYMMDD_HHMM.xlsx` עם 4 גיליונות (כולל NOFESH אם קיים ב-`C:\RenderNofesh\`).

---

## Flow Summary

```
1. fetch_logs_windows.ps1  (background)
2. wait → parse FAILEDs → gen_retry.py → retry_logs.ps1 → run
3. repeat retries until 0 FAILED
4. copy task output → run_output.txt
5. python generate_excel.py → xlsx
```

## Typical Stats

- **Window size:** 5 minutes
- **Failure rate:** ~2–5% first run, ~100% retry success
- **[LOG] records per window:** 0–70 typical

---

Now determine which step the user needs and execute it.
