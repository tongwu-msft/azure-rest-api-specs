---
title: Azure Load Testing resource data plane URI
description: 'Azure Load Testing Preview has data plane operations which can be performed on an Azure Load Testing resource.'
author: ninallam
ms.author: ninallam
ms.date: 05/24/2022
ms.topic: reference
ms.service: load-testing
ms.devlang: rest-api
---

# Azure Load Testing Data Plane URI

Azure Load Testing Preview has control plane and data plane operations. For example, creating an Azure Load Testing resource is a control plane operation and creating a load test is a data plane operation. To perform data plane operations, you will need to get the data plane URI for the resource you created.

## Get the data plane URI for an Azure Load Testing resource

This section shows to get the data plane URI for an Azure Load Testing resource.

1. Create an Azure Load Testing resource

    ```http
    PUT https://management.azure.com/subscriptions/{subcriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.LoadTestService/loadTests/{resourceName}?api-version=2022-04-15-previewloadtests\
    ```  

    For a client making a request with this signature, the [Create or Update Load Test resource](/rest/api/loadtesting/resourcemanager(2022-04-15-preview)/load-test-resource/create-or-update) operation will be executed.

    A successful response for a request made using this signature will be similar to the following:

    ```json
    { 
          "location": "westus", 
          "properties": { 
            "description": "This is new load test resource", 
            "dataPlaneURI": "https://myLoadTest.00000000-0000-0000-0000-000000000000.cnt-dp.domain.com", 
            "provisioningState": "Succeeded", 
            "encryption": { 
              "identity": { 
                "type": "UserAssigned", 
                "resourceId": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/dummyrg/providers/Microsoft.ManagedIdentity/userAssignedIdentities/id1" 
              }, 
              "keyUrl": "https://dummy.vault.azure.net/keys/dummykey1" 
            } 
          }, 
          "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/dummyrg/providers/Microsoft.LoadTestService/loadTests/myLoadTest", 
          "name": "myLoadTest", 
          "type": "Microsoft.LoadTestService/loadTests", 
          "tags": { 
            "Team": "Dev Exp" 
          }, 
          "systemData": { 
            "createdBy": "userId1001", 
            "createdByType": "User", 
            "createdAt": "2021-09-28T12:32:33Z", 
            "lastModifiedBy": "userId1001", 
            "lastModifiedByType": "User", 
            "lastModifiedAt": "2021-09-28T12:32:33Z" 
          } 
        }
    ```

1. Get the data plane URI for the resource created.

    In the *properties* section of the response, you can find different properties related to the new Azure Load Testing resource and its state. If the *provisioningState* is **Succeeded**, you can use the *dataPlaneURI* to perform data plane API operations on the resource.
