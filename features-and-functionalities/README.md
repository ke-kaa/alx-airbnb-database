# 🏗️ Airbnb Clone - Backend Features and Functionalities

This document outlines the major features and backend functionalities supported by the Airbnb Clone project.

---

## 👤 User Management

- User Registration
- Login/Authentication (via email and password)
- User Roles:
  - **Guest**: Can browse and book properties
  - **Host**: Can list properties, manage bookings
  - **Admin**: Can manage users and moderate content
- Profile data (name, phone number, email, etc.)
- Secure password storage (e.g., hashed passwords)

---

## 🏠 Property Management

- Hosts can:
  - Create property listings
  - Update property details
  - Delete their listings
- Each property includes:
  - Title, description
  - Price per night
  - Location
  - Owner (host) reference

---

## 📅 Booking System

- Guests can:
  - View available properties by date
  - Create a booking for a property
- Booking Status:
  - `pending`, `confirmed`, `canceled`
- Total price calculated based on stay duration and price per night
- Conflict detection (prevent overlapping bookings)

---

## 💳 Payments

- Payments are associated with bookings
- Supported methods:
  - `credit_card`, `paypal`, `stripe`
- Payments stored with:
  - Amount
  - Payment date
  - Method
- Linked via `booking_id`

---

## 🌟 Reviews and Ratings

- Guests can:
  - Leave a review on a property they booked
  - Provide a `rating` (1–5 stars) and a comment
- Each review links:
  - User → Property

---

## 💬 Messaging

- Users can send messages to one another
- Each message includes:
  - Sender ID
  - Recipient ID
  - Message content
  - Timestamp

---

## 🔐 Data Integrity and Constraints

- UUID-based primary keys for all entities
- Foreign key constraints enforce relationships
- Enum validations (roles, booking status, payment methods)
- All tables conform to **3NF** (Third Normal Form)

---

## 📌 Notes

- The backend API will support CRUD operations for all major entities
- Admins may be able to manage all users and view all data
- Security measures such as input validation and authentication tokens (JWT or session-based) should be implemented in the extended backend

---

## 🖼️ Visual Overview

See `features-diagram.png` for a high-level functional overview of the system components and interactions.
