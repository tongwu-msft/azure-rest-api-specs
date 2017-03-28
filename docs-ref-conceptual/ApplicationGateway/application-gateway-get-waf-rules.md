---
title: Get available rule sets
ms.date: 03/09/2017
ms.service: application-gateway
ms.devlang: rest-api
ms.topic: reference
author: amitsriva
ms.author: amsriva
manager: rossort
---
---
# Get available WAF rule sets

Gets a list of available rule sets for web application firewall.

For information about getting started with Azure REST operations including request authentication, see [Azure REST API Reference](../../index.md).

## Request
  
|Method|Request URI|
|------------|-----------------|
|GET|`/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/applicationGatewayAvailableWafRuleSets?api-version={api-version}`|

| Parameter | Description |
| --------- | ----------- |
| subscriptionId | The identifier of your subscription. |
| api-version | The version of the API to use. The current version is 2017-03-01. | 

## Request Body

None

### Response

```json
{
    "name": "OWASP_3.0",
    "id": "/subscriptions//resourceGroups//providers/Microsoft.Network/applicationGatewayAvailableWafRuleSets/",
    "type": "Microsoft.Network/applicationGatewayAvailableWafRuleSets",
    "properties": {
    "provisioningState": "Succeeded",
    "ruleSetType": "OWASP",
    "ruleSetVersion": "3.0",
    "ruleGroups": [
        {
        "ruleGroupName": "REQUEST-910-IP-REPUTATION",
        "description": "",
        "rules": [
            {
            "ruleId": 910011,
            "description": "Rule 910011"
            },
            {
            "ruleId": 910012,
            "description": "Rule 910012"
            },
            {
            "ruleId": 910000,
            "description": "Request from Known Malicious Client (Based on previous traffic violations)."
            },
            {
            "ruleId": 910100,
            "description": "Client IP is from a HIGH Risk Country Location."
            },
            {
            "ruleId": 910120,
            "description": "Rule 910120"
            },
            ...
        ]
        },

    ]
    }
}
,
{
    "name": "OWASP_2.2.9",
    "id": "/subscriptions//resourceGroups//providers/Microsoft.Network/applicationGatewayAvailableWafRuleSets/",
    "type": "Microsoft.Network/applicationGatewayAvailableWafRuleSets",
    "properties": {
    "provisioningState": "Succeeded",
    "ruleSetType": "OWASP",
    "ruleSetVersion": "2.2.9",
    "ruleGroups": [
        {
        "ruleGroupName": "crs_20_protocol_violations",
        "description": "",
        "rules": [
            {
            "ruleId": 960911,
            "description": "Invalid HTTP Request Line"
            },
            {
            "ruleId": 981227,
            "description": "Apache Error: Invalid URI in Request."
            },
            {
            "ruleId": 960912,
            "description": "Failed to parse request body."
            },
            ...
        ]
        },
        ...
    ]
    }
}
```

**Status code:** If successful, if gateway does not exist return HTTP Status code of 201(Created) otherwise HTTP status code of 200(OK).
