#To create a new virtual machine on Azure

#Under $rgname, pick the resource group you want your VM to be in 
#Under $vmname, pick your VM's name 
#$location to pick a location 
#Under $image, pick your specific operating system 

$rgName = "myResourceGroup"
$vmName = "myVM"
$location = "EastUS"
$image = Get-AzVMImage -PublisherName "MicrosoftWindowsServer" -Offer "WindowsServer" -Skus "2016-Datacenter" -Latest
New-AzVM -ResourceGroupName $rgName -Name $vmName -Location $location -Image $image -Size "Standard_DS1_v2"
