module names 'NamingConvention/template.bicep' = {
  name: 'namingconvention'
  params: {
    environment: 'eem1'
    resourceTeam: 'flt'
    index: 1
    subscriptionID: '5faf4d3a-fd29-4437-92f1-132d6553050e'
    resourceLocation: 'euw'
    functionName: 'liftrigg'
    resourceType: 'asfa'
  }
}


var aspName = '${names.outputs.resourceGroupName}-asp1'

module asp 'AppServicePlan/template.bicep' = {
  name: 'aspDeployment'
  params: {
    planName: aspName
  }
}

var functionName = names.outputs.resourceGroupName

module functionapp 'FunctionApp/template.bicep' = {
  name: 'funtionappDeployment'
  params: {
        functionAppName: functionName
        location: 'westeurope'
        planName: asp.outputs.planName
  }
}
