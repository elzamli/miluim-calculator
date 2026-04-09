"""
מחשבון מילואים 2025
====================
לוגיקת חישוב זכאויות מילואים.
ניתן לייבא מודול זה לשרת Flask / FastAPI או להריץ ישירות.

שימוש:
    from miluim_calculator import calculate_benefits, MiluimInput
    result = calculate_benefits(MiluimInput(days=30, monthly_salary=12000,
                                            service_type='combat', family='married', rank='nco'))
    print(result)
"""

from dataclasses import dataclass, field
from typing import Literal

# ─────────────────────────────────────────────
# קבועים
# ─────────────────────────────────────────────

WORKING_DAYS_PER_MONTH = 22  # ימי עבודה ממוצע לחישוב שכר יומי

# שכר יומי מינימלי לפי דרגה (₪)
MIN_DAILY_BY_RANK: dict[str, int] = {
    "soldier": 300,   # טוראי – סמל
    "nco":     420,   # רב״ט – רס״ן
    "officer": 550,   # סגן – אלוף
}

# מענק לוחמים (₪) לפי אורך שירות
COMBAT_BONUS_LONG  = 3000   # 30 ימים ומעלה
COMBAT_BONUS_SHORT = 1500   # 14–29 ימים
COMBAT_BONUS_MIN_LONG  = 30
COMBAT_BONUS_MIN_SHORT = 14

# תוספת יומית משפחה (₪ ליום)
FAMILY_DAILY_BONUS: dict[str, int] = {
    "married": 25,
    "parent":  40,
    "single":   0,
}

# ─────────────────────────────────────────────
# טיפוס קלט
# ─────────────────────────────────────────────

ServiceType = Literal["combat", "support", "reserve"]
FamilyType  = Literal["married", "single", "parent"]
RankType    = Literal["soldier", "nco", "officer"]


@dataclass
class MiluimInput:
    """פרמטרי חישוב."""
    days:           int                          # מספר ימי מילואים
    monthly_salary: int          = 0            # שכר חודשי ברוטו (₪). 0 = השתמש במינימום
    service_type:   ServiceType  = "support"
    family:         FamilyType   = "single"
    rank:           RankType     = "soldier"
    year:           int          = 2025


# ─────────────────────────────────────────────
# טיפוס פלט
# ─────────────────────────────────────────────

@dataclass
class MiluimResult:
    """תוצאות החישוב."""
    daily_pay:    int   # שכר יומי (₪)
    base_total:   int   # פיצוי בסיסי = שכר יומי × ימים
    combat_bonus: int   # מענק לוחמים
    family_bonus: int   # תוספת משפחה
    grand_total:  int   # סה״כ זכאות

    def as_dict(self) -> dict:
        return {
            "שכר_יומי":         self.daily_pay,
            "פיצוי_בסיסי":      self.base_total,
            "מענק_לוחמים":      self.combat_bonus,
            "תוספת_משפחה":      self.family_bonus,
            "סהכ_זכאות":        self.grand_total,
        }

    def __str__(self) -> str:
        lines = [
            "─" * 36,
            " תוצאות מחשבון מילואים",
            "─" * 36,
            f"  שכר מילואים יומי    : {self.daily_pay:,} ₪",
            f"  פיצוי כולל לתקופה   : {self.base_total:,} ₪",
            f"  מענק לוחמים         : {self.combat_bonus:,} ₪",
            f"  תוספת משפחה         : {self.family_bonus:,} ₪",
            "─" * 36,
            f"  סה״כ זכאות משוערת  : {self.grand_total:,} ₪",
            "─" * 36,
        ]
        return "\n".join(lines)


# ─────────────────────────────────────────────
# פונקציות חישוב
# ─────────────────────────────────────────────

def calc_daily_pay(monthly_salary: int, rank: RankType) -> int:
    """מחשב שכר יומי: מקסימום בין שכר מחולק לימי עבודה לבין מינימום לפי דרגה."""
    from_salary = round(monthly_salary / WORKING_DAYS_PER_MONTH) if monthly_salary > 0 else 0
    return max(from_salary, MIN_DAILY_BY_RANK[rank])


def calc_combat_bonus(days: int, service_type: ServiceType) -> int:
    """מחשב מענק לוחמים לפי אורך שירות וסוג יחידה."""
    if service_type != "combat":
        return 0
    if days >= COMBAT_BONUS_MIN_LONG:
        return COMBAT_BONUS_LONG
    if days >= COMBAT_BONUS_MIN_SHORT:
        return COMBAT_BONUS_SHORT
    return 0


def calc_family_bonus(days: int, family: FamilyType) -> int:
    """מחשב תוספת משפחה יומית × ימי שירות."""
    return FAMILY_DAILY_BONUS.get(family, 0) * days


def calculate_benefits(inp: MiluimInput) -> MiluimResult:
    """
    מחשב את כלל הזכאויות ומחזיר MiluimResult.

    Parameters
    ----------
    inp : MiluimInput
        פרמטרי החישוב.

    Returns
    -------
    MiluimResult
        תוצאות החישוב.
    """
    if inp.days <= 0:
        raise ValueError("מספר ימים חייב להיות גדול מ-0")

    daily_pay    = calc_daily_pay(inp.monthly_salary, inp.rank)
    base_total   = daily_pay * inp.days
    combat_bonus = calc_combat_bonus(inp.days, inp.service_type)
    family_bonus = calc_family_bonus(inp.days, inp.family)
    grand_total  = base_total + combat_bonus + family_bonus

    return MiluimResult(
        daily_pay=daily_pay,
        base_total=base_total,
        combat_bonus=combat_bonus,
        family_bonus=family_bonus,
        grand_total=grand_total,
    )


# ─────────────────────────────────────────────
# Flask API (אופציונלי – הרץ ישירות לבדיקה)
# ─────────────────────────────────────────────

def create_flask_app():
    """
    יוצר אפליקציית Flask עם endpoint אחד: POST /calculate
    
    Body JSON לדוגמה:
    {
        "days": 30,
        "monthly_salary": 12000,
        "service_type": "combat",
        "family": "married",
        "rank": "nco"
    }
    """
    try:
        from flask import Flask, request, jsonify, send_from_directory
        import os
    except ImportError:
        raise ImportError("pip install flask")

    app = Flask(__name__, static_folder="static")

    @app.route("/")
    def index():
        return send_from_directory(".", "miluim_calculator.html")

    @app.route("/config.json")
    def get_config():
        """שרת את קובץ הקונפיגורציה"""
        return send_from_directory(".", "config.json")

    @app.route("/calculate", methods=["POST"])
    def api_calculate():
        data = request.get_json(force=True)
        try:
            inp = MiluimInput(
                days           = int(data.get("days", 0)),
                monthly_salary = int(data.get("monthly_salary", 0)),
                service_type   = data.get("service_type", "support"),
                family         = data.get("family", "single"),
                rank           = data.get("rank", "soldier"),
                year           = int(data.get("year", 2025)),
            )
            result = calculate_benefits(inp)
            return jsonify({"ok": True, "result": result.as_dict()})
        except (ValueError, KeyError) as e:
            return jsonify({"ok": False, "error": str(e)}), 400

    return app


# ─────────────────────────────────────────────
# הרצה ישירה לדוגמה
# ─────────────────────────────────────────────

if __name__ == "__main__":
    import sys

    # ── דוגמה 1: חישוב ישיר ──
    example = MiluimInput(
        days=30,
        monthly_salary=15000,
        service_type="combat",
        family="parent",
        rank="nco",
    )
    print(calculate_benefits(example))

    # ── דוגמה 2: הרצת שרת Flask ──
    if "--serve" in sys.argv:
        app = create_flask_app()
        print("\nמפעיל שרת על http://localhost:5000")
        app.run(debug=True, port=5000)
