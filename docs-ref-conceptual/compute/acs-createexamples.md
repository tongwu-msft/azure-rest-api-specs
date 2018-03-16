# Container service configuration examples

## Orchestrator type DC/OS



```json
{
  "apiVersion": "2016-09-30",
  "location": "<location name>",
  "tags": {
    "department": "finance",
    "tag2": "v2"
  },
  "properties": {
    "orchestratorProfile": {
      "orchestratorType": "DCOS"
    },
    "masterProfile": {
      "count": 1,
      "dnsPrefix": "MasterPrefixTest"
    },
    "agentPoolProfiles": [
      {
        "name": "AgentPool1",
        "count": 3,
        "vmSize": "Standard_A1",
        "dnsPrefix": "AgentPrefixTest"
      }
    ],
    "linuxProfile": {
      "adminUsername": "acsLinuxAdmin",
      "ssh": {
        "publicKeys": [
          {
            "keyData": "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAlj9UC6+57XWVu0fd6zqXa256EU9EZdoLGE3TqdZqu9fvUvLQOX2G0d5DmFhDCyTmWLQUx3/ONQ9RotYmHGymBIPQcpx43nnxsuihAILcpGZ5NjCj4IOYnmhdULxN4ti7k00S+udqokrRYpmwt0N4NA4VT9cN+7uJDL8Opqa1FYu0CT/RqSW+3aoQ0nfGj11axoxM37FuOMZ/c7mBSxvuI9NsDmcDQOUmPXjlgNlxrLzf6VcjxnJh4AO83zbyLok37mW/C7CuNK4WowjPO1Ix2kqRHRxBrzxYZ9xqZPc8GpFTw/dxJEYdJ3xlitbOoBoDgrL5gSITv6ESlNqjPk6kHQ== azureuser@linuxvm"
          }
        ]
      }
    },
    "diagnosticsProfile": {
      "vmDiagnostics": {
        "enabled": true
      }
    }
  }
}
```

## Orchestrator type Swarm

```json


{
  "apiVersion": "2016-09-30",
  "location": "<location name>",
  "tags": {
    "department": "finance",
    "tag2": "v2"
  },
  "properties": {
    "orchestratorProfile": {
      "orchestratorType": "Swarm"
    },
    "masterProfile": {
      "count": 1,
      "dnsPrefix": "MasterPrefixTest"
    },
    "agentPoolProfiles": [
      {
        "name": "AgentPool1",
        "count": 3,
        "vmSize": "Standard_A1",
        "dnsPrefix": "AgentPrefixTest"
      }
    ],
    "linuxProfile": {
      "adminUsername": "acsLinuxAdmin",
      "ssh": {
        "publicKeys": [
          {
            "keyData": "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAlj9UC6+57XWVu0fd6zqXa256EU9EZdoLGE3TqdZqu9fvUvLQOX2G0d5DmFhDCyTmWLQUx3/ONQ9RotYmHGymBIPQcpx43nnxsuihAILcpGZ5NjCj4IOYnmhdULxN4ti7k00S+udqokrRYpmwt0N4NA4VT9cN+7uJDL8Opqa1FYu0CT/RqSW+3aoQ0nfGj11axoxM37FuOMZ/c7mBSxvuI9NsDmcDQOUmPXjlgNlxrLzf6VcjxnJh4AO83zbyLok37mW/C7CuNK4WowjPO1Ix2kqRHRxBrzxYZ9xqZPc8GpFTw/dxJEYdJ3xlitbOoBoDgrL5gSITv6ESlNqjPk6kHQ== azureuser@linuxvm"
          }
        ]
      }
    },
   "diagnosticsProfile": {
      "vmDiagnostics": {
        "enabled": true
      }
    }
  }
}
```

## VM sizes for agents

Azure Container Service supports the following virtual machine sizes for agents.

### Virtual machine sizes using standard storage accounts
"Standard_A0", "Standard_A1", "Standard_A2", "Standard_A3", "Standard_A4", "Standard_A5", "Standard_A6", "Standard_A7", "Standard_A8", "Standard_A9", "Standard_A10", "Standard_A11", "Standard_D1", "Standard_D2", "Standard_D3", "Standard_D4”, “Standard_D11", "Standard_D12”, “Standard_D13", "Standard_D14”, “Standard_D1_v2", "Standard_D2_v2", "Standard_D3_v2", "Standard_D4_v2", "Standard_D5_v2", "Standard_D11_v2", "Standard_D12_v2", "Standard_D13_v2", "Standard_D14_v2", "Standard_G1", "Standard_G2", "Standard_G3", "Standard_G4", "Standard_G5" 


### Virtual machine sizes using premium storage accounts
"Standard_DS1", "Standard_DS2", "Standard_DS3", "Standard_DS4", "Standard_DS11", "Standard_DS12", "Standard_DS13", "Standard_DS14", "Standard_GS1", "Standard_GS2", "Standard_GS3", "Standard_GS4", "Standard_GS5"