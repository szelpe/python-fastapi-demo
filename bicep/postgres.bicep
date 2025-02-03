@description('The name of the Azure Database for PostgreSQL flexible server.')
param serverName string

@description('The location where the server will be deployed.')
param location string = resourceGroup().location

@description('The SKU name of the PostgreSQL server. Example: GP_Gen5_2')
param skuName string = 'GP_Gen5_2'

@description('The storage size in GB.')
param storageSizeGB int = 32

@description('The tier of the server. Example: GeneralPurpose, MemoryOptimized.')
param tier string = 'GeneralPurpose'

@description('The version of PostgreSQL.')
param version string = '13'

@description('The administrator username for the PostgreSQL server.')
param administratorLogin string

@description('The administrator password for the PostgreSQL server.')
@secure()
param administratorPassword string

@description('The public access flag (Enabled or Disabled).')
param publicNetworkAccess string = 'Disabled'

@description('The backup retention days.')
param backupRetentionDays int = 7

resource postgresServer 'Microsoft.DBforPostgreSQL/flexibleServers@2024-08-01' = {
  name: serverName
  location: location
  sku: {
    name: skuName
    tier: tier
  }
  properties: {
    version: version
    administratorLogin: administratorLogin
    administratorLoginPassword: administratorPassword
    storage: {
      storageSizeGB: storageSizeGB
    }
    backup: {
      backupRetentionDays: backupRetentionDays
    }
    network: {
      publicNetworkAccess: publicNetworkAccess
    }
  }
}

output serverFQDN string = postgresServer.properties.fullyQualifiedDomainName
