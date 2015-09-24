$b = get-content C:\Users\TE107232INADM\Documents\Reboot1.txt
$Rebooted = @()
Foreach ($Server in $b)
{
$Rebooted += gwmi win32_ntlogevent -computername $Server -filter "LogFile='System' and EventCode='1074' and Message like '%restart%'" | 
select User,@{n="Time";e={$_.ConvertToDateTime($_.TimeGenerated)}},computername | Select-Object -First 1 | FT -wrap
}

$rebooted >>Reboot.txt
