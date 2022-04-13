---
title: Direct management API Management REST API
description: How to enable and use the direct management REST API for Azure API Management. This API can bypass some limitations of Azure Resource Manager.
ms.date: 04/04/2022
ms.service: api-management
ms.topic: reference
ms.author: danlep
author: dlepow
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
# Direct management API Management REST API

Azure API Management provides a direct management REST API for performing operations on selected entities, such as users, groups, products, and subscriptions. The direct management API can bypass certain [limits](/azure/azure-resource-manager/management/request-limits-and-throttling#subscription-and-tenant-limits) of the Azure Resource Manager-based API, such as request throttling. 

>[!IMPORTANT]
>This section describes how to access the direct management API Management REST API. This API has a different [authentication mechanism](./Azure-API-Management-REST-API-Authentication.md) than Azure Resource Manager and uses a different base URL.
  
  

##  <a name="EnableRESTAPI"></a> Enable access to the direct management REST API  
 Access to the direct management API Management REST API must be granted before calls can be successfully made.

1. Navigate to your Azure API Management instance in the [Azure portal](https://portal.azure.com).  
1. Select **Management API** from the **Deployment + infrastructure** section of the menu on the left.

    :::image type="content" source="./media/apim-management-api-enable-menu.png" alt-text="Select Management API in the Azure portal":::

1. In **Enable API Management REST API**, select **Yes**.  
  
    > [!IMPORTANT]
    > If **Enable API Management REST API** is not selected, calls made to the REST API for that service instance will fail.  

    :::image type="content" source="./media/apim-management-api-enable-checkbox.png" alt-text="Enable API Management API in the Azure portal":::

##  <a name="DefaultMediaType"></a> Default media type  
 The default media type for requests and responses is `application/json`. Where noted, some operations support other content types. If no additional content type is mentioned for a specific operation, then the media type is `application/json`.  
  
##  <a name="Authentication"></a> Authentication  
 Each request to the API Management REST API must be accompanied by an `Authorization` header containing a valid shared access token, as shown in the following example.  
  
```
Authorization: SharedAccessSignature uid=53dd860e1b72ff0467030003&ex=2014-08-04T22:03:00.0000000Z&sn=ItH6scUyCazNKHULKA0Yv6T+Skk4bdVmLqcPPPdWoxl2n1+rVbhKlplFrqjkoUFRr0og4wjeDz4yfThC82OjfQ==  
```
  
 This access token can be generated programmatically or from within the API Management publisher portal. For instructions on generating and retrieving the access token, see [To manually create an access token](../ApiManagementREST/Azure-API-Management-REST-API-Authentication.md#ManuallyCreateToken) and [To programmatically create an access token](../ApiManagementREST/Azure-API-Management-REST-API-Authentication.md#ProgrammaticallyCreateToken).  
  
##  <a name="BaseURL"></a> Base URL  
 The Base URL of the direct management API Management REST API conforms to the following template.  
  
 `https://{servicename}.management.azure-api.net`  
  
 This template contains the following parameter.  
  
-   `{serviceName}` is the service name as it was specified during service creation, for example `https://contosoapi.management.azure-api.net`.  
  
 All URLs returned by the API Management REST API are relative to this base URL, and all requests to the REST API must use this base URL template.  
  
##  <a name="VersionQueryParameter"></a> Version Query Parameter  
 All operations expect an `api-version` query parameter with a value in the format of `YYYY-MM-DD`, for example `2021-08-01`.  
  
> [!NOTE]
> During a preview period for an API Management REST API, `-preview` is appended to the version query parameter, for example `2021-04-01-preview`.  
  
 If this query parameter isn't passed in the query string of a request, the server will return a status code of `400 Bad Request`. For a list of supported versions, see [API Management REST API reference](/rest/api/apimanagement/). 
  
## Next steps

- Learn more about the [authentication](../ApiManagementREST/Azure-API-Management-REST-API-Authentication.md).
