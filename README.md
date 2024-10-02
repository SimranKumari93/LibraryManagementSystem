# LibraryManagementSystem

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Database Schema](#database-schema)
- [Queries](#queries)
- [Contributing](#contributing)
- [License](#license)

## Introduction
The Library Management System is a project designed to manage books, patrons, borrowing records, and overdue items efficiently. This system aims to facilitate the daily operations of a library, allowing users to search for books, borrow them, and manage their accounts.

## Features
- **Book Management**: Add, update, and delete book records.
- **Patron Management**: Maintain records of library patrons.
- **Borrowing Records**: Keep track of which books are borrowed and by whom.
- **Overdue Items**: Identify overdue items for timely reminders.
- **Search Functionality**: Easily search for books and patrons.

## Installation
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/LibraryManagementSystem.git


   Database Schema
The database consists of the following tables:

Books

id: INT, Primary Key
title: VARCHAR
author: VARCHAR
published_year: YEAR
isbn: VARCHAR
copies_available: INT
Patrons

id: INT, Primary Key
name: VARCHAR
email: VARCHAR
phone: VARCHAR
address: VARCHAR
Borrowing Records

id: INT, Primary Key
book_id: INT, Foreign Key
patron_id: INT, Foreign Key
borrowed_date: DATE
due_date: DATE
returned_date: DATE
Overdue Items

id: INT, Primary Key
record_id: INT, Foreign Key
fine: DECIMAL
