# 🎵 SQL Music Store Analysis Project

## 📌 Project Overview

This project is a **SQL-based analysis** performed on the **Chinook (Music Store) database** using **PostgreSQL**.  
The aim is to solve **real-world business problems** that a **Data Analyst** typically handles while working with relational databases.

A total of **11 business-focused questions** are solved using **basic to advanced SQL concepts**.

This project is suitable for:
- Data Analyst portfolio  
- BCA / SQL academic project  
- SQL interview preparation  

---

## 🛠️ Tech Stack

- **Database**: PostgreSQL  
- **Dataset**: Chinook (Music Store Database)  
- **Tool**: pgAdmin  

### SQL Concepts Used
- SELECT, WHERE, ORDER BY  
- Aggregate Functions (COUNT, SUM, AVG)  
- INNER JOIN  
- Subqueries  
- Common Table Expressions (CTE)  
- Window Functions (ROW_NUMBER, PARTITION BY)  

---

## 📂 Tables Used

- Employee  
- Customer  
- Invoice  
- Invoice_Line  
- Track  
- Album  
- Artist  
- Genre  

---

## ❓ Business Questions Solved

### Q1️⃣ Senior Most Employee  
**Question:** Who is the senior-most employee based on job title?  
**How it was solved:**  
Sorted employees by job level/title and selected the top record.  
**SQL Concepts Used:** ORDER BY, LIMIT  

---

### Q2️⃣ Country with Most Invoices  
**Question:** Which country has the highest number of invoices?  
**How it was solved:**  
Invoices were grouped by country and counted to find the maximum.  
**SQL Concepts Used:** COUNT, GROUP BY, ORDER BY  

---

### Q3️⃣ Top 3 Invoice Totals  
**Question:** What are the top 3 highest invoice total values?  
**How it was solved:**  
Invoice totals were sorted in descending order and limited to top 3.  
**SQL Concepts Used:** ORDER BY, LIMIT  

---

### Q4️⃣ Best City by Revenue  
**Question:** Which city has generated the highest total revenue?  
**How it was solved:**  
Total invoice amount was summed city-wise and the highest value selected.  
**SQL Concepts Used:** SUM, GROUP BY  

---

### Q5️⃣ Best Customer  
**Question:** Who is the best customer based on total spending?  
**How it was solved:**  
Joined Customer and Invoice tables and calculated total spend per customer.  
**SQL Concepts Used:** JOIN, SUM, GROUP BY  

---

### Q6️⃣ Rock Music Listeners  
**Question:** Get email, first name, and last name of customers who listen to Rock music, ordered by email.  
**How it was solved:**  
Multiple tables were joined and filtered by Rock genre.  
**SQL Concepts Used:** DISTINCT, JOINs, WHERE, ORDER BY  

---

### Q7️⃣ Top Rock Artists  
**Question:** Identify the top 10 artists who have created the most Rock music tracks.  
**How it was solved:**  
Tracks were filtered by Rock genre and grouped by artist.  
**SQL Concepts Used:** COUNT, GROUP BY, JOINs  

---

### Q8️⃣ Tracks Longer Than Average  
**Question:** Find all tracks that are longer than the average track length.  
**How it was solved:**  
Calculated average track length using a subquery and compared values.  
**SQL Concepts Used:** Subquery, AVG  

---

### Q9️⃣ Customer Spending on Best-Selling Artist  
**Question:** Find how much each customer spent on the best-selling artist.  
**How it was solved:**  
Used a CTE to identify the top artist, then calculated customer-wise spending.  
**SQL Concepts Used:** CTE, JOINs, Aggregation  

---

### 🔟 Most Popular Genre by Country  
**Question:** Determine the most popular music genre for each country.  
**How it was solved:**  
Used CTE and window function to rank genres country-wise.  
**SQL Concepts Used:** CTE, ROW_NUMBER, PARTITION BY  

---

### Q1️⃣1️⃣ Top Customer per Country  
**Question:** Identify the top-spending customer in each country.  
**How it was solved:**  
Calculated total spending per customer and ranked them by country.  
**SQL Concepts Used:** Window Functions, CTE, Aggregation  

---

## 📁 Project Structure

---

## 📈 Key Learnings

- Solving real-world business problems using SQL  
- Working with relational databases  
- Using JOINs, CTEs, and Window Functions  
- Writing clean and interview-ready SQL queries  

---

## 🚀 How to Run the Project

1. Install PostgreSQL  
2. Load the Chinook database  
3. Open pgAdmin or any SQL editor  
4. Run `project1.sql`  

## 🙌 Author

**Nischay Kumar Singh**  
BCA Student | Aspiring Data Analyst & Data Engineer  

**Skills**: SQL • Excel • Power BI • Python  

⭐ If you like this project, don’t forget to star the repository!




