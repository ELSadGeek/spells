<#
.Synopsis
    Programa para configurar Windows 10
	  
.Description
	IT WORKS!
#>

Get-AppxPackage -AllUsers *xbox* | Remove-AppxPackage
Get-AppxPackage -AllUsers *camera* | Remove-AppxPackage
Get-AppxPackage -AllUsers *feedback* | Remove-AppxPackage
Get-AppxPackage -AllUsers *BingWeather* | Remove-AppxPackage
Get-AppxPackage -AllUsers *SoundRecorder* | Remove-AppxPackage
Get-AppxPackage -AllUsers *MicrosoftSolitaireCollection* | Remove-AppxPackage
Get-AppxPackage -AllUsers *GetHelp* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Zune* | Remove-AppxPackage
Get-AppxPackage -AllUsers *YourPhone* | Remove-AppxPackage
Get-AppxPackage -AllUsers *OneDriveSync* | Remove-AppxPackage
Get-AppxPackage -AllUsers *OneDriveSync* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Paint* | Remove-AppxPackage
Get-AppxPackage -AllUsers *People* | Remove-AppxPackage
Get-AppxPackage -AllUsers *maps* | Remove-AppxPackage
Get-AppxPackage -AllUsers *3DViewer* | Remove-AppxPackage
Get-AppxPackage -AllUsers *WindowsAlarms* | Remove-AppxPackage
Get-AppxPackage -AllUsers *OfficeHub* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Dolby* | Remove-AppxPackage
Get-AppxPackage -AllUsers *ZuneVideo* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Skypeapp* | Remove-AppxPackage
Get-AppxPackage -AllUsers *GetStarted* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Dolby* | Remove-AppxPackage
Get-AppxPackage -AllUsers *FeedbackHub* | Remove-AppxPackage

#prueba 1 