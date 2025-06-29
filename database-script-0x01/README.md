# 🗃️ Airbnb Clone - Database Schema (DDL)

This directory contains the SQL schema for the Airbnb Clone project. It defines all entities, relationships, constraints, and indexes necessary to implement the backend database system.

---

## 📁 File Overview

- **`schema.sql`**: Contains the full DDL (Data Definition Language) SQL statements to create all tables and constraints.
- **(Optional)** `seed.sql`: Insert sample data to test the database (not included in this version).

---

## 🏗️ Schema Summary

### Entities (Tables):

1. **User**
2. **Property**
3. **Booking**
4. **Payment**
5. **Review**
6. **Message**

---

## ⚙️ Features & Constraints

- **UUID Primary Keys** for all tables (auto-generated using `uuid-ossp` extension in PostgreSQL).
- **Foreign Key Constraints** to maintain relationships and integrity.
- **CHECK Constraints** for enums like user roles, booking status, and rating values.
- **Indexing** for optimized queries on:
  - `User.email`
  - `Property.property_id`
  - `Booking.booking_id`, `property_id`
  - `Payment.booking_id`

---

## 🧪 How to Use

### Step 1: Set Up PostgreSQL

Make sure PostgreSQL is installed and running.

### Step 2: Create a Database

```sql
CREATE DATABASE airbnb_clone;
```
### Step 3: Connect to the Database

```sql
psql -U your_username -d airbnb_clone
```
### Step 4: Run the Schema File
```sql
-- Inside psql shell
\i path/to/schema.sql
```
### 📌 Example Relationships

- A **User** can be a **host** or **guest**.
- A **Property** is owned by a host (**User**).
- A **Booking** links a **guest** to a **Property**.
- A **Payment** is tied to a **Booking**.
- A **Review** is submitted by a **User** for a **Property**.
- **Messages** can be exchanged between **Users**.

---

### 🔐 Data Integrity

- `ON DELETE CASCADE` is used for all foreign key references to automatically clean up related data.
- All fields are normalized and follow **Third Normal Form (3NF)**, avoiding redundancy and ensuring consistency.

---

### 📦 Dependencies

- PostgreSQL **12+**
- `uuid-ossp` extension for UUID generation
