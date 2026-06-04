# Render Logs Fetching Routine — תיעוד מלא

## סקירה כללית

רוטינה לשליפת לוגים מ-Render CLI בחלונות של 5 דקות, עם מנגנון retry אוטומטי לחלונות שנכשלו, וסיכום ב-Excel.

---

## פרמטרים קבועים

| פרמטר | ערך |
|--------|-----|
| Resource ID | `srv-d7bv8dbbc2fs73fvvtq0` |
| Filter | `[LOG]` |
| Limit per request | 1000 רשומות |
| Output format | `-o text` |
| שפת הסקריפטים | PowerShell + Python |
| תיקיית פלט | `C:\RenderLogs\{YYYY-MM-DD}\` |
| שם קבצי לוג | `logs_{date}_{HH-MM}_to_{HH-MM}.txt` |

---

## שלב 1 — סקריפט שליפה ראשי (`fetch_logs_windows.ps1`)

### מה הוא עושה
- מחשב את כל חלונות ה-5 דקות מ-`$startTime` עד `$now`
- ממיר שעה ישראלית ל-UTC (הפחתת 3 שעות)
- שולף כל חלון עם `render logs --resources ... --start ... --end ... --text "[LOG]" --limit 1000 -o text`
- שומר כל חלון לקובץ טקסט נפרד בתיקייה לפי תאריך
- מנסה עד 3 פעמים לכל חלון (retry מובנה)
- בסוף מדפיס רשימת חלונות שנכשלו

### מבנה הפלט לקונסול
```
[N/TOTAL]  DD/MM HH:MM -> HH:MM  fetching...  OK (X lines)
[N/TOTAL]  DD/MM HH:MM -> HH:MM  fetching...  retry 1/3...  retry 2/3...  FAILED after 3 attempts
```

### סיכום בסוף הריצה
```
============================================================
 Done! Logs saved to: C:\RenderLogs
 Total lines fetched: XXXX

 Failed windows (N):
   - YYYY-MM-DD HH-MM_to_HH-MM
   ...
============================================================
```

### פרמטרים בסקריפט
```powershell
$startTime  = "2026-05-10 23:45"   # שעה ישראלית — לעדכן לפני כל ריצה
$resourceId = "srv-d7bv8dbbc2fs73fvvtq0"
$filterText = "[LOG]"
$baseDir    = "C:\RenderLogs"
$maxRetries = 3
$retryDelay = 3
$sleepMs    = 500
```

### לוגיקת זיהוי שגיאה
```powershell
$hasError = ($LASTEXITCODE -ne 0) -or ($errContent -match "Error:")
```
בודק גם exit code וגם תוכן stderr — מחק קבצים חלקיים בכישלון.

---

## שלב 2 — סקריפט Retry (`retry_logs.ps1`)

### מה הוא עושה
- מקבל רשימה קשיחה של חלונות שנכשלו (מוגדרת ידנית לפי פלט שלב 1)
- ממיר כל חלון ל-UTC
- מנסה עד 5 פעמים (retryDelay 5 שניות, sleep 800ms)
- שומר לאותן תיקיות תאריך כמו שלב 1
- מדפיס סיכום — כמה הצליחו, כמה עדיין נכשלו

### פרמטרים בסקריפט
```powershell
$maxRetries = 5
$retryDelay = 5
$sleepMs    = 800
```

### מבנה הגדרת החלונות (Python שמייצר את הסקריפט)
```python
windows = [
    ("2026-05-10", "18-40", "18-45"),
    ("2026-05-10", "18-45", "18-50"),
    ...
]
```

### המרת שעה ישראלית ל-UTC
```python
def il_to_utc(date_str, hhmm_str):
    h, m = hhmm_str.split("-")
    dt_il = datetime(int(date_str[:4]), int(date_str[5:7]), int(date_str[8:10]), int(h), int(m), 0)
    return (dt_il - timedelta(hours=3)).strftime("%Y-%m-%dT%H:%M:%SZ")
```

---

## שלב 3 — יצירת Excel (Python + openpyxl)

### מבנה קובץ האקסל

**גיליון 1 — Logs Summary:**

| עמודה | תוכן |
|-------|-------|
| תאריך | `YYYY-MM-DD` |
| משעה | `HH:MM` |
| עד שעה | `HH:MM` |
| כמות רשומות | מספר שורות שנשלפו |
| סטטוס | `OK` / `OK (retry)` |

**גיליון 2 — Summary by Date** (בקבצים רב-יומיים):
סיכום לפי תאריך — סה"כ רשומות + מספר חלונות.

### צבעי הסטטוס

| מצב | צבע |
|-----|-----|
| OK רגיל (תאריך A) | ירוק / כחול בהתחלפות לפי תאריך |
| OK (retry) | צהוב `#FFF2CC` |
| Header / Footer | כחול כהה `#1F4E79` |

### קריאת פלט ה-fetch ל-DataFrame
הסקריפט מנתח שורות בפורמט:
```
[N/TOTAL]  DD/MM HH:MM -> DD/MM HH:MM  fetching...  OK (X lines)
[N/TOTAL]  DD/MM HH:MM -> DD/MM HH:MM  fetching...  FAILED
```

חלון שמסומן `FAILED` מקבל את ספירת השורות מ-`retry_data` — dictionary שמוגדר ידנית לפי תוצאות הריצה.

---

## הרוטינה המלאה — שלב אחר שלב

```
1. עדכן $startTime בסקריפט fetch
2. הרץ: powershell -ExecutionPolicy Bypass -File fetch_logs_windows.ps1
3. העתק את רשימת "Failed windows" מהפלט
4. שלח לקלוד → מקבל retry_logs.ps1 מעודכן
5. הרץ: powershell -ExecutionPolicy Bypass -File retry_logs.ps1
6. שלח את כל הפלט לקלוד → מקבל קובץ Excel
```

---

## מבנה תיקיות הפלט

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

## נקודות חשובות לאוטומציה עתידית

1. **State — מאיזו שעה להמשיך:** צריך לשמור את ה-timestamp של סוף הריצה הקודמת (למשל ב-`last_run.json`).

2. **זיהוי שגויים אוטומטי:** הפלט כבר מכיל שורות `FAILED after 3 attempts` — אפשר לנתח עם regex ולבנות את ה-retry אוטומטית.

3. **יצירת Excel אוטומטית:** הסקריפט Python כבר יודע לנתח פלט טקסט ולייצר אקסל — צריך רק להעביר לו את קובץ הלוג של הריצה.

4. **הרצת Python מתוך PowerShell:**
   ```powershell
   python generate_excel.py --log run_output.txt --retry retry_results.txt
   ```

5. **שמירת פלט הריצה לקובץ:**
   ```powershell
   .\fetch_logs_windows.ps1 | Tee-Object -FilePath "run_output.txt"
   ```

---

## דוגמת regex לניתוח פלט

```python
import re

# שורת OK
ok_pattern = re.compile(
    r'\[(\d+)/(\d+)\]\s+(\d+/\d+)\s+(\d+:\d+)\s+->\s+(\d+/\d+)\s+(\d+:\d+)\s+fetching\.\.\.\s+OK \((\d+) lines\)'
)

# שורת FAILED
fail_pattern = re.compile(
    r'\[(\d+)/(\d+)\]\s+(\d+/\d+)\s+(\d+:\d+)\s+->\s+(\d+/\d+)\s+(\d+:\d+)\s+fetching\.\.\.\s+.*FAILED'
)
```

---

## כלים נדרשים

| כלי | שימוש |
|-----|-------|
| `render` CLI | שליפת לוגים מ-Render |
| PowerShell | סקריפטי fetch ו-retry |
| Python 3 + openpyxl | יצירת Excel |
| Claude (claude.ai) | יצירת סקריפטי retry + Excel |

---

## סטטיסטיקות אופייניות

- **גודל חלון:** 5 דקות (חלק מהחלונות האחרונים קצרים יותר)
- **אחוז כישלון:** ~2-5% מהחלונות נכשלים בריצה ראשונה
- **Retry:** בד"כ 100% מהשגויים מצליחים ב-retry
- **רשומות לחלון:** 0–70 בד"כ (שיא 1000 = מגבלת ה-API)
