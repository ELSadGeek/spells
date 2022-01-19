@echo off
Powershell -ExecutionPolicy Unrestricted -Command "& {Start-Process Powershell -ArgumentList ' -ExecutionPolicy Unrestricted -File "C:\temp\Init\init.ps1"' -Verb RunAs}"
