#To create a new storage account on Azure

#Under $rgname, pick the resource group you want your VM to be in 
#Under $saname, pick your storage account's name 
#$location to pick a location 

$rgName = "myResourceGroup"
$saName = "myStorageAccount"
$location = "EastUS"
New-AzStorageAccount -ResourceGroupName $rgName -Name $saName -Location $location -SkuName "Standard_LRS" -Kind "StorageV2"
