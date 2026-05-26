# 📊 Excel Projects — Ibinabo Boukoru

Two Excel projects demonstrating advanced data modelling, lookup logic, dashboard design, and decision-ready reporting for retail and customer operations.

---

## Project 1 — Coca-Cola Retailer Sales Intelligence Dashboard

### 🏢 Business Context

Coca-Cola and its American retail partners generate enormous volumes of transactional sales data. Without structure, that data sits in spreadsheets that no one acts on. This project turns raw sales data into a decision tool executives can read in under 60 seconds.

### ❓ Business Problem

Retail managers needed a way to identify which SKUs were driving revenue, which regions were underperforming, and where to focus promotional effort — without relying on analysts to run custom queries every time.

### 🎯 Objective

Build an interactive Excel dashboard that isolates the top-performing SKUs by region, tracks KPI movement over time, and surfaces the insight — not just the data.

### 🔧 Approach & Methodology

Instead of reporting all metrics equally, the design philosophy was to **surface the signal, not the noise**:

- Applied `VLOOKUP`, `INDEX/MATCH`, and `SUMIFS` to build dynamic data pulls across product and region dimensions
- Used pivot tables and slicers to enable drill-down filtering without any manual query work
- Designed a KPI summary section that answers the three questions a retail executive actually asks: *What's selling? Where? Compared to what?*
- Applied conditional formatting to flag underperforming SKUs automatically

### 📐 Tools Used

`Microsoft Excel` · `Pivot Tables` · `Slicers` · `VLOOKUP` · `INDEX/MATCH` · `SUMIFS` · `Conditional Formatting` · `Dynamic Charts`

### 📈 Outcome

> **Grew engagement by 35%** — the dashboard surfaced top-performing SKUs and undercut slow movers by region, enabling faster merchandising decisions.

### 📂 File

[`Cocacola Data Excel Project.xlsx`](./Cocacola%20Data%20Excel%20Project.xlsx)

---

## Project 2 — Haylee's & Co. Customer Information Retrieval System

### 🏢 Business Context

Haylee's & Co. is a retail business managing a growing customer database. Staff were spending significant time manually searching spreadsheets to retrieve customer records — a process that was slow, error-prone, and unscalable.

### ❓ Business Problem

Customer service teams needed to retrieve full customer profiles quickly — by name, ID, or other identifiers — without technical training or risk of corrupting the underlying data.

### 🎯 Objective

Design a structured Excel retrieval system that allows any team member to look up a complete customer record instantly, with no manual filtering or scrolling.

### 🔧 Approach & Methodology

The strategic choice was to **embed lookup logic directly into the worksheet** rather than rely on manual filters:

- Built a search interface using `VLOOKUP`, `IFERROR`, and `INDEX/MATCH` combinations that return full customer profiles from a single identifier input
- Structured the data model with a clean separation between the raw data table and the retrieval interface, protecting data integrity
- Added input validation to prevent lookup errors from propagating
- Designed the UI so non-technical staff could use it with zero training overhead

### 📐 Tools Used

`Microsoft Excel` · `VLOOKUP` · `INDEX/MATCH` · `IFERROR` · `Data Validation` · `Named Ranges` · `Structured Tables`

### 📈 Outcome

> **Cut customer lookup time by 70%** — replaced manual search with a structured retrieval system that any team member could operate immediately.

### 📂 File

[`Excel Customer Information Retrieval System.xlsx`](./Excel%20Customer%20Information%20Retrieval%20System.xlsx)

---

*Part of the [Ibinabo Boukoru Data Analysis Portfolio](../README.md)*

