# Cafe Billing Management System

A comprehensive web-based Cafe Billing Management System designed to simplify order management, billing, and sales reporting for small cafes and restaurants.

---

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Installation](#installation)
- [Usage Guide](#usage-guide)
- [File Structure](#file-structure)
- [Database Schema](#database-schema)
- [Screenshots](#screenshots)
- [Known Issues](#known-issues)
- [Future Enhancements](#future-enhancements)
- [License](#license)

---

## Overview

The Cafe Billing Management System is a lightweight application aimed at simplifying day-to-day cafe operations. From managing product inventories to tracking orders and generating receipts, this system offers an intuitive and feature-rich platform for administrators and staff.
 
---

## Features

### 1. Order Management
- Add, update, and delete orders.
- Quick product addition to orders using a user-friendly interface.

### 2. Product Management
- Manage categories and product details (price, description, availability).
- Dual-language support (English and Arabic).

### 3. Sales Reporting
- Generate reports by day, month, or custom date range.
- Separate totals for AM/PM sales.

### 4. Receipt Generation
- Generate and print receipts in English and Arabic.
- Automatically identify customers’ birthdays and display greetings.

### 5. User Management
- Multi-role support: Admin and Staff users.
- User authentication for secure access.

### 6. System Settings
- Update system details (name, contact info, cover images, etc.).
- Responsive, mobile-friendly design.

---

## Technologies Used

### Frontend
- **HTML5, CSS3, JavaScript**
- **Bootstrap 4**
- **jQuery**

### Backend
- **PHP**
- **MySQL Database**

### Tools
- **XAMPP** for local development.
- **phpMyAdmin** for database management.

---

## Installation

### Prerequisites
1. XAMPP or a similar PHP server.
2. A web browser (e.g., Chrome, Firefox).
3. Basic knowledge of PHP and MySQL.

### Steps
1. **Clone the Repository:**
   ```bash
   git clone https://github.com/your-username/cafe-billing-system.git
Import Database:

2. Open phpMyAdmin.
Create a new database named cafe_billing_db.
Import the file cafe_billing_db.sql.
Update Database Credentials:

3. Start the Server:
Open XAMPP and start Apache and MySQL.

4. Navigate to the project folder in your browser:
[http://localhost/cafe-billing-system](http://localhost/Billing_Cafe_System/login.php)

## Usage Guide
### Dashboard
Displays an overview of sales performance.
Navigation to different modules (Order Management, Reports, etc.).
### Managing Orders
Navigate to the Order Management section.
Add products to the order by clicking items from the product list.
Modify quantities or remove items directly in the order table.
Click Pay to finalize and generate the receipt.
### Generating Reports
Access the Sales Reports module.
Choose the desired date range and view detailed sales data

## Database Schema
### Tables

1. categories:
id: Primary key.
name: Category name (English).
name_ar: Category name (Arabic).

2. products:
id: Primary key.
category_id: Foreign key to categories.
name, name_ar: Product names in English and Arabic.
price: Product price.
status: Availability (1 = available, 0 = unavailable).

3. orders:
id: Primary key.
phone_no, name, BirthDate: Customer details.
total_amount, date_created: Order details.

4. order_items:
id: Primary key.
order_id: Foreign key to orders.
product_id: Foreign key to products.
qty, price, amount: Item details.

5. users:
id: Primary key.
name, username, password: User credentials.
type: Role (1 = Admin, 2 = Staff).


## Screenshots

### Dashboard
![image](https://github.com/user-attachments/assets/fa374a87-1da4-44f7-bacc-345e5a5e9b2b)

### Order Management
![image](https://github.com/user-attachments/assets/7d0ce287-bf33-4e0a-82c0-86f1978ae735)


### Sales Report
![image](https://github.com/user-attachments/assets/4d624c1a-f7f4-40d5-9a51-ddd755f92b0d)

### Receipt
![image](https://github.com/user-attachments/assets/d557ff13-559e-47bb-a293-934f3dfda7bb)

## Known Issues
Data Validation: Limited validation on inputs like phone numbers.
Hardcoded Variables: Some hardcoded strings may cause localization issues.

## Future Enhancements
Inventory tracking.
Advanced analytics for sales trends.
Improved user management with permissions.
Integrating email notifications for customers.

## License
This project is licensed under the MIT License.
