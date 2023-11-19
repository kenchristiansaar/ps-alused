$ctl = 0

do
{
    $ch = $null
    $ch = Get-Process | ?{$_.name -like "note*"}
        if($ch -ne $null)
            {$ct2 = 2
                Write-Host "Notepad is running"
                Start-Sleep -Seconds 1
                $ctl++
             }
        else
            {$ct2 = 1}
}

while($ct2 -ne 1)

$ctl