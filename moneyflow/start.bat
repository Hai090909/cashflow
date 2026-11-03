@echo off
setlocal
title MoneyFlow server
cd /d "%~dp0"

where node >nul 2>nul
if errorlevel 1 (
  echo Node.js was not found.
  echo Install the LTS version from https://nodejs.org and then run this file again.
  echo.
  pause
  exit /b 1
)

node -e "const [a,b]=process.versions.node.split('.').map(Number);process.exit(a>22||(a===22&&b>=5)?0:1)"
if errorlevel 1 (
  echo MoneyFlow needs Node.js 22.5 or newer. You have:
  node -v
  echo Install the current LTS version from https://nodejs.org and run this file again.
  echo.
  pause
  exit /b 1
)

if not defined PORT set PORT=3000

echo Starting MoneyFlow... (close this window to stop it)
echo When you see "MoneyFlow is running", open http://localhost:%PORT%/login in your browser.
echo.

node server.js

echo.
echo The server stopped. Scroll up to see why, or press any key to close.
pause
