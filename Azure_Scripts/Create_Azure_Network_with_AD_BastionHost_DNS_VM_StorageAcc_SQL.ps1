# Connect to Azure
Connect-AzAccount

# Create a new resource group
$rgName = "MyResourceGroup"
$location = "EastUS"
New-AzResourceGroup -Name $rgName -Location $location

# Create a new virtual network
$vnetName = "MyVnet"
$subnet1Name = "bastion"
$subnet2Name = "VMs"
$subnet3Name = "SQL"
$vnet = New-AzVirtualNetwork -ResourceGroupName $rgName -Name $vnetName -Location $location -AddressPrefix "10.0.0.0/16" -Subnet $subnet1Name,10.0.0.0/24 -Subnet $subnet2Name,10.0.1.0/24 -Subnet $subnet3Name,10.0.2.0/24

# Create Azure Bastion
$bastionName = "MyBastion"
New-AzBastion -Name $bastionName -ResourceGroupName $rgName -VirtualNetworkId $vnet.Id -SubnetId $vnet.Subnets[0].Id

#Create Azure Active Directory Domain Service
$aaddsName = "MyAADDS"
$aadds = New-AzAadDomainServices -Name $aaddsName -ResourceGroupName $rgName -VirtualNetworkId $vnet.Id -SubnetId $vnet.Subnets[1].Id

# Create a new virtual machine
$vmName = "MyVM"
$image = Get-AzVMImage -PublisherName "MicrosoftWindowsServer" -Offer "WindowsServer" -Skus "2016-Datacenter" -Latest
$vm = New-AzVM -ResourceGroupName $rgName -Name $vmName -Location $location -VirtualNetworkId $vnet.Id -SubnetId $vnet.Subnets[1].Id -Image $image -Size "Standard_DS1_v2" -AadTenantId $aadds.TenantId -AadAuthenticationType "Domain"

# Create a new SQL database
$sqlName = "MySQL"
$sql = New-AzSqlDatabase -ResourceGroupName $rgName -ServerName $sqlName -DatabaseName $sqlName -SubnetId $vnet.Subnets[2].Id

# Create a new storage account
$storageName = "MyStorage"
$storage = New-AzStorageAccount -ResourceGroupName $rgName -Name $storageName -Location $location -SkuName "Standard_LRS" -Kind "StorageV2"
