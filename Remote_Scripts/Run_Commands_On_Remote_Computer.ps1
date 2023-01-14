$session = New-PSSession -ComputerName "Computer1"
Invoke-Command -Session $session -ScriptBlock {Script or Command}
