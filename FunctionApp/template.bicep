param location string
param functionAppName string
param planName string

resource functionAppResource 'Microsoft.Web/sites@2020-12-01' = {
  name: functionAppName
  identity:{
    type:'SystemAssigned'    
  }
  location: location
  kind: 'functionapp'
  properties: {
    serverFarmId: planName
  }
}

output FunctionAppName string = functionAppResource.name
output TenantId string = functionAppResource.identity.tenantId
output PrincipalId string = functionAppResource.identity.principalId
