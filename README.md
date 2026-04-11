# Netflix Data Analysis Dashboard

A comprehensive SQL-driven data analysis of Netflix's content library with an interactive React dashboard.

## 📊 Overview

- **Total Titles:** 8,807 (Movies: 69.6%, TV Shows: 30.4%)
- **Countries:** 150+ | **Genres:** 40+ | **SQL Queries:** 15+

## 🎯 Key Findings

- **Top Country:** USA (41.9%) | **Growth Market:** India (11.9%)
- **Top Genres:** International Movies (31.3%), Dramas (27.6%)
- **Content Quality:** 96.1% "Good" content
- **Most Prolific Actor:** Anupam Kher (43 appearances)

## 🛠️ Technical Stack

### Backend & Data Processing
- **Database:** PostgreSQL
- **Language:** Python 3.11
- **Libraries:** Pandas, NumPy
- **SQL:** Advanced queries with window functions, CTEs, and array operations

### Frontend & Visualization
- **Framework:** React 19
- **Styling:** Tailwind CSS 4
- **Charting:** Recharts
- **UI Components:** shadcn/ui
- **Design:** Dark cinematic theme with glassmorphism

### Development Tools
- **Build Tool:** Vite
- **Package Manager:** pnpm
- **Version Control:** Git

## 📂 Repository Structure

```
netflix-data-analysis/
├── assets/                       # Project assets and visualizations
├── data/
│   └── netflix_titles.csv        # Raw Netflix dataset
├── reports/
│   └── NETFLIX_ANALYSIS_COMPLETE_REPORT.pdf   # Comprehensive analysis report
└── README.md                     # Project documentation
```

## 🚀 Getting Started

### Prerequisites
- Node.js 22.13.0+
- pnpm 10.4.1+
- Python 3.11+ (for data processing)

### Installation

```bash
git clone https://github.com/Purva-Thorat/netflix-data-analysis.git
cd netflix-data-analysis
pnpm install
```

### Development

Start the development server:
```bash
pnpm dev
```

The dashboard will be available at `http://localhost:3000/`

### Production Build

Build for production:
```bash
pnpm build
```

Start production server:
```bash
pnpm start
```

## 📊 Dashboard

**Live:** https://netflixdash-qhvxeycx.manus.space/?manus_scraper=1

- 8+ interactive visualizations
- Netflix branding integration
- Dark cinematic design theme
- Responsive across all devices

## 🛠️ SQL Analysis

15+ queries covering content distribution, geographic analysis, genre patterns, and talent metrics.

## 📜 License

MIT License

---

**Status:** ✅ Production-Ready | **Dashboard:** https://netflix-data-analysis.manus.space
