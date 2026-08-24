# Microsoft Dynamics 365 Business Central – CRM Project

## Project Overview

This project is a **Customer Relationship Management (CRM) solution developed in Microsoft Dynamics 365 Business Central**.

The solution is designed to manage customer information and support the sales process in a centralized system. The CRM process covers Lead Management, Contact Management, Customer Interaction, Opportunity Management, Sales Activity Management, and Quotation Management.

## CRM Process

```text
Lead Management
       ↓
Contact Management
       ↓
Opportunity Management
       ↓
Sales Activities & Follow-ups
       ↓
Customer Interaction
       ↓
Quotation Management
       ↓
Sales Order / Closure
```

---

## Modules

### 1. Lead Management

The Lead Management module manages potential customers before they move to the next stage of the sales process.

### Functional Scope

* Lead Registration
* Lead Assignment
* Lead Priority
* Lead Status
* Lead Qualification
* Follow-up Management
* Lead Activities
* Contact Creation

### Technical Development

* Lead Table
* Lead Card Page
* Lead List Page
* Activity List Part
* No. Series
* Lead Assignment
* Lead Qualification
* Follow-up Actions
* Create Contact functionality

---

### 2. Contact Management

The Contact Management module maintains customer and contact information in a centralized location.

### Functional Scope

* Multiple contacts for a customer
* Contact categorization
* Communication preferences
* Contact information
* Contact relationships
* CRM activity integration

### Technical Development

The standard Business Central Contact functionality was extended to support CRM-specific requirements.

Developed/extended functionality includes:

* Contact Card Extension
* Contact Category
* Communication Preference
* Integration with CRM activities and interactions

---

### 3. Customer Interaction

The Customer Interaction module maintains customer communication and interaction history.

### Functional Scope

* Customer communication history
* Interaction types
* Calls
* Meetings
* Emails
* Follow-ups
* Interaction status

### Technical Development

* Customer Interaction Table
* Customer Interaction Card Page
* Customer Interaction List Page
* Customer Card Page Extension
* Activity Timeline Codeunit
* Interaction Type Enum
* Activity Type Enum
* CRM Interaction Status Enum
* New Interaction Action
* Mark Completed Action
* Activity Timeline Action

---

### 4. Opportunity Management

The Opportunity Management module manages and tracks potential sales after lead qualification.

### Functional Scope

* Opportunity Stages
* Probability
* Follow-up Management
* Expected sales progress
* Competitor Tracking
* Lost Opportunity Tracking
* Opportunity Activities
* Won/Lost Tracking

### Technical Development

The Opportunity page was extended with CRM-specific opportunity information.

Developed functionality includes:

* Probability %
* Next Follow-up Date
* Next Follow-up Activity
* CRM Opportunity Stage
* Loss Reason
* Lost To Competitor
* Loss Remarks
* Show Sales Quote
* Create Interaction
* Postponed Interactions

### Competitor Tracking

A competitor tracking section was developed with:

* Competitor Name
* Strength
* Weakness
* Is Main Competitor
* Remarks

---

### 5. Sales Activity Management

Sales Activity Management supports the planning and tracking of sales activities and follow-ups.

### Functional Scope

* Task Assignment
* Daily Activities
* Follow-up Reminders
* Appointment Scheduling
* Sales Calendar
* Activity Status Tracking
* Reminder Notifications

### Technical Development

The following functionality was specifically developed:

#### Sales Calendar

Provides a centralized view of scheduled sales activities based on activity dates.

#### Reminder Notifications

Provides reminders for scheduled activities and follow-ups to help users avoid missing planned actions.

---

### 6. Quotation Management

Quotation Management supports the sales quotation process from creation through customer acceptance and conversion to a Sales Order.

### Functional Scope

* Sales Quotation Creation
* Quote Revision
* Quote Expiry Tracking
* Customer Acceptance Tracking
* Quote Conversion to Sales Order

### Functional Workflow

```text
Customer / Opportunity
        ↓
Create Sales Quotation
        ↓
Review Quotation
        ↓
Revise Quote if Required
        ↓
Customer Acceptance
        ↓
Convert to Sales Order
        ↓
Sales Order Processing
```

---

### 7. Customer Communication

Customer Communication supports communication between sales users and customers.

### Functional Scope

* Outlook Integration
* Email Templates
* Customer Communication Log
* Email Attachments
* Meeting Invitations

---

## Technical Environment

| Component            | Technology                              |
| -------------------- | --------------------------------------- |
| ERP Platform         | Microsoft Dynamics 365 Business Central |
| Development Language | AL                                      |
| Development Tool     | Visual Studio Code                      |
| Business Logic       | AL Code                                 |
| User Interface       | Business Central Pages                  |
| Data Storage         | Business Central Tables                 |
| Customization        | Page Extensions / Custom Objects        |
| Reporting            | Power BI                                |

---

## Business Central Development Areas

The project involved working with the following Business Central development concepts:

* Tables
* Pages
* Page Extensions
* List Pages
* Card Pages
* List Parts
* Codeunits
* Enums
* Actions
* Fields
* No. Series
* Business Logic
* Validations
* CRM Process Integration

---

## Project Architecture

```text
                    CRM Solution
                         │
        ┌────────────────┼────────────────┐
        │                │                │
       Lead           Contact        Opportunity
        │                │                │
        └────────────────┼────────────────┘
                         │
                  Sales Activities
                         │
                  Customer Interaction
                         │
                    Quotation
                         │
                   Sales Order
```

---

## Key Functional Learning

Through this project, the following CRM processes were understood:

* Lead qualification and conversion
* Customer and contact management
* Customer interaction tracking
* Opportunity stage management
* Sales pipeline management
* Follow-up management
* Competitor tracking
* Quotation management
* Customer communication
* Sales activity management

---

## Key Technical Learning

The project provided practical experience in:

* Business Central AL development
* Creating and extending tables
* Creating Card and List pages
* Extending standard Business Central pages
* Creating custom fields
* Creating and using Enums
* Developing Codeunits
* Adding page actions
* Implementing business logic and validations
* Working with CRM-related data
* Integrating custom functionality with standard Business Central functionality
* Developing Sales Calendar functionality
* Implementing reminder notifications

---

## Project Workflow

```text
Lead Created
     ↓
Lead Qualified
     ↓
Contact Management
     ↓
Opportunity Created
     ↓
Opportunity Stage Tracking
     ↓
Activities & Follow-ups
     ↓
Customer Interactions
     ↓
Sales Quotation
     ↓
Customer Acceptance
     ↓
Sales Order
```

---

## Project Status

The CRM project includes functional analysis and Business Central development across the CRM modules described above.

The technical development focused on extending Business Central functionality where additional CRM requirements were identified, while standard Business Central functionality was retained where appropriate.

---

## Screenshots

<img width="1366" height="727" alt="image" src="https://github.com/user-attachments/assets/5b92f51c-dc05-4dbf-9519-00651f3211e4" />

<img width="1364" height="653" alt="image" src="https://github.com/user-attachments/assets/e08520d1-e796-4481-9ae6-9823f4231bb7" />

<img width="1342" height="679" alt="image" src="https://github.com/user-attachments/assets/6f5dd999-31d0-47bb-b596-c1ef2a68254b" />

<img width="1359" height="687" alt="image" src="https://github.com/user-attachments/assets/29bec61d-71bc-441e-9c8f-83a50d97cd5d" />

<img width="1364" height="694" alt="image" src="https://github.com/user-attachments/assets/e3e29054-4d95-4156-a4ee-a562cd85a4a9" />

<img width="1365" height="687" alt="image" src="https://github.com/user-attachments/assets/6f0d8fe5-832d-4243-a547-73328ad92d51" />

<img width="1362" height="667" alt="image" src="https://github.com/user-attachments/assets/31c7c6c2-1594-48e4-a1b8-25133e48ca89" />

<img width="1335" height="666" alt="image" src="https://github.com/user-attachments/assets/cf86b82c-c9e6-48b3-8e93-b6493452695c" />

<img width="1364" height="661" alt="image" src="https://github.com/user-attachments/assets/49fae6f8-bddd-4699-bbc0-addce37e849d" />

<img width="1323" height="674" alt="image" src="https://github.com/user-attachments/assets/458fe680-666c-4172-a821-61fd7d47e80f" />


## Author

**Harshda Mhase**
Business Central Technical Intern

## Platform

**Microsoft Dynamics 365 Business Central**
