#$rgName: pick which resource group you want your virtual network to be in
#$Vnetname: pick a name for the Vnet
#$location: pick which location you want your location to be in 
#$subnet1name: assign a name to the subnet 


$rgName = "myResourceGroup"
$vnetName = "myVnet"
$location = "EastUS"
$subnet1Name = "subnet1"
$subnet2Name = "subnet2"
New-AzVirtualNetwork -ResourceGroupName $rgName -Name $vnetName -Location $location -AddressPrefix "10.0.0.0/16" -Subnet $subnet1Name,10.0.0.0/24 -Subnet $subnet2Name,10.0.1.0/24
