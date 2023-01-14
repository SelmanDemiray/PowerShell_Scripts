#The "get-member" command is used to fetch which properties could be used with the "get-date" command 
Get-Date | get-member 

#To get the date
Get-Date | Select-Object –Property DayOfYear
