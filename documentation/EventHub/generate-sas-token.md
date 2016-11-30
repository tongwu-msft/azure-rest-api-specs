---
title: "Generate SAS token"
ms.custom: ""
ms.date: "2016-11-14"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "event-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 1a1f5bbc-0ae2-4246-9c86-92ca0b1a2e2c
caps.latest.revision: 4
author: "sethmanheim"
ms.author: "sethm"
manager: "timlt"
---
# Generate SAS token
This section shows how to programmatically generate a SAS token for using the Event Hubs REST APIs.  
  
1.  Using SharedAccessSignatureTokenProvider Class (Recommended):  
  
    ```c#  
    ServiceBusConnectionStringBuilder connectionString = new ServiceBusConnectionStringBuilder(serviceBusConnectionString);  
  
    string ServiceBusNamespace = connectionString.Endpoints.First().Host;  
    string namespaceKeyName = connectionString.SharedAccessKeyName;  
    string namespaceKey = connectionString.SharedAccessKey;  
  
    // Create a token valid for 45mins  
    string token = SharedAccessSignatureTokenProvider.GetSharedAccessSignature(namespaceKeyName, namespaceKey, ServiceBusNamespace, TimeSpan.FromMinutes(45));  
  
    ```  
  
2.  Using `UrlEncode`:  
  
    ```c#  
    TimeSpan fromEpochStart = DateTime.UtcNow - new DateTime(1970, 1, 1);  
    string expiry = Convert.ToString((int)fromEpochStart.TotalSeconds + 3600);  
    string stringToSign = WebUtility.UrlEncode(baseAddress) + "\n" + expiry;  
    HMACSHA256 hmac = new HMACSHA256(Encoding.UTF8.GetBytes(SASKeyValue));  
  
    string signature = Convert.ToBase64String(hmac.ComputeHash(Encoding.UTF8.GetBytes(stringToSign)));  
    string token = String.Format(CultureInfo.InvariantCulture, "SharedAccessSignature sr={0}&sig={1}&se={2}&skn={3}",  
                    WebUtility.UrlEncode(baseAddress), WebUtility.UrlEncode(signature), expiry, SASKeyName);  
  
    ```