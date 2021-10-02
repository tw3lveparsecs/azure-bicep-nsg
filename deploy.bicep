module nsg 'main.bicep' = {
  name: 'nsg'
  params: {
    location: resourceGroup().location
    nsgName: 'testnsg1'
    securityRules: [
      {
        name: 'rule1'
        access: 'Allow'
        description: 'rule testing'
        destinationAddressPrefixes: [
          '10.1.0.0'
          '10.2.0.0'
        ]
        destinationPortRanges: [
          '80'
          '443'
        ]
        direction: 'Inbound'
        priority: 150
        protocol: 'tcp'
        sourceAddressPrefixes: [
          '10.30.0.24'
          '10.40.0.24'
        ]
        sourcePortRanges: [
          '22'
          '3389'
        ]
      }
    ]
  }
}
