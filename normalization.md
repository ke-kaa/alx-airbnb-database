# ✅ Database Normalization - Airbnb Clone

## 🎯 Objective

Ensure the Airbnb database design adheres to **Third Normal Form (3NF)** to eliminate redundancy, improve data integrity, and optimize storage.

---

## ⚙️ Normalization Process

### ➤ Step 1: First Normal Form (1NF)

**Definition:**  
- Each column contains atomic (indivisible) values.  
- Each record is unique.  
- No repeating groups.

**Validation:**  
- All attributes are atomic.  
- There are no arrays, multivalued attributes, or nested fields.  
✅ **All tables are in 1NF.**

---

### ➤ Step 2: Second Normal Form (2NF)

**Definition:**  
- Must first satisfy 1NF.  
- All non-key attributes must be fully functionally dependent on the entire primary key (especially in composite keys).

**Validation:**  
- All tables have **simple primary keys** (UUIDs).  
- No partial dependencies exist.  
✅ **All tables satisfy 2NF.**

---

### ➤ Step 3: Third Normal Form (3NF)

**Definition:**  
- Must first satisfy 2NF.  
- No transitive dependencies (non-key attributes should not depend on other non-key attributes).

---

## 🔍 3NF Validation & Redundancy Review

### 🧑‍💼 `User`
- No redundant data.
- All fields are directly dependent on `user_id`.
✅ In 3NF.

---

### 🏠 `Property`
- All fields directly depend on `property_id`.
- Host information is linked via `host_id`, avoiding duplication of host data.
✅ In 3NF.

---

### 📆 `Booking`
- No transitive dependencies.
- `total_price` is dependent on booking duration and `pricepernight`, but keeping it here is acceptable for performance and audit purposes.
- `status` is atomic and does not derive from another field.
✅ In 3NF (denormalized field `total_price` is justified).

---

### 💳 `Payment`
- `payment_method` and `amount` depend only on `payment_id`.
- No derived or redundant data.
✅ In 3NF.

---

### ⭐ `Review`
- All fields depend on `review_id`.
- Linked properly to user and property to avoid repeating names/emails.
✅ In 3NF.

---

### 💬 `Message`
- `sender_id` and `recipient_id` are FK references to avoid storing names/emails.
- `message_body` is atomic.
✅ In 3NF.

---

## 📝 Summary

| Table      | 1NF | 2NF | 3NF | Notes                                              |
|------------|-----|-----|-----|----------------------------------------------------|
| User       | ✅  | ✅  | ✅  | Well-normalized                                    |
| Property   | ✅  | ✅  | ✅  | Avoids repeating host data                         |
| Booking    | ✅  | ✅  | ✅  | `total_price` stored for performance (acceptable)  |
| Payment    | ✅  | ✅  | ✅  | No redundancy or transitive dependencies           |
| Review     | ✅  | ✅  | ✅  | Linked to users/properties by FK                   |
| Message    | ✅  | ✅  | ✅  | Fully normalized                                   |

---

## ✅ Conclusion

The database design meets the requirements of **Third Normal Form (3NF)**.  
All redundancies and transitive dependencies have been reviewed and eliminated, with the exception of the justified denormalization in the `Booking.total_price` field for efficiency.

