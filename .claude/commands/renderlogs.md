---
allowed-tools: PowerShell, Read, Write, Edit, Glob
---

# Render Logs Fetching Skill

You are helping the user execute the Render logs fetching routine. Follow the steps below based on what the user provides.

## Overview

This routine fetches logs from the Render CLI in 5-minute windows, with automatic retry for failed windows, and produces an Excel summary.

## Fixed Parameters

- **Resource ID:** `srv-d7bv8dbbc2fs73fvvtq0`
- **Filter:** `[LOG]`
- **Limit per request:** 1000 records
- **Output format:** `-o text`
- **Output directory:** `C:\RenderLogs\{YYYY-MM-DD}\`
- **Log file naming:** `logs_{date}_{HH-MM}_to_{HH-MM}.txt`
- **Scripts:** PowerShell + Python

---

## Step 1 — Main Fetch (`fetch_logs_windows1.ps1`)

The script reads `last_run.json` automatically to determine the start time — no input needed from the user. Just run it directly. Only update `$startIL` manually if the user explicitly provides a different start time.

```powershell
$startTime  = "YYYY-MM-DD HH:MM"   # Israeli time — update before each run
$resourceId = "srv-d7bv8dbbc2fs73fvvtq0"
$filterText = "[LOG]"
$baseDir    = "C:\RenderLogs"
$maxRetries = 3
$retryDelay = 3
$sleepMs    = 500
```

- Compute all 5-minute windows from `$startTime` to now
- Convert Israeli time → UTC (subtract 3 hours)
- Fetch each window: `render logs --resources ... --start ... --end ... --text "[LOG]" --limit 1000 -o text`
- Save each window to a separate text file under the date folder
- Retry up to 3 times per window
- Print failed windows at the end

Run command (always pipe to file so output can be read back automatically):
```powershell
powershell -ExecutionPolicy Bypass -File fetch_logs_windows.ps1 | Tee-Object -FilePath "run_output.txt"
```

---

## Step 2 — Retry Failed Windows (`retry_logs.ps1`)

After step 1 completes, read `run_output.txt` directly (do NOT ask the user to paste it):
- Use the Read tool on `run_output.txt` in the current working directory
- Parse FAILED lines using the regex patterns below to extract the failed windows automatically
- Generate `retry_logs.ps1` with those windows hardcoded

If the user asks to move to step 2, generate `retry_logs.ps1`:

```powershell
$maxRetries = 5
$retryDelay = 5
$sleepMs    = 800
```

Use this Python helper to convert Israeli time → UTC for each window:

```python
def il_to_utc(date_str, hhmm_str):
    h, m = hhmm_str.split("-")
    dt_il = datetime(int(date_str[:4]), int(date_str[5:7]), int(date_str[8:10]), int(h), int(m), 0)
    return (dt_il - timedelta(hours=3)).strftime("%Y-%m-%dT%H:%M:%SZ")
```

Windows list format:
```python
windows = [
    ("2026-05-10", "18-40", "18-45"),
    ("2026-05-10", "18-45", "18-50"),
    ...
]
```

Run command (pipe to file so step 3 can read it automatically):
```powershell
powershell -ExecutionPolicy Bypass -File retry_logs.ps1 | Tee-Object -FilePath "retry_output.txt"
```

---

## Step 3 — Generate Excel Summary (Python + openpyxl)

After step 2 completes, read both output files directly (do NOT ask the user to paste anything):
- Read `run_output.txt` for the main fetch results
- Read `retry_output.txt` (if it exists) for retry results
- Parse both files with the regex patterns below and produce the Excel file directly

Generate a Python script that produces an Excel file, then run it immediately with the Bash tool.

### Excel Structure

**Sheet 1 — Logs Summary:**

| Column | Content |
|--------|---------|
| תאריך | `YYYY-MM-DD` |
| משעה | `HH:MM` |
| עד שעה | `HH:MM` |
| כמות רשומות | line count fetched |
| סטטוס | `OK` / `OK (retry)` |

**Sheet 2 — Summary by Date** (multi-day runs): totals per date — record count + window count.

### Status Colors

| State | Color |
|-------|-------|
| OK (date A) | green / blue alternating by date |
| OK (retry) | yellow `#FFF2CC` |
| Header / Footer | dark blue `#1F4E79` |

### Regex patterns for parsing fetch output

```python
import re

ok_pattern = re.compile(
    r'\[(\d+)/(\d+)\]\s+(\d+/\d+)\s+(\d+:\d+)\s+->\s+(\d+/\d+)\s+(\d+:\d+)\s+fetching\.\.\.\s+OK \((\d+) lines\)'
)

fail_pattern = re.compile(
    r'\[(\d+)/(\d+)\]\s+(\d+/\d+)\s+(\d+:\d+)\s+->\s+(\d+/\d+)\s+(\d+:\d+)\s+fetching\.\.\.\s+.*FAILED'
)
```

Failed windows get their line count from `retry_data` — a dict the user provides based on retry run results.

Run command:
```powershell
python generate_excel.py --log run_output.txt --retry retry_results.txt
```

---

## Full Routine — Step by Step

```
1. Update $startTime in the fetch script
2. Run fetch → output saved automatically to run_output.txt
3. Claude reads run_output.txt, extracts failed windows, generates retry_logs.ps1
4. Run retry → output saved automatically to retry_output.txt
5. Claude reads both files, generates and runs Excel script
```

No copy-pasting required at any step — Claude reads the files directly.

---

## Output Folder Structure

```
C:\RenderLogs\
├── 2026-05-08\
│   ├── logs_2026-05-08_00-00_to_00-05.txt
│   ├── logs_2026-05-08_00-05_to_00-10.txt
│   └── ...
├── 2026-05-09\
│   └── ...
└── 2026-05-10\
    └── ...
```

---

## Typical Stats

- **Window size:** 5 minutes (last windows may be shorter)
- **Failure rate:** ~2–5% on first run
- **Retry success:** ~100% of failures recover on retry
- **Records per window:** 0–70 typical (1000 = API limit hit)

---

Now determine which step the user needs based on their message and execute it.
