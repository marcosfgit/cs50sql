# 🗄️ Harvard CS50SQL - Introduction to Databases with SQL

![CS50SQL](https://img.shields.io/badge/Course-Harvard_CS50SQL-blue?style=for-the-badge&logo=sqlite)
![Status](https://img.shields.io/badge/Status-In_Progress-orange?style=for-the-badge)
![Language](https://img.shields.io/badge/Language-SQL-lightgrey?style=for-the-badge&logo=sqlite)

## 🎯 Project Overview
This repository documents my journey through **Harvard University's CS50SQL**. The focus is on understanding how modern systems store, organize, and retrieve data efficiently using relational databases.

Beyond writing queries, the goal is to develop strong **data modeling thinking**, **query optimization awareness**, and a solid foundation in **database design principles**.

> "The most important part of a database design is not the database, but the data." — *Unknown*

---

## 🛠️ Core Engineering Skills
* **Relational Thinking:** Designing and understanding relationships between datasets using primary and foreign keys.
* **SQL Query Design:** Writing efficient `SELECT`, `JOIN`, `GROUP BY`, and nested queries to extract meaningful insights.
* **Data Modeling:** Structuring normalized databases to reduce redundancy and improve consistency.
* **Aggregation & Analytics:** Using SQL functions to transform raw data into actionable information.
* **Database Logic:** Understanding constraints, schema design, and how databases enforce integrity at scale.

---

## 🧠 Key Concepts Covered
* **Relational Databases & SQL Dialects:** Hands-on experience with SQLite, MySQL, and PostgreSQL.
* **CRUD Operations & Data Manipulation:** Writing robust `INSERT`, `UPDATE`, and `DELETE` queries, including table alterations and soft deletions.
* **Complex Data Retrieval:** Advanced query design utilizing nested logic (subqueries), table joins (`INNER`, `LEFT`, `RIGHT`), set operations, and Common Table Expressions (CTEs).
* **Database Design & Normalization:** Structuring schemas, enforcing entity integrity (Keys, Constraints, Triggers), and normalization principles.
* **Database Programming & Virtualization:** Creating Views for simplification, aggregation, and security.
* **Performance Optimization:** Accelerating queries using Indexes (including covering and partial indexes) and analyzing execution bottlenecks via `EXPLAIN QUERY PLAN`.
* **Concurrency & Data Integrity:** Implementing Transactions and ensuring ACID compliance to prevent race conditions and data corruption.
* **Scaling & Security:** Understanding horizontal/vertical scaling, sharding, replication, and mitigating SQL Injection vulnerabilities using Prepared Statements.

---

## 💻 Tech Stack & Tools
* **DBMS:** SQLite, MySQL, PostgreSQL
* **Concepts:** Database Normalization, Query Optimization, ACID Transactions, Database Security

---

## 📅 Roadmap & Progress

| Week | Topic | Status | Key Exercises |
| :--- | :--- | :---: | :--- |
| **0** | Querying | ✅ Done | `cyberchase.db`, `views.db`, `players.db` |
| **1** | Relating | ✅ Done | `packages.db`, `dese.db`, `moneyball.db` |
| **2** | Designing | ✅ Done | `atl.db`, `connect.db`, `donuts.db` |
| **3** | Writing | ✅ Done | `dont-panic.db`, `meteorites.db` |
| **4** | Viewing | ✅ Done | `census.db`, `private.db`, `bnb.db` |
| **5** | Optimizing | ✅ Done | `snap.db`, `harvard.db` |
| **6** | Scaling | ⏳ Upcoming | TBD |

---

## 🚀 How to Run the Queries
If you want to test any of the SQL exercises locally:

1. Install SQLite (if not already installed)
   ```bash
   sudo apt install sqlite3
   ```

2. Open a database file:
   ```bash
   sqlite3 filename.db
   ```

3. Run a SQL file:
   ```sql
   .read query.sql
   ```

## 📌 Notes
This repository is part of my continuous learning path towards **Cloud & Data Engineering**, strengthening my understanding of how data is structured and queried at scale.
