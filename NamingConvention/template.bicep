// The name of the team that will be responsible for the resource.
@maxLength(8)
@allowed([
  'flt'
  ])
param resourceTeam string

// The environment that the resource is for. Accepted values are defined to ensure consistency.


@allowed([
  'eem1'
  'test1'
  ])
param environment string


param subscriptionID string

@allowed([
  'eun'
  'euw'
  ])

param resourceLocation string

@allowed([
  'liftrigg'
  ])
// The function/goal of the resource, for instance the name of an application it supports
param functionName string


@allowed([
  'asfa'
  ])
  
param resourceType string





// An index number. This enables you to have some sort of versioning or to create redundancy
param index int

// First, we create shorter versions of the function and the teamname. 
// This is used for resources with a limited length to the name.
// There is a risk to doing at this way, as results might be non-desirable.
// An alternative might be to have these values be a parameter


var subscriptionShort = length(subscriptionID) > 5 ? substring(subscriptionID,0,5) : subscriptionID //subscription 5 first chars


var resourceGroupNamePlaceHolder = '${environment}${resourceLocation}${subscriptionShort}-${resourceTeam}' //resource group name

// This line constructs the resource name. It uses [PH] for the resource type abbreviation.
// This part can be replaced in the final template
var resourceNamePlaceHolder = '${resourceGroupNamePlaceHolder}-${resourceTeam}-${functionName}-${resourceType}' //resource anem based on group name
// This line creates a short version for resources with a max name length of 24



// Outputs are created to give the results back to the main template
output resourceGroupName string = resourceGroupNamePlaceHolder
output resourceName string = resourceNamePlaceHolder
