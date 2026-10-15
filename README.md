# Automated Flexible Timetable Scheduler

A full-stack web application that automates academic timetable generation using constraint-based scheduling, Excel data ingestion, and an interactive timetable visualisation interface.

## Overview

Manual academic timetable preparation is time-consuming and prone to errors, including faculty scheduling conflicts, classroom overbooking, and overlapping academic sessions. The **Automated Flexible Timetable Scheduler** addresses these challenges by providing a centralised application that processes academic data, automatically assigns sessions to suitable time slots and rooms, and presents the generated timetable through a user-friendly graphical interface.

The application combines a React.js frontend with a Python backend and SQLite database to streamline timetable generation and management.

## Problem Statement

Traditional timetable preparation requires considerable manual effort to coordinate subjects, faculty members, classes, classrooms, laboratories, and available time slots. Changes to one session can affect multiple other assignments, making conflict detection and timetable maintenance difficult.

The project aims to automate this process through a constraint-based scheduling engine that reduces repetitive manual work and helps prevent scheduling conflicts.

## Key Features

- **Dynamic Excel Ingestion:** Upload academic data using standardised `.xlsx` templates. The backend parses, validates, and processes the uploaded spreadsheet.
- **Constraint-Based Scheduling:** Uses a Python scheduling engine (`solver.py`) to assign sessions to feasible time slots while considering the defined scheduling constraints.
- **Interactive Timetable Visualisation:** Displays generated schedules in a weekly grid through a React.js interface.
- **Server-Loaded Default Data:** Loads predefined academic datasets using the *Load from Server* functionality.
- **Room and Resource Allocation:** Supports classroom and laboratory assignments based on the scheduling requirements.
- **Conflict Monitoring:** Displays scheduling status and active conflict warnings.
- **Unassigned Session Management:** Provides visibility into sessions that could not be scheduled automatically.
- **SQLite Data Persistence:** Stores timetable-related data using SQLite.
- **One-Click Local Execution:** Includes Windows batch scripts to simplify launching the frontend and backend locally.

## Application Preview
<img width="1897" height="1038" alt="image" src="https://github.com/user-attachments/assets/dac776fe-207f-4f2b-80b5-c14baf563f4f" />


## Technology Stack

| Component | Technologies |
|---|---|
| Frontend | React.js, Vite, JavaScript |
| Backend | Python, FastAPI/Flask |
| Scheduling Engine | Constraint-based scheduling algorithm |
| Data Processing | Pandas, OpenPyXL |
| Database | SQLite |
| Input Format | Microsoft Excel (`.xlsx`) |
| Development Tools | Antigravity IDE, Git, GitHub |
| Local Execution | Windows batch scripts |


## System Architecture

The application follows a modular frontend-backend architecture that separates user interaction, data processing, scheduling logic, and data storage.

```text
                 USER
                   |
                   v
        React.js / Vite Frontend
                   |
             REST API Requests
                   |
                   v
          Python Backend API
                   |
          +--------+---------+
          |                  |
          v                  v
   Excel Ingestion       Database Layer
   & Validation          SQLite
          |                  |
          +--------+---------+
                   |
                   v
          Scheduling Engine
              solver.py
                   |
                   v
        Generated Timetable
                   |
                   v
        Interactive Grid UI
```

*The diagram represents the high-level architecture.*

## Application Workflow

### 1. Load Default Data

The user selects **Load from Server** to retrieve the predefined academic dataset through the backend API.

### 2. Upload Custom Academic Data

The user downloads the Excel template, enters the required academic information, and uploads the completed `.xlsx` file through the interface.

### 3. Process and Validate Input

The backend processes the uploaded spreadsheet, checks the input structure, and prepares the data for scheduling.

### 4. Generate the Timetable

The scheduling engine evaluates the academic sessions and applicable constraints to assign suitable time slots and rooms.

### 5. Visualise and Review Results

The generated timetable is displayed in an interactive weekly grid. The interface provides scheduling status, room assignments, conflict information, and visibility into any unassigned sessions.


### Key Components

| File / Directory | Responsibility |
|---|---:|
| `backend/main.py` | Backend API endpoints and application workflow |
| `backend/solver.py` | Timetable scheduling and constraint evaluation |
| `backend/ingestion.py` | Excel parsing and input validation |
| `backend/database.py` | Database setup and data-access operations |
| `backend/auth.py` | Authentication and access control, if enabled |
| `frontend/src/` | Frontend components and user interface |
| `RULES.md` | Documentation of scheduling constraints |
| `timetable_input.xlsx` | Excel input template |
| `Launch__Timetable.bat` | Local application launcher, if configured |

## Getting Started

### Prerequisites

Install the following software before running the application:

- Python version compatible with the backend dependencies
- Node.js and npm
- Git
- Windows, if using the supplied `.bat` launcher

### 1. Clone the Repository

```bash
git clone <YOUR_REPOSITORY_URL>
cd <YOUR_REPOSITORY_FOLDER>
```

### 2. Set Up the Backend

Open a terminal in the backend directory:

```bash
cd backend
python -m venv .venv
```

Activate the virtual environment on Windows:

```powershell
.venv\Scripts\activate
```

Install the backend dependencies:

```bash
pip install -r requirements.txt
```

Configure the required environment variables according to the backend configuration and initialise the database if initialisation isn't automatic.

### 3. Set Up the Frontend

Open a separate terminal:

```bash
cd frontend
npm install
```
Create the appropriate frontend environment configuration if required by the application. Set the API base URL to the local backend address.

### 4. Launch the Application

Use the provided `run_app.bat` script.

## Results and Performance

The application has been tested locally using an academic timetable dataset.

A demonstrated run produced the following results:

| Metric | Observed Result |
|---|---:|
| Scheduled sessions | 196 |
| Unassigned sessions | 0 |
| Active conflict warnings | 0 |
| Solver runtime | 6.259 seconds |

These results correspond to the tested dataset and displayed application state. Performance may vary with dataset size, scheduling constraints, available computational resources, and execution environment.

## Scheduling Constraints

The scheduling engine is designed to consider the rules defined in [`RULES.md`](RULES.md).

Depending on the implemented rules, these may include:

- Preventing simultaneous assignments for the same faculty member.
- Preventing multiple sessions from occupying the same room at the same time.
- Respecting session duration and time-slot requirements.
- Applying relevant daily scheduling limits.
- Supporting appropriate classroom and laboratory allocation.

Refer to `RULES.md` and `backend/solver.py` for the exact constraints enforced by the implementation.

## Current Limitations and Future Improvements

- **Cloud deployment:** The application runs locally; deploying the complete scheduling workflow requires a hosting environment with sufficient computational resources.
- **Performance optimisation:** Further testing and optimisation may improve scheduling time for larger datasets.
- **Scalability:** Background job execution and suitable server infrastructure could improve support for computationally intensive scheduling requests.
- **Enhanced scheduling:** Additional constraints and optimisation objectives could be incorporated as requirements evolve.
- **Testing:** Broader validation across diverse datasets and infeasible scheduling scenarios would strengthen reliability.

## Contributions

This project was developed collaboratively as part of an academic software development project. The team worked on the design, implementation, integration, and testing of the Automated Flexible Timetable Scheduler.

Key areas of contribution included frontend development, backend scheduling logic, Excel-based data ingestion, database management, user interface design, testing, and project documentation.

This repository presents the collaborative project, with individual contributions acknowledged according to the work performed by each team member.
