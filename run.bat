@echo off
REM Wall of Entropy - 5x4 Lava Lamp Wall Runner
REM This batch file starts a simple HTTP server and opens the lava lamp wall in your default browser

echo ========================================
echo  Wall of Entropy - 5x4 Lava Lamp Wall
echo ========================================
echo.
echo Starting local web server...
echo.

REM Check if Python is available
where python >nul 2>nul
if %errorlevel% == 0 (
    echo Using Python to start server on http://localhost:8000
    echo.
    echo Press Ctrl+C to stop the server when done.
    echo.
    timeout /t 2 >nul
    start http://localhost:8000/index.html
    python -m http.server 8000
) else (
    echo ERROR: Python is not installed or not in PATH.
    echo.
    echo Please install Python 3 from https://www.python.org/
    echo OR simply open index.html directly in your browser.
    echo.
    pause
    exit /b 1
)
