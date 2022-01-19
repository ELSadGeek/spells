$contador = Get-Content cuenta.txt
$contador = $contador.ToInt64($null) + 1
Write-Output $contador > .\cuenta.txt
Write-Host $contador   