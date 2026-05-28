#!/usr/bin/env python3
"""
Zenith Audience · Google Trends Helper

Usa pytrends (gratis · sin API key) para detectar tendencias.
Output JSON listo para consumir por el agente trend-google.

Uso:
  python pytrends-helper.py --keyword "menopausia" --region ES --period 30d

Requisitos: pip install pytrends
"""

import json
import sys
import argparse
from datetime import datetime

try:
    from pytrends.request import TrendReq
except ImportError:
    print(json.dumps({"error": "pytrends no instalado. Ejecuta: pip install pytrends"}))
    sys.exit(1)


def map_period(period: str) -> str:
    """Mapea períodos legibles a formato pytrends"""
    mapping = {
        "1h": "now 1-H",
        "4h": "now 4-H",
        "1d": "now 1-d",
        "7d": "now 7-d",
        "30d": "today 1-m",
        "90d": "today 3-m",
        "1y": "today 12-m",
        "5y": "today 5-y",
        "all": "all"
    }
    return mapping.get(period, "today 1-m")


def map_region(region: str) -> str:
    """Mapea regiones legibles a códigos pytrends"""
    mapping = {
        "ES": "ES",
        "BR": "BR",
        "USA": "US",
        "LATAM": "",  # No hay code LATAM · usar país específico
        "MX": "MX",
        "AR": "AR",
        "CL": "CL",
        "CO": "CO",
        "GLOBAL": ""
    }
    return mapping.get(region.upper(), region.upper())


def get_trends(keyword: str, region: str = "ES", period: str = "30d", lang: str = "es") -> dict:
    """Obtiene trends para una keyword"""
    try:
        pytrends = TrendReq(hl=f"{lang}-{region}", tz=360)

        pytrends.build_payload(
            kw_list=[keyword],
            cat=0,
            timeframe=map_period(period),
            geo=map_region(region),
            gprop=""
        )

        # Datos principales
        interest_over_time = pytrends.interest_over_time()
        related_queries = pytrends.related_queries()
        related_topics = pytrends.related_topics()
        interest_by_region = pytrends.interest_by_region(resolution='COUNTRY')

        result = {
            "keyword": keyword,
            "region": region,
            "period": period,
            "timestamp": datetime.now().isoformat(),
            "trend_data": {
                "average_interest": int(interest_over_time[keyword].mean()) if not interest_over_time.empty else 0,
                "peak_interest": int(interest_over_time[keyword].max()) if not interest_over_time.empty else 0,
                "current_interest": int(interest_over_time[keyword].iloc[-1]) if not interest_over_time.empty else 0,
                "trend_direction": "subiendo" if not interest_over_time.empty and interest_over_time[keyword].iloc[-1] > interest_over_time[keyword].iloc[0] else "cayendo"
            },
            "related_queries_top": [],
            "related_queries_rising": [],
            "interest_by_region_top10": {}
        }

        # Related queries
        if related_queries[keyword]["top"] is not None:
            result["related_queries_top"] = related_queries[keyword]["top"].head(10).to_dict("records")
        if related_queries[keyword]["rising"] is not None:
            result["related_queries_rising"] = related_queries[keyword]["rising"].head(10).to_dict("records")

        # Top regions
        if not interest_by_region.empty:
            top_regions = interest_by_region.sort_values(by=keyword, ascending=False).head(10)
            result["interest_by_region_top10"] = top_regions[keyword].to_dict()

        return result

    except Exception as e:
        return {"error": str(e), "keyword": keyword}


def main():
    parser = argparse.ArgumentParser(description="Zenith Audience · Google Trends Helper")
    parser.add_argument("--keyword", required=True, help="Keyword a analizar")
    parser.add_argument("--region", default="ES", help="Región (ES · BR · USA · MX · etc.)")
    parser.add_argument("--period", default="30d", help="Período (7d · 30d · 90d · 1y)")
    parser.add_argument("--lang", default="es", help="Idioma (es · pt · en)")

    args = parser.parse_args()

    result = get_trends(args.keyword, args.region, args.period, args.lang)
    print(json.dumps(result, indent=2, ensure_ascii=False, default=str))


if __name__ == "__main__":
    main()
