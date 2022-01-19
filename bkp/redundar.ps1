<#
.Synopsis
    Sincroniza respaldos locales con FS1

	  
.Description
	IT WORKS!
#>
$src = "E:/"
$dst =  "\\172.16.3.250\backup\dc1_backup\E\"

robocopy "$src" "$dst" /MIR /TBD /Z /ZB /R:5 /XA:H /W:5 /V /XD 'System Volume Information' '$RECYCLE.BIN' 'Output\DfsrPrivate'