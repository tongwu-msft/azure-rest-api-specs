---
title: "Service Fabric Names and JSON Serialization"
ms.date: "2017-04-23"
ms.prod: "azure"
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
  - "Windows Server 2012 R2"
  - "Windows Server 2016"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric REST API Reference"
author: "rwike77"
ms.author: "ryanwi"
manager: "timlt"
translation.priority.mt: 
  - "de-de"
  - "es-es"
  - "fr-fr"
  - "it-it"
  - "ja-jp"
  - "ko-kr"
  - "pt-br"
  - "ru-ru"
  - "zh-cn"
  - "zh-tw"
---
# Service Fabric Names and JSON Serialization
Many request and response include names and ids of the Service Fabric application, service, partition or replicas. These names and ids must not be URL encoded when sent in the body or as query parameters.

For example, the ContinuationToken parameter for getting the list of applications in a paged manner may include the name of the application. When sending this back to get the next page it must not be encoded. 

**Request**<BR/>
Get first page of applications. 

```
http://localhost:19080/Applications?api-version=3.0
```

**Response**<BR/>

```json
{
  "ContinuationToken": "fabric:/samples/PQueueApp1",
  "Items": [
    {
      "Id": "samples/CalculatorApp",
      "Name": "fabric:/samples/CalculatorApp",
      "TypeName": "CalculatorApp",
      "TypeVersion": "1.0",
      "Status": "Ready",
      "Parameters": [],
      "HealthState": "Error"
    },
    {
      "Id": "samples/PQueueApp1",
      "Name": "fabric:/samples/PQueueApp1",
      "TypeName": "PersistentQueueApp",
      "TypeVersion": "1.0",
      "Status": "Ready",
      "Parameters": [],
      "HealthState": "Ok"
    }
  ]
}

```


**Request**<BR/>
Get second page of applications by passing the ContinuationToken from the first response. Note that the value of the ContinuationToken parameter in the request is not encoded.

```
http://localhost:19080/Applications?api-version=3.0&ContinuationToken=fabric:/samples/PQueueApp1

```

**Response**<BR/>

```json
{
  "ContinuationToken": "",
  "Items": [
    {
      "Id": "samples/VQueueApp1",
      "Name": "fabric:/samples/VQueueApp1",
      "TypeName": "VolatileQueueApp",
      "TypeVersion": "1.0",
      "Status": "Ready",
      "Parameters": [],
      "HealthState": "Ok"
    }
  ]
}

```