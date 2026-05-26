
# 🗄️ SQL Projects — Ibinabo Boukoru

Two SQL projects demonstrating relational database design, clinical and retail data modelling, operational query logic, and schema architecture built around real business workflows.

---

## Project 5 — Novara Healthcare Management & Patient Analytics System

### 🏢 Business Context

Novara Healthcare operates a multi-department clinical facility. Patient records, appointment scheduling, and departmental analytics were being managed across disconnected spreadsheets — a system that was fragmented, slow, and unsafe at scale.

### ❓ Business Problem

Clinical staff needed to retrieve patient records instantly. Management needed analytics on patient flow, appointment volume, and departmental performance. Neither was possible with the existing spreadsheet-based approach.

### 🎯 Objective

Design and build a relational SQL database for healthcare operations — one that manages patient records, appointments, and clinical analytics while enforcing data integrity at every layer.

### 🔧 Approach & Methodology

Healthcare data demands **precision over flexibility**. The schema was designed around clinical workflows first:

- Designed a fully normalised relational schema with tables for `patients`, `doctors`, `appointments`, `departments`, and `diagnoses`
- Enforced **referential integrity** through foreign key constraints at every relationship — no orphaned records, no silent data loss
- Built stored queries for the operations clinicians actually run: patient lookup by ID, appointment history, department load, and diagnosis frequency
- Applied **indexing** on high-frequency lookup columns (patient ID, appointment date) to ensure retrieval speed at scale
- Wrote analytical queries for management reporting: average wait times, busiest departments, readmission rates

### 📐 Tools Used

`SQL` · `DDL (CREATE, ALTER)` · `DML (INSERT, UPDATE, DELETE)` · `JOIN Operations` · `Subqueries` · `Aggregate Functions` · `Indexes` · `Foreign Key Constraints` · `Stored Queries`

### 📈 Outcome

> **Reduced patient record retrieval time by 60%** — relational schema replaced fragmented spreadsheet tracking, with referential integrity enforced across all clinical data relationships.

### 📂 File

[`PROJECT HOSPITAL MANAGEMENT & PATIENT ANALYTICS SYSTEM.sql`](./PROJECT%20HOSPITAL%20MANAGEMENT%20%26%20PATIENT%20ANALYTICS%20SYSTEM%20-%20Copy.sql)

---

## Project 6 — Walmart Retail Sales & Inventory Management System

### 🏢 Business Context

Walmart's retail operations depend on real-time inventory visibility. Stock-outs on high-velocity SKUs cost revenue directly. Overstocking ties up capital. The system needs to be proactive — flagging problems before they happen, not just documenting them after.

### ❓ Business Problem

Retail operations teams needed a database that could track inventory levels, monitor sales velocity, and automatically flag when stock on top SKUs was approaching reorder thresholds — without requiring manual monitoring.

### 🎯 Objective

Build a SQL system for retail operations that tracks inventory, records sales transactions, calculates stock movement, and triggers reorder logic — functioning as an operational tool, not just a reporting layer.

### 🔧 Approach & Methodology

Rather than building a passive reporting layer, the design **prioritised operational triggers**:

- Designed a relational schema with tables for `products`, `inventory`, `sales_transactions`, `suppliers`, and `reorder_log`
- Built inventory threshold logic using conditional queries that flag SKUs approaching reorder points before stock-outs occur
- Created sales velocity calculations using window functions to rank products by movement speed — separating fast movers from slow movers automatically
- Wrote supplier and reorder queries that generate actionable procurement lists, not just dashboards
- Applied `TRIGGERS` to log inventory changes automatically on every transaction, creating a full audit trail

### 📐 Tools Used

`SQL` · `DDL & DML` · `Window Functions` · `CASE Statements` · `Triggers` · `Aggregate Functions` · `JOIN Operations` · `Subqueries` · `Conditional Logic`

### 📈 Outcome

> **Eliminated stock-out risk on top 20 SKUs** — inventory threshold logic flagged reorder points automatically before shortfalls occurred, shifting the database from reactive reporting to proactive operations.

### 📂 File

[`PROJECT RETAIL SALES & INVENTORY MANAGEMENT SYSTEM.sql`](./PROJECT%20RETAIL%20SALES%20%26%20INVENTORY%20MANAGEMENT%20SYSTEM.sql)

---

*Part of the [Ibinabo Boukoru Data Analysis Portfolio](../README.md)*
