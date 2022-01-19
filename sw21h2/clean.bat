@echo off
Powershell.exe -Command "& {Start-Process Powershell -ArgumentList '-ExecutionPolicy Unrestricted -File %~dp0sw21h2.ps1' -Verb RunAs}"
