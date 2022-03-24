---
title: Azure IoT Central REST API auth
description: Learn about how to authenticate to use the IoT Central REST API.
services: iot-central
ms.service: iot-central
ms.topic: reference
author: avneet723
ms.author: avneets
ms.date: 08/02/2021
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

By default, 3 roles are available in your application. [Learn more about creating new roles](/azure/iot-central/core/howto-manage-users-roles#manage-roles).

You can also create new API tokens programmatically. To make the API request to create a new API token, you will need an Authorization header containing an API token or bearer with permissions to create new API tokens. [See docs for API tokens operations](/rest/api/iotcentral/1.1-previewdataplane/api-tokens).

## AAD bearer token
A bearer token is associated with an Azure Active Directory user account that has been added to your IoT Central application. You can generate a bearer token in the Azure CLI command: 
`az account get-access-token --resource https://apps.azureiotcentral.com`

Construct an API request with the following header:

|Header name| Header value|
|--|---|
|Authorization|Bearer \<bearer token value\>|

When using a bearer token in API requests, the caller is granted the same level of access that the Azure Active Directory user has in the IoT Central application.

### Service principal authentication
To use an AAD service principal to authenticate against the API, first you will need to create the service principal. You will need to get the tenant ID and object ID of your service principal:
1. Go to Azure portal -> Azure Active Directory -> Overview. Copy the **tenantID**
2. Go to Enterprise applications. Create a new application or choose an existing one. Copy the **objectID**
3. Go to Azure portal -> Azure Active Directory -> App registrations -> your app -> API Permissions. Click Add a permission -> APIs my organization uses and search for **Microsoft IoT Central**. Choose the item that matches this exact text.
4. Select the **user_impersonation** and **Application.ReadWrite.All** permissions and add them.
5. Select **Grant admin consent for your directory**.

Finally, add your service principal to your IoT Central application. This is possible through the APIs today. 
1. Use the [*Create users* API](/rest/api/iotcentral/1.1-previewdataplane/users/create) to add this service principal user. Make sure you use the **{tenantID}** and **{objectID}** when creating the new user.

Now you can use the bearer token associated to this service principal user to make API requests, following the same steps as above.

## Next steps

Try making your first API request
* [List devices](/rest/api/iotcentral/1.0dataplane/devices/list)
