# winver.exe
Stop-Service -Force -Name "SysMain"; Set-Service -Name "SysMain" -StartupType Disabled
Stop-Service -Force -Name "WSearch"; Set-Service -Name "WSearch" -StartupType Disabled
Add-Computer -DomainName mtinter.com.mx -Restart
$cpu_mti = Read-Host -Prompt 'Nuevo nombre para CPU'
# $user = Read-Host -Prompt 'Usuario autorizado para unir a dominio:'
$cpu_nombre = (Get-CimInstance -ClassName Win32_ComputerSystem).Name
Write-Output "Renombrando $cpu_nombre por $cpu_mti"
Rename-Computer -ComputerName "$cpu_nombre" -NewName "$cpu_mti" 


    # .....
    # Rename-Computer -NewName some_name -Force -Passthru
    # Restart-Computer -Wait
    # # Do some stuff
    # .....

# # Create the scheduled job properties
# $options = New-ScheduledJobOption -RunElevated -ContinueIfGoingOnBattery -StartIfOnBattery
# $secpasswd = ConvertTo-SecureString "Admin0205###" -AsPlainText -Force
# $credential = New-Object System.Management.Automation.PSCredential ("MTINTER\jfernandez", $secpasswd)
# $AtStartup = New-JobTrigger -AtStartup

# # Register the scheduled job
# Register-ScheduledJob -Name Resume_Workflow_Job -Trigger $AtStartup -ScriptBlock ({[System.Management.Automation.Remoting.PSSessionConfigurationData]::IsServerManager = $true; Import-Module PSWorkflow; Resume-Job -Name new_resume_workflow_job -Wait}) -ScheduledJobOption $options
# # Execute the workflow as a new job
# Resume_Workflow -AsJob -JobName new_resume_workflow_job


