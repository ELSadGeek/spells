# winver.exe
Stop-Service -Force -Name "SysMain"; Set-Service -Name "SysMain" -StartupType Disabled
Stop-Service -Force -Name "WSearch"; Set-Service -Name "WSearch" -StartupType Disabled


function Edit-Registry {
    ModifyRegistryValue `
      -Name "Cortana" `
      -RegPath "HKLM:\SOFTWARE\Policies\Microsoft\Windows" `
      -RegName "Windows Search" `
      -PropName "AllowCortana" 0
  
    ModifyRegistryValue `
      -Name "Busqueda en barra de tareas" `
      -RegPath "HKCU:\Software\Microsoft\Windows\CurrentVersion" `
      -RegName "Search" `
      -PropName "SearchboxTaskbarMode" 0
  
    ModifyRegistryValue `
      -Name "Vista de actividades" `
      -RegPath "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer" `
      -RegName "Advanced" `
      -PropName "ShowTaskViewButton" 0
  
    ModifyRegistryValue `
      -Name "Personas" `
      -RegPath "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" `
      -RegName "People" `
      -PropName "PeopleBand" 0
  
    ModifyRegistryValue `
      -Name "Multi Taskbar" `
      -RegPath "HKCU:\Software\Policies\Microsoft\Windows" `
      -RegName "Explorer" `
      -PropName "TaskbarNoMultimon" 1
  
    ModifyRegistryValue `
      -Name "Sugerencias Menú inicio" `
      -RegPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion" `
      -RegName "ContentDeliveryManager" `
      -PropName "SystemPaneSuggestionsEnabled" 0
  
    #Restart Explorer to change it immediately
    Stop-Process -name explorer
  }
  function ModifyRegistryValue {
    Param (
      [Parameter(Mandatory = $true)]
      [string] $Name,
      [Parameter(Mandatory = $true)]
      [string] $RegPath,
      [Parameter(Mandatory = $true)]
      [string] $RegName,
      [Parameter(Mandatory = $true)]
      [string] $PropName,
      [Parameter(Mandatory = $true)]
      [int] $Value
    )
  
    Write-Output "Desactivando $Name..."
    $path = "$RegPath\$RegName"
    IF (!(Test-Path -Path $path)) {
      New-Item -Path $RegPath -Name $RegName
    }
    Set-ItemProperty -Path $path -Name $PropName -Value $Value
  }

  function Remove-Clutter {
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "Medium")]
    param()
  
    Write-Output "Eliminando packetes de Windows..."
  
    $appxPackagesToDelete = @(
      "windowsalarms",
      "getstarted",
      "zunemusic",
      "windowsapps",
      "SolitaireCollection",
      "bingnews",
      "onenote",
      "windowsphone",
      "weather",
      "DellInc.DellSupportAssistforPCs",
      "DellInc.DellDigitalDelivery",
      "DellInc.DellCommandUpdate",
      "WindowsFeedbackHub",
      "Microsoft.Office.Desktop",
      "ScreenSketch",
      "YourPhone",
      "GetHelp",
      "MobilePlans",
      "MixedReality",
      "LinkedIn",
      "Microsoft3DViewer",
      "WindowsMaps",
      "Microsoft.Messaging",
      "Spotify",
      "Microsoft.Xbox.TCUI",
      "Microsoft.Wallet",
      "Microsoft.XboxSpeechToTextOverlay",
      "Microsoft.XboxApp",
      "Microsoft.XboxIdentityProvider"
    )
  
    $appxPackagesToDelete | ForEach-Object -Process { DeleteAppxPackage($_) }
  
    UninstallOneDrive
  }
  
  function DeleteAppxPackage($packageName) {
    Write-Output "Removing $packageName appx package."
    Get-AppxPackage *$packageName* | Remove-AppxPackage
  }
  
  function UninstallOneDrive {
    Write-Output "Uninstalling OneDrive..."
    taskkill /f /im OneDrive.exe | Out-Null
    C:\WINDOWS\SysWOW64\OneDriveSetup.exe /uninstall
  }

  Edit-Registry