---
title: Authenticate to direct management Azure API Management REST API
description: How to authenticate to the direct management REST API for Azure API Management by using a SAS token
ms.date: 04/04/2022
ms.service: api-management
ms.topic: reference
author: dlepow
ms.author: danlep
translation.priority.mt: 
  - de-de
  - es-es
  - fr-fr
  - it-it
  - ja-jp
  - ko-kr
  - pt-br
  - ru-ru
  - zh-cn
  - zh-tw
---
# Authenticate to the direct management Azure API Management REST API

This guide describes how to create the access token (SAS token) required to make calls into the direct management Azure API Management REST API.
  
For more information about authorization and other prerequisites for accessing the direct management REST API, see [Direct management API Management REST API](../ApiManagementREST/API-Management-REST.md).  

> [!IMPORTANT]
> SAS token access can be applied only for direct management API calls, for example: `https://apim-instance.management.azure-api.net/ /subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ApiManagement/service/{serviceName}/apis?api-version=2021-08-01`. You cannot use it for API calls to Azure Resource Manager.
  
##  <a name="ManuallyCreateToken"></a> Manually create a SAS token  
  
1. Navigate to your Azure API Management instance in the [Azure portal](https://portal.azure.com).  
1. Select **Management API** from the **Deployment + infrastructure** section of the menu on the left.

    :::image type="content" source="./media/apim-management-api-enable-menu.png" alt-text="Select Management API in the Azure portal":::

1. In **Enable API Management REST API**, select **Yes**.  
  
    > [!IMPORTANT]
    > If **Enable API Management REST API** is not selected, calls made to the REST API for that service instance will fail.  

    :::image type="content" source="./media/apim-management-api-enable-checkbox.png" alt-text="Enable API Management API in the Azure portal":::
  
1. Specify the expiration date and time for the access token in the **Expiry** text box. This value must be in the format `MM/DD/YYYY H:MM PM|AM`.  

    :::image type="content" source="./media/api-management-access-token.png" alt-text="Generate access token for API Management REST API in the Azure portal"::: 
  
1. Select either the primary key or secondary key in the **Secret key** drop-down list. The keys provide equivalent access; two keys are provided to enable flexible key management strategies.  
  
1. Select **Generate** to create the access token.  
  
1. Copy the full access token and provide it in the `Authorization` header of every request to the API Management REST API, as shown in the following example.  

    ```http
    Authorization: SharedAccessSignature integration&201808020500&aAsTE43MAbKMkZ6q83Z732IbzesfsaPEU404oUjQ4ZLE9iIXLz+Jj9rEctxKYw43SioCfdLaDq7dT8RQuBKc0w==
    ```  

##  <a name="ProgrammaticallyCreateToken"></a> Programmatically create a SAS token  
  
1. Construct a string-to-sign in the following format: 
  
     `{identifier} + "\n" + {expiry}`  

    where:  
    `identifier` - the value of **Identifier** field from the Management API tab of your Azure API Management instance (see [previous section](#ManuallyCreateToken) for details).  
    `expiry` - desired expiry date of the SAS token.
  
1. Generate a signature by applying an HMAC-SHA512 hash function to the string-to-sign using either the primary or secondary key.  
  
1. Base64 encode the returned signature key.  
  
1. Create an access token using the following format.  
  
     `uid={identifier}&ex={expiry}&sn={Base64 encoded signature}` 

     Example: 
    
    `uid=53dd860e1b72ff0467030003&ex=2014-08-04T22:03:00.0000000Z&sn=ItH6scUyCazNKHULKA0Yv6T+Skk4bdVmLqcPPPdWoxl2n1+rVbhKlplFrqjkoUFRr0og4wjeDz4yfThC82OjfQ==`  
  
1. Use these values to create an `Authorization` header in every request to the API Management REST API, as shown in the following example.  
  
    ```http  
    Authorization: SharedAccessSignature uid=53dd860e1b72ff0467030003&ex=2014-08-04T22:03:00.0000000Z&sn=ItH6scUyCazNKHULKA0Yv6T+Skk4bdVmLqcPPPdWoxl2n1+rVbhKlplFrqjkoUFRr0og4wjeDz4yfThC82OjfQ==
    ```  
  
 The following example demonstrates the preceding steps for generating the access token.  
  
```c#  
using System;   
using System.Text;   
using System.Globalization;   
using System.Security.Cryptography;   
  
public class Program   
{   
    public static void Main()   
    {   
        var id = "53d7e14aee681a0034030003";   
        var key = "pXeTVcmdbU9XxH6fPcPlq8Y9D9G3Cdo5Eh2nMSgKj/DWqeSFFXDdmpz5Trv+L2hQNM+nGa704Rf8Z22W9O1jdQ==";   
        var expiry = DateTime.UtcNow.AddDays(10);   
        using (var encoder = new HMACSHA512(Encoding.UTF8.GetBytes(key)))   
        {   
            var dataToSign = id + "\n" + expiry.ToString("O", CultureInfo.InvariantCulture);   
            var hash = encoder.ComputeHash(Encoding.UTF8.GetBytes(dataToSign));   
            var signature = Convert.ToBase64String(hash);   
            var encodedToken = string.Format("SharedAccessSignature uid={0}&ex={1:o}&sn={2}", id, expiry, signature);   
            Console.WriteLine(encodedToken);   
        }   
    }   
}  
  
```  

> [!NOTE]
> Both SAS token formats are correct and accepted:  
> `SharedAccessSignature uid=53dd860e1b72ff0467030003&ex=2014-08-04T22:03:00.0000000Z&sn=ItH6scUyCazNKHULKA0Yv6T+Skk4bdVmLqcPPPdWoxl2n1+rVbhKlplFrqjkoUFRr0og4wjeDz4yfThC82OjfQ==`  
> and  
> `SharedAccessSignature integration&201808020500&aAsTE43MAbKMkZ6q83Z732IbzesfsaPEU404oUjQ4ZLE9iIXLz+Jj9rEctxKYw43SioCfdLaDq7dT8RQuBKc0w==`  
  
 For complete sample code, see the [API Management .NET REST API Sample](https://github.com/Azure/api-management-samples/tree/master/restApiDemo).  

## Next steps

* See the [API Management REST API reference](/rest/api/apimanagement).
