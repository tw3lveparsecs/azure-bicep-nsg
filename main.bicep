// TODO
// - flow logs

@description('Network security group name')
param nsgName string

@description('Network security group location')
param location string = resourceGroup().location

@description('Security rules')
@metadata({
  name: 'Rule name'
  access: 'Whether network traffic is allowed or denied'
  description: 'A description for the rule'
  destinationAddressPrefix: 'The destination address prefix. CIDR or destination IP range. Service Tags or * can also be used'
  destinationAddressPrefixes: [
    'The destination address prefixes. CIDR or destination IP ranges'
  ]
  destinationApplicationSecurityGroups: [
    {
      id: 'Resource Id of destination application security group'
    }
  ]
  destinationPortRange: 'The destination port or range'
  destinationPortRanges: [
    'The destination port ranges'
  ]
  direction: 'The direction of the rule. Inbound or Outbound'
  priority: 'The priority of the rule. The value can be between 100 and 4096'
  protocol: 'Network protocol for this rule'
  sourceAddressPrefix: 'The source address prefix. CIDR or destination IP range. Service Tags or * can also be used'
  sourceAddressPrefixes: [
    'The source address prefixes. CIDR or destination IP ranges'
  ]
  sourceApplicationSecurityGroups: [
    {
      id: 'Resource Id of source application security group'
    }
  ]
  sourcePortRange: 'The source port or range'
  sourcePortRanges: [
    'The source port ranges.'
  ]
})
param securityRules array = []

resource nsg 'Microsoft.Network/networkSecurityGroups@2021-02-01' = {
  name: nsgName
  location: location
  properties: {
    securityRules: [for rule in securityRules: {
      name: rule.name
      properties: {
        access: rule.access
        description: rule.description
        destinationAddressPrefix: empty(rule.destinationAddressPrefix) ? json('null') : rule.destinationAddressPrefix
        destinationAddressPrefixes: empty(rule.destinationAddressPrefixes) ? null : rule.destinationAddressPrefixes
        destinationApplicationSecurityGroups: empty(rule.destinationApplicationSecurityGroups) ? null : rule.destinationApplicationSecurityGroups
        destinationPortRange: empty(rule.destinationPortRange) ? null : rule.destinationPortRange
        destinationPortRanges: empty(rule.destinationPortRanges) ? null : rule.destinationPortRanges
        direction: empty(rule.direction) ? null : rule.direction
        priority: empty(rule.priority) ? null : rule.priority
        protocol: empty(rule.protocol) ? null : rule.protocol
        sourceAddressPrefix: empty(rule.sourceAddressPrefix) ? null : rule.sourceAddressPrefix
        sourceAddressPrefixes: empty(rule.sourceAddressPrefixes) ? null : rule.sourceAddressPrefixes
        sourceApplicationSecurityGroups: empty(rule.sourceApplicationSecurityGroups) ? null : rule.sourceApplicationSecurityGroups
        sourcePortRange: empty(rule.sourcePortRange) ? null : rule.sourcePortRange
        sourcePortRanges: empty(rule.sourcePortRanges) ? null : rule.sourcePortRanges
      }
    }]
  }
}
