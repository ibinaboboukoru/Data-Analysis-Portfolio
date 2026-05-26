
# 📊 Power BI Projects — Ibinabo Boukoru

Two Power BI projects demonstrating story-led dashboard design, behavioural analysis, and audience-first reporting across professional survey data and personal streaming history.

---

## Project 3 — Data Professional Survey Analysis

### 🏢 Business Context

The data industry is growing rapidly, but information about what professionals actually earn, what tools they use, and what makes them stay — or leave — is fragmented and often anecdotal. This project structures that information into a navigable, decision-ready report.

### ❓ Business Problem

Aspiring data professionals, hiring managers, and team leads lack a clear, visual picture of the salary landscape, tooling preferences, and satisfaction drivers across the data industry.

### 🎯 Objective

Transform raw survey responses into a Power BI report that tells a coherent career story — not just a collection of bar charts — answering: *Where are data professionals? What do they earn? What actually makes them stay?*

### 🔧 Approach & Methodology

Rather than displaying all survey fields equally, the approach was to **build a narrative arc**:

- Cleaned and transformed raw survey data using **Power Query**, handling inconsistent responses and null values
- Designed the report around three core questions executives and analysts both care about: geography, compensation, and satisfaction
- Used **DAX measures** to calculate average salaries by role, tool preference distributions, and satisfaction scores
- Applied a story-led layout — each page builds on the last, moving from *who they are* → *what they earn* → *what drives retention*
- Identified 3 career inflection points in the salary data that were invisible in the raw responses

### 📐 Tools Used

`Power BI Desktop` · `Power Query` · `DAX` · `Calculated Columns` · `Measures` · `Slicers` · `Custom Visuals`

### 📈 Outcome

> **Revealed 3 career inflection points** — survey analysis identified salary gaps and satisfaction drivers that were completely overlooked in the raw data.

### 📂 File

[`Data Professionals Survey.pbix`](./Data%20Professionals%20%20Survey.pbix)

---

## Project 4 — Spotify Streaming History Dashboard

### 🏢 Business Context

Personal behavioural data is a mirror. The patterns in how an individual consumes content — when, how long, what type — scale directly to how audiences behave at the brand level. This project proves that principle using real Spotify streaming history.

### ❓ Business Problem

Raw Spotify data export is unstructured JSON. There is no native way to visualise listening behaviour, identify patterns, or extract strategic insight from it without building a custom analytics layer.

### 🎯 Objective

Build an interactive Power BI dashboard that transforms personal streaming history into a behavioural analysis — mapping listening patterns, session lengths, peak usage times, and artist preferences across 12 months.

### 🔧 Approach & Methodology

The goal was to prove that **understanding individual-level patterns scales to audience strategy**:

- Imported and transformed raw Spotify JSON export data using **Power Query**, parsing nested fields and normalising timestamps
- Built calculated columns for session length, time-of-day categorisation, and listening streaks using **DAX**
- Designed the dashboard around behavioural peaks — not just top artists — to surface *when* and *how* listening happens, not just *what*
- Created a 12-month trend view that mirrors the kind of content consumption analysis used in brand audience strategy

### 📐 Tools Used

`Power BI Desktop` · `Power Query` · `DAX` · `JSON Data Import` · `Time Intelligence Functions` · `Custom Date Tables`

### 📈 Outcome

> **Mapped listening patterns across 12 months** — uncovered behavioural peaks that directly mirror content consumption strategy used in brand-level audience planning.

### 📂 File

[`spotify streaming project.pbix`](./spotify%20streaming%20project.pbix)

---

*Part of the [Ibinabo Boukoru Data Analysis Portfolio](../README.md)*
