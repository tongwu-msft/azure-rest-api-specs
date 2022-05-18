---
title: Use Azure Active Directory authentication to send messages to an event hub
description: Learn how to get an Azure Active Directory (Azure AD) token that you can use to send events to and receive events from a Service Bus namespace.
ms.date: "07/15/2020"
ms.service: "event-hubs"
ms.topic: "reference"
author: "spelluru"
ms.author: "spelluru"
manager: "femila"
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

# Get an Azure Active Directory (Azure AD) token and use it send events to an event hub 
See [Authenticate from an application](https://docs.microsoft.com/azure/event-hubs/authenticate-application#authenticate-from-an-application) for an overview of getting an Azure Active Directory (Azure AD) token. 

This article gives you an example of getting an Azure Active Directory (Azure AD) token that you can use to send events to and receive events from a Service Bus namespace. It uses the **Postman** tool for testing purposes. 

## Prerequisites

- Follow instructions from [Quickstart: Use Azure portal to create an event hub on Azure](https://docs.microsoft.com/azure/event-hubs/event-hubs-create) to create an Event Hubs namespace and an event hub in the namespace.
- Download and install [Postman](https://www.postman.com/) desktop app.

## Register your app with Azure AD
First step is to register you application with the Azure AD tenant and note down the values of tenant ID, client ID, and client secret. You will use these values latest when testing the REST API using the Postman tool. 

1. Sign in to the [Azure portal](https://portal.azure.com).
1. In the search bar, search for **Azure Active Directory**, and select it from the drop-down list. 

    :::image type="content" source="./media/get-azure-active-directory-token/search-select.png" alt-text="Search for Azure Active Directory and select it":::
1. On the **Azure Active Directory** page, select **App Registrations** link on the left menu, and then select **+ New registration** on the toolbar. 

    :::image type="content" source="./media/get-azure-active-directory-token/new-registration-link.png" alt-text="Switch to the App registrations page, and select New registration":::
4. Enter a **name** for the app, and select **Register**. 

    :::image type="content" source="./media/get-azure-active-directory-token/register-app.png" alt-text="Enter a name and select Register":::    
1. On the home page for the application, note down the values of **Application (client) ID** and **Directory (tenant) ID**. You will use these values to get a token from Azure AD. 

    :::image type="content" source="./media/get-azure-active-directory-token/client-app-overview.png" alt-text="Note down client ID and tenant ID":::    
1. Now, select **Certificates & secrets** on the left menu, and select **+ New client secret**. 

    :::image type="content" source="./media/get-azure-active-directory-token/new-client-secret-link.png" alt-text="Switch to Certificates & Secrets page, and select New client secret":::    
1. Enter a **description**, select when the secret will **expire**, and select **Add**. 

    :::image type="content" source="./media/get-azure-active-directory-token/add-client-secret.png" alt-text="Enter description, select expiry time, and select Add":::    
8. Select the copy button next to the secret value in the **Client secrets** list to copy the value to the clipboard. Paste it somewhere. You will use it later to get a token from Azure AD.

    :::image type="content" source="./media/get-azure-active-directory-token/client-secret.png" alt-text="Copy client secret":::

## Add application to the Event Hubs Data Sender role 
In this example, we are only sending messaging to the event hub, so add the application to the **Azure Event Hubs Data Sender** role. 

1. On the **Event Hubs Namespace** page, select **Access control** from the left menu, and then select **Add** on the **Add a role assignment** tile. 

    :::image type="content" source="./media/get-azure-active-directory-token/add-role-assignment-button.png" alt-text="Access control -> Add a role assignment":::    
1. On the **Add role assignment** page, select **Azure Event Hubs Data Sender** for **Role**, and select your application (in this example, **ServiceBusRestClientApp**) for the service principal. 

    :::image type="content" source="./media/get-azure-active-directory-token/select-role-application.png" alt-text="Add app to the Azure Event Hubs Data Sender role":::
1. Select **Save** on the **Add role assignment** page to save the role assignment. 


## Use Postman to get the Azure AD token 

1. Launch Postman. 
1. For the method, select **GET**.
1. For the URI, enter `https://login.microsoftonline.com/<TENANT ID>/oauth2/token`. Replace `<TENANT ID>` with the tenant ID value you copied earlier. 
1. On the **Headers** tab, add **Content-Type** key and `application/x-www-form-urlencoded` for the value. 

    :::image type="content" source="./media/get-azure-active-directory-token/postman-headers.png" alt-text="Add content-type header" lightbox="./media/get-azure-active-directory-token/postman-headers.png":::
1. Switch to the **Body** tab, and add the following keys and values. 
    1. Select **form-data**. 
    2. Add `grant_type` key, and type `client_credentials` for the value. 
    3. Add `client_id` key, and paste the value of **client ID** you noted down earlier. 
    1. Add `client_secret` key, and paste the value of **client secret** you noted down earlier. 
    1. Add `resource` key, and type `https://eventhubs.azure.net` for the value. 

        :::image type="content" source="./media/get-azure-active-directory-token/postman-body.png" alt-text="Set body for the request" lightbox="./media/get-azure-active-directory-token/postman-body.png":::
6. Select **Send** to send the request to get the token. You see the token in the result. Save the token (excluding double quotes). You will use it later. 

    :::image type="content" source="./media/get-azure-active-directory-token/access-token.png" alt-text="Access token from Azure AD" lightbox="./media/get-azure-active-directory-token/access-token.png":::    

## Send messages to a queue

1. In Postman, open a new tab. 
1. Select **POST** for the method. 
1. Enter URI in the following format: `https://<EVENT HUBS NAMESPACE NAME>.servicebus.windows.net/<QUEUE NAME>/messages`. Replace `<EVENT HUBS NAMESPACE NAME>` with the name of the Event Hubs namespace. Replace `<QUEUE NAME>` with the name of the queue. 
1. On the **Headers** tab, add the following two headers.
    1. Add `Authorization` key and value for it in the following format: `Bearer <TOKEN from Azure AD>`. When you copy/paste the token, don't copy the enclosing double quotes. 
    1. Add `Content-Type` key and `application/atom+xml;type=entry;charset=utf-8` as the value for it. 

        :::image type="content" source="./media/get-azure-active-directory-token/postman-headers-message.png" alt-text="Screenshot of the Headers tab emphasized in the Event Hub" lightbox="./media/get-azure-active-directory-token/postman-headers-message.png":::
5. On the **Body** tab, select **raw** for the data type, and enter `This is a message` or any message for the body. 

    :::image type="content" source="./media/get-azure-active-directory-token/postman-body-message.png" alt-text="Screenshot of the test event in the raw Body view in the Event Hub." lightbox="./media/get-azure-active-directory-token/postman-body-message.png":::    
1. Select **Send** to send the message to the queue. You see the status as `Created` with the code 201 as shown in the following image. 

    :::image type="content" source="./media/get-azure-active-directory-token/status-201.png" alt-text="Succeeded status" lightbox="./media/get-azure-active-directory-token/status-201.png":::
2. On the namespace page in the Azure portal, you can see that the messages are posted to the queue.

    :::image type="content" source="./media/get-azure-active-directory-token/namespace-page-messages.png" alt-text="Messages are posted to the queue" lightbox="./media/get-azure-active-directory-token/namespace-page-messages.png":::
    
## See Also  
See the following articles:

- [Authenticate from an application](https://docs.microsoft.com/azure/service-bus-messaging/authenticate-application#authenticate-from-an-application)
- [Microsoft identity platform and OAuth 2.0 authorization code flow](https://docs.microsoft.com/azure/active-directory/develop/v2-oauth2-auth-code-flow)
