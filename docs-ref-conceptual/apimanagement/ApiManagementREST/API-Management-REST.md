---
title: "API Management REST"
ms.custom: na
ms.date: 04/22/2016
ms.reviewer: na
ms.service: api-management
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.assetid: 1b96aa01-6b6a-4d20-b8f3-ccd1d668b2f9
caps.latest.revision: 20
author: steved0x
manager: douge
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
# API Management REST

Azure API Management provides a REST API for performing operations on selected entities, such as users, groups, products, and subscriptions. This reference provides a guide for working with the API Management REST API, as well as specific reference information for each available operation, grouped by entity.  

>[!IMPORTANT]
>This section describes how to access the API Management REST API using a different authentication mechanism than Azure Resource provider. For more information, see the following Prerequisites section.
  
 For more information about working with the REST API, see the [API Management .NET REST API Sample](https://github.com/Azure/api-management-samples/tree/master/restApiDemo) and the [Getting Started with Azure API Management REST API](https://azure.microsoft.com/documentation/videos/getting-started-with-azure-api-management-rest-api/) video.  
  
## In this topic  
  
- [Enable access to the REST API](../ApiManagementREST/API-Management-REST.md#EnableRESTAPI)  
  
- [Default media type](../ApiManagementREST/API-Management-REST.md#DefaultMediaType)  
  
- [Authentication](../ApiManagementREST/API-Management-REST.md#Authentication)  
  
- [Base URL](../ApiManagementREST/API-Management-REST.md#BaseURL)  
  
- [Version Query Parameter](../ApiManagementREST/API-Management-REST.md#VersionQueryParameter)
  
###  <a name="EnableRESTAPI"></a> Enable access to the REST API  
 Access to the API Management REST API must be granted before calls can be successfully made.

1. Sign into the [Azure Portal](https://portal.azure.com/) and navigate to your API Management service instance.

2. Click on **Management API** from the menu.  
    ![API Management Enable REST menu](../ApiManagementREST/media/apim-management-api-enable-menu.png)  

3. Select the **Enable API Management REST API** checkbox.  
     ![API Management Enable REST checkbox](../ApiManagementREST/media/apim-management-api-enable-checkbox.png)  
  
> [!IMPORTANT]
>  If the **Enable API Management REST API** checkbox is not checked, calls made to the REST API for that service instance will fail.  
  
###  <a name="DefaultMediaType"></a> Default media type  
 The default media type for requests and responses is `application/json`. Where noted, some operations support other content types. If no additional content type is mentioned for a specific operation, then the media type is `application/json`.  
  
###  <a name="Authentication"></a> Authentication  
 Each request to the API Management REST API must be accompanied by an `Authorization` header containing a valid shared access token, as shown in the following example.  
  
```
Authorization: SharedAccessSignature uid=53dd860e1b72ff0467030003&ex=2014-08-04T22:03:00.0000000Z&sn=ItH6scUyCazNKHULKA0Yv6T+Skk4bdVmLqcPPPdWoxl2n1+rVbhKlplFrqjkoUFRr0og4wjeDz4yfThC82OjfQ==  
```
  
 This access token can be generated programmatically or from within the API Management publisher portal. For instructions on generating and retrieving the access token, see [To manually create an access token](../ApiManagementREST/Azure-API-Management-REST-API-Authentication.md#ManuallyCreateToken) and [To programmatically create an access token](../ApiManagementREST/Azure-API-Management-REST-API-Authentication.md#ProgrammaticallyCreateToken).  
  
###  <a name="BaseURL"></a> Base URL  
 The Base URL of the API Management REST API conforms to the following template.  
  
 `https://{servicename}.management.azure-api.net`  
  
 This template contains the following parameter.  
  
-   `{serviceName}` is the service name as it was specified during service creation, for example `https://contosoapi.management.azure-api.net`.  
  
 All URLs returned by the API Management REST API are relative to this base URL, and all requests to the REST API must use this base URL template.  
  
###  <a name="VersionQueryParameter"></a> Version Query Parameter  
 All operations expect an `api-version` query parameter with a value in the format of `YYYY-MM-DD`, for example `2014-02-14`.  
  
> [!NOTE]
>  During the preview period for API Management, `-preview` is appended to the version query parameter, for example `2014-02-14-preview`.  
  
 If this query parameter is not passed in the query string of a request, the server will return a status code of `400 Bad Request`. For a list of supported versions, see the following [API Management REST API version history](../ApiManagementREST/API-Management-REST.md) section.  
  
## Next steps

+ Learn more about the [authentication](../ApiManagementREST/Azure-API-Management-REST-API-Authentication.md)
