'''
This script uses the Invoke-Command cmdlet to run a pipeline of commands on remote
computers "Computer1" and "Computer2". The pipeline retrieves a list of processes running 
on the remote computer, filters the list to include only processes whose name contains 
"chrome", and then selects the Name and Id properties of the filtered processes. The 
-Credential parameter is used to specify the user credentials to run the script.

'''


$computers = "Computer1","Computer2"
$cred = Get-Credential

foreach ($computer in $computers) {
    Invoke-Command -ComputerName $computer -Credential $cred -ScriptBlock {
        Get-Process | Where-Object {$_.Name -like "*chrome*"} | Select-Object -Property Name,Id
    }
}
