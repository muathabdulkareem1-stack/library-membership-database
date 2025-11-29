

# Library Database Management System

This project implements a complete database solution for managing library operations, including members, books, borrowing transactions, shelves, library cards, multi-valued attributes, and detailed security privileges. The system was designed using relational database principles and includes full documentation, testing, and administrative procedures.

---

## Overview

The project models the essential operations of a modern library, focusing on:

* Managing books, shelves, and categories
* Recording members, addresses, and phone numbers
* Handling borrowing and returning of books
* Tracking library cards and borrower activity
* Ensuring data integrity through relational constraints
* Applying user roles and security privileges
* Providing complete system documentation with all diagrams

All design diagrams are included in the **documentation folder**, covering:

* **ERD (Entity Relationship Diagram)**
* **DFD Level 0 and Level 1**
* **Flowcharts**
* **Logical and Physical Schema Diagrams**
* **Screenshots of the GUI**
* **Testing documentation**
* **System evaluation and improvements**

---

## Features

### Database Design

* Fully normalized relational schema
* Proper handling of multi-valued attributes
* Composite keys for associative entities
* Primary, foreign, unique, and check constraints
* Logical & physical schema definitions

### Views

* Borrowing history
* Member contact details
* Member identity summaries
* Library card information

### Stored Procedures

* Renewing library cards
* Updating book shelf assignments
* Adding phone numbers
* Adding additional addresses
* Processing borrowing and returns

### Security Model

* Complete role-based access control
* Custom database users:

  * Administrator
  * Book Manager
  * IT Support
* Privileges assigned using least-privilege principles

### Backup, Recovery & Maintenance

* Full, differential, and incremental backup strategies
* Recovery procedures for different failure scenarios
* Regular maintenance: indexing, statistics, data validation
* Data consistency and integrity enforcement

### Documentation

The **documentation folder** contains all system analysis and modeling artifacts, including:

* ERD diagrams
* DFD Level 0 and Level 1
* Flowcharts
* Schema diagrams
* GUI screenshots
* Test cases and validation reports
* Complete database explanation
* System evaluation and suggested improvements

This documentation fully explains the database design, system workflow, and implementation details.

---

## Repository Structure

```
library-database-management-system/
│
├── documentation/     # All diagrams, system analysis, testing, GUI screenshots
│
├── sql/               # All SQL scripts: tables, views, procedures, privileges

│
└── README.md
```

---

## Summary

This project demonstrates a complete database system built from scratch and supported by professional documentation. It includes schema design, SQL implementation, stored procedures, security roles, maintenance strategies, testing, and a comprehensive set of diagrams (ERD, DFDs, flowcharts, schema diagrams). It reflects a strong understanding of relational modeling and real-world DBMS practices.

