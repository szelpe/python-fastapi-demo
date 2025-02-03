az deployment group create `
  --name DeployPostgresFlexibleServer `
  --resource-group PythonDemo `
  --template-file postgres.bicep `
  --parameters serverName=test123 `
               location=westeurope `
               skuName=Standard_B1ms `
               storageSizeGB=32 `
               tier=Burstable `
               version=16 `
               administratorLogin=postgres `
               administratorPassword=P@ssw0rd `
               publicNetworkAccess=Disabled `
               backupRetentionDays=7


az postgres flexible-server firewall-rule create `
    --resource-group PythonDemo `
    --name test123 `
    --rule-name AllowAllIPs `
    --start-ip-address 0.0.0.0 `
    --end-ip-address 255.255.255.255