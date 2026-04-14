# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Running the project

```bash
pip install -r requirements.txt
python miluim_calculator.py --serve   # dev server on http://localhost:5000
```

For production (Render):
- **Build command:** `pip install -r requirements.txt`
- **Start command:** `gunicorn miluim_calculator:app`

## Architecture

The project is a single-page miluim (reserve duty) benefits calculator with two layers:

### Frontend — `miluim_calculator.html`
A self-contained HTML/CSS/JS file. All calculation logic lives in JavaScript inside `<script>` tags. The page fetches `/config.json` on load to determine display mode (`test` or `client`). No build step, no bundler.

### Backend — `miluim_calculator.py`
A Flask app that:
1. Serves `miluim_calculator.html` at `/`
2. Serves `config.json` at `/config.json`
3. Exposes a `POST /calculate` REST endpoint (mirrors the JS logic in Python)

The top-level `app = create_flask_app()` line exposes the Flask instance for gunicorn (`miluim_calculator:app`).

### Config — `config.json`
Controls display mode:
- `"mode": "test"` — shows all intermediate calculation rows (OPT1/2/3, allocations, Z, etc.)
- `"mode": "client"` — hides internal rows, shows only final amounts

### Static assets — `static/`
Contains `logo.png` only.

## Key domain concepts

- Calculations span years 2023–2025, each with separate routine (`שגרה`) and emergency (`חירום`) days
- Emergency days < 31 in 2025 triggers a "special rule" path that replaces the standard 32–60 bonus with a flat `Z × 133.33` payment
- `Z` = total emergency days used across all years (capped by category allocations)
- Categories: fighter (`לוחם`), gamar (`גמ"ר`), other (`אחר`)
- `finalGrand` is rounded to 2 decimal places: `Math.round(value * 100) / 100`
- Currency formatting uses `toLocaleString('he-IL', { minimumFractionDigits: 2, maximumFractionDigits: 2 })`
