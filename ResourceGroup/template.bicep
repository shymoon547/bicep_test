targetScope= 'subscription'

param rgName string
param rgLocation string


resource azresourcegroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rgName
  location: rgLocation
}

output azresourcegroupname string = azresourcegroup.name
