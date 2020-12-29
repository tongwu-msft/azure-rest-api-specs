---
title: Azure IoT Central REST API auth
description: Learn about how to authenticate to use the IoT Central REST API.
services: iot-central
ms.service: iot-central
ms.topic: reference
author: viviali
ms.author: viviali
ms.date: 12/29/2020
---

# Authentication and authorization

Every REST API call that's made against an IoT Central application must include an Authorization header. The Authorization header must contain either an **API token** or an **AAD bearer token**. These tokens are used by IoT Central to determine who the caller is, and what they have access to within the application.

## API token
API tokens are meant for service to service communication, without a signed-in user context. You can create an API token in your application, and assign it a role to grant access to resources within your application. 

To create and use an API token:
1. Open your IoT Central application in the browser.
2. Go to *Administration/API tokens*
3. Click *Generate token*. You'll be prompted to give it a name and choose a role. The role determines what a client using this token is authorized to do in this application.
4. Generate the token and copy the value. The value is a secret and will only be shown once.
5. When constructing an API request, add a header that looks like this:
    |Header name| Header value|
    |--|---|
    |Authorization|\<API token value\>|

By default, 3 roles are available in your application. [Learn more about creating new roles](https://docs.microsoft.com/azure/iot-central/core/howto-manage-users-roles#manage-roles).

You can also create new API tokens programmatically. To make the API request to create a new API token, you will need an Authorization header containing an API token or bearer with permissions to create new API tokens. [See docs for API tokens operations](https://docs.microsoft.com/rest/api/iotcentral/apitokens).

## AAD bearer token
A bearer token is associated with an Azure Active Directory user account. You can generate a bearer token in the Azure CLI command: 
`az account get-access-token --resource https://apps.azureiotcentral.com`

Construct an API request with the following header:

|Header name| Header value|
|--|---|
|Authorization|Bearer \<bearer token value\>|

When using a bearer token in API requests, the caller is granted the same level of access that the Azure Active Directory user has in the IoT Central application.

## Next steps

Try making your first API request
* [List devices](https://docs.microsoft.com/rest/api/iotcentral/devices/list)