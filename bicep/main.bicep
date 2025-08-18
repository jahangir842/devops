resource stgacct 'Microsoft.Storage/storageAccounts@2025-01-01' = {
  name: 'jagzstorageacctbicep'
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}
