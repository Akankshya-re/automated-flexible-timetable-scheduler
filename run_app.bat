@echo off
echo Starting Timetable Scheduler (Portable Version)...

:: Ensure we start from the batch file's directory
cd /d "%~dp0"

:: 1. Generate Mock Data if default workbook is missing
if not exist "%~dp0timetable_input.xlsx" (
    echo timetable_input.xlsx not found. Generating mock data...
    "%~dp0python\python.exe" "%~dp0backend\mock_generator.py"
)

:: 2. Start FastAPI Backend on Port 8000 using Portable Python
start "Backend API" cmd /k "cd /d "%~dp0backend" && "%~dp0python\python.exe" -m uvicorn main:app --host 127.0.0.1 --port 8000"

:: 3. Serve Frontend on Port 5173 using Python's Built-In HTTP Server
start "Frontend UI" cmd /k "cd /d "%~dp0" && "%~dp0python\python.exe" -m http.server 5173 --directory "%~dp0frontend\dist""

:: 4. Open Browser
timeout /t 3 >nul
start "" "http://localhost:5173"

echo App started successfully!
pause
