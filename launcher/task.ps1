$taskName = "Script de carga"
Unregister-ScheduledTask -TaskName $taskname -Confirm:$false
# Describe the scheduled task.
$description = "Agrega tarea de ejecución de scrip de carga"

# Create a new task action
$taskAction = New-ScheduledTaskAction `
    -Execute 'pwsh' `
    -Argument '-File C:\Users\jorge\AppData\Local\Temp\script\Saludar.ps1'

# Create a new trigger (Daily at 3 AM)
$taskTrigger = New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Minutes 1)

# Register the scheduled task
Register-ScheduledTask `
    -TaskName $taskName `
    -Action $taskAction `
    -Trigger $taskTrigger `
    -Description $description

# Set the task principal's user ID and run level.
# $taskPrincipal = New-ScheduledTaskPrincipal -UserId $UserId -RunLevel Highest 
# # Set the task compatibility value to Windows 10.
# $taskSettings = New-ScheduledTaskSettingsSet -Compatibility Win8
# # Update the task principal settings
# Set-ScheduledTask -TaskName $taskName -Principal $taskPrincipal -Settings $taskSettings