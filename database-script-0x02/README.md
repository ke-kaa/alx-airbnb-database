# 🌱 Airbnb Clone - Database Seed Script

This directory contains the SQL script to populate the Airbnb clone database with realistic sample data.

---

## 📁 Files

- **`seed.sql`**: SQL `INSERT` statements for all main tables: `User`, `Property`, `Booking`, `Payment`, `Review`, and `Message`.

---

## 🏗️ What’s Inside?

The script adds:

- ✅ 4 users (hosts and guests)
- ✅ 2 properties (listed by hosts)
- ✅ 2 bookings (linked to properties and guests)
- ✅ 1 payment (tied to a confirmed booking)
- ✅ 1 review (from a guest about a property)
- ✅ 2 messages (conversation between guest and host)

---

## 🧪 How to Use

1. **Ensure schema is created:**

```bash
psql -U your_username -d airbnb_clone -f ../database/schema.sql
```

### 🚀 Load Seed Data

```bash
psql -U your_username -d airbnb_clone -f seed.sql
```

### 📌 Notes

- UUIDs are auto-generated using uuid_generate_v4().
- Make sure the uuid-ossp extension is enabled:

```sql
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
```

- The seed data reflects real-world interactions to help test queries and business logic effectively.
