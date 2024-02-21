$percentWarning = 20
$percentCritical = 5
$ListDisk = Get-WmiObject -Class Win32_LogicalDisk
Foreach($Disk in $ListDisk){
if ($Disk.size -ne $NULL) {
$DiskFreeSpace = ($Disk.freespace/1GB).ToString('F2')
$DiskFreeSpacePercent = [Math]::Round(($Disk.freespace/$Disk.size) * 100, 2)
$Service_status="up"
$Message="Free disk space is good $DiskFreeSpacePercent % available"
if($DiskFreeSpacePercent -lt $percentWarning){
$Message= "Warning! $DiskFreeSpacePercent % available"
$Service_status="down"
if($DiskFreeSpacePercent -lt $percentCritical){
$Message= "Alert! $DiskFreeSpacePercent % available"
$Service_status="down"
}
} 
iwr -uri "https://my.uptime.kuma.server/api/push/PUSHURL?status=$Service_status&msg=$Message&ping=$DiskFreeSpace" -SkipCertificateCheck
}
}
