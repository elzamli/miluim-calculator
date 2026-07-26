---
allowed-tools: PowerShell, Read, Write, Edit, Glob
---

# Render NOFESH Fetching Skill

מטפל **רק** בלוגים של `[NOFESH]` (חישובי שובר הנופש).
ללוגים כלליים — השתמש ב-`/renderlogs`.

## Fixed Parameters

- **Script:** `fetch_nofesh_windows.ps1` — קורא `last_run_nofesh.json`, שומר ל-`C:\RenderNofesh\{date}\nofesh_*.txt`
- **Retry generator:** `gen_retry_nofesh.py`
- **Resource ID:** `srv-d7bv8dbbc2fs73fvvtq0`

## NOFESH Log Format

```
[NOFESH] 2026-07-26T06:39:00.810733 | aleph_plus=78 aleph=0 bet=0 gimel=0 dalet=0 hey=0 child=True | base=aleph_plus total=4500 source=direct
```

שדה `source=` יכול להיות: `whatsapp | instagram | facebook | sms | miluim | direct`

---

## Step 1 — Main Fetch

הרץ **ללא** Tee-Object:

```powershell
powershell -ExecutionPolicy Bypass -File fetch_nofesh_windows.ps1
```

הפלט הולך לקובץ המשימה — קרא אותו אחרי שהמשימה מסתיימת.

---

## Step 2 — Retry Failed Windows

1. קרא את קובץ הפלט של המשימה (task output file)
2. עדכן `output_file` ב-`gen_retry_nofesh.py` לנתיב המלא של קובץ המשימה
3. הרץ: `python gen_retry_nofesh.py` — יוצר `retry_nofesh_logs.ps1`
4. הרץ: `powershell -ExecutionPolicy Bypass -File retry_nofesh_logs.ps1`
5. אם נשארו FAILED — חזור על שלב 2

Retry params:
```powershell
$maxRetries = 5
$retryDelay = 5
$sleepMs    = 800
```

---

## Step 3 — Generate Excel

```powershell
python generate_excel.py
```

מייצר `logs_summary_YYYYMMDD_HHMM.xlsx` עם 4 גיליונות:

### גיליון 3 — Nofesh by Source
| תאריך | סה"כ | whatsapp | instagram | facebook | sms | miluim | direct |

### גיליון 4 — Nofesh פירוט
פירוט לפי חלונות 5 דקות עם חלוקה לפי source.

**חשוב:** הספירה כוללת deduplication — אותם ערכי קלט באותה דקה נספרים פעם אחת בלבד.

---

## Flow Summary

```
1. fetch_nofesh_windows.ps1  (background)
2. wait → parse FAILEDs → gen_retry_nofesh.py → retry_nofesh_logs.ps1 → run
3. repeat retries until 0 FAILED
4. python generate_excel.py → xlsx
```

## Typical Stats

- **Window size:** 5 minutes
- **Failure rate:** ~2–5% first run, ~100% retry success
- **[NOFESH] records per window:** 0–30 (ממוצע ~5, שיא ~26 בזמן שיא)
- **Dedup rate:** ~18% (לחיצות כפולות על "חשב")

---

Now determine which step the user needs and execute it.
