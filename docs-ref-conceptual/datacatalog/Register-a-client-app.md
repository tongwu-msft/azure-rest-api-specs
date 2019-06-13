---
title: Register a client app - Azure Data Catalog REST API
author: jasonwhowell
ms.author: jasonh
ms.service: data-catalog
ms.topic: reference
ms.date: 06/13/2019
---

# Register a client app (Azure Data Catalog REST API)

---  
This article shows you how to register a Data Catalog client app in Azure Active Directory (Azure AD). To allow your application access to the Data Catalog REST API, you need to register your application with **Azure Active Directory**. This action allows you to establish an identity for your application and specify permissions to Data Catalog REST resources.  
  
**Important** Before you register a Data Catalog app you need an [Azure Active Directory tenant and an organizational user](Create-an-Azure-Active-Directory-tenant.md).
  
## Register a client app

Register your client app in **Azure Active Directory** to establish an identity for your application and specify permissions to **Data Catalog** REST resources. When you register a client app, such as a console app, you receive a **Client ID**. The **Client ID** is used by the application to identify themselves to the users that they are requesting permissions from.  
  
To learn how to authenticate a client app using an Azure AD **Client ID**, see [Authenticate a client app](Authenticate-a-client-app.md).  
  
### Steps to register a client app
  
Here's how to register a client app:  
1. Review the [Microsoft Azure Service Agreement & Terms](https://azure.microsoft.com/en-us/support/legal). 

2. Sign into your Microsoft Azure subscription at https://manage.windowsazure.com using your AAD user name.

3. In the left service panel, choose **ACTIVE DIRECTORY**.  

4. Click the active directory that you belong to.  
  
    ![step 3](media/Register-app-3.png)  
  
5. Click **APPLICATIONS**.  
  
    ![step 4](media/Register-app-4.png)  
  
6. Click **ADD**.  
  
    ![step 5](media/Register-app-5.png)  
  
7. In the **What do you want to do** page, click Add an application my organization is developing. For some Active Directory configurations, you might not see this page.  

     ![WhatToDo](media/What-do-you-want-to-do.png)  

8. In **Tell us about your application**, enter a **NAME**, and choose **NATIVE CLIENT APPLICATION** for the type, and click **Next** icon.  
  
    ![step 6](media/Register-app-6.png)  

9. In **Application information**, enter a **REDIRECT URI**. For a client app, a redirect uri gives AAD more details on the specific application that it authenticates. For a client app, you can use this Uri: https://login.live.com/oauth20_desktop.srf.  
  
10. Click the **Complete** icon.

11. In the application page, choose **CONFIGURE**. You see your **CLIENT ID**.   

12. In the **CONFIGURATION** page, under **permissions to other applications**, click **Add Application**.  
  
    ![step 11](media/Register-app-11.png)  
  
13. In **Permissions to other applications**, choose **Microsoft Azure Data Catalog**.  
  
    ![step 12](media/Register.DC.12.png)  

14. Click **Complete** icon.  

15. In the **permissions to other applications** group, choose all **Delegated Permissions**, and chooses one or more permissions.  
  
    ![step 14](media/Register.DC.14.png)  

16. Click **Save**.  
  
## Get a client app ID

When you register a client app, such as a console app, you receive a **Client ID**.  The **Client ID** is used by the application to identify themselves to the users that they are requesting permissions from.  
  
Here are the steps to get a client ID:
  
1. Sign into your Microsoft Azure subscription at https://manage.windowsazure.com.  

2. In the left service panel, choose **ACTIVE DIRECTORY**.  

3. Click the active directory that you belong to.  

4. Click **APPLICATIONS**.  

5. Choose an application.  

6. In the application page, choose **CONFIGURE**.  

7. In the **CONFIGURE** page, copy the **CLIENT ID**.  

   ![step 1.7](media/Register-app-3a.png)
   
## Configure a Service Principal

### Create a service principal and a key

1. Open the [Azure portal](http://portal.azure.com).

2. Select **Azure Active Directory** from the list of all resources.

3. Under the Manage heading, select **App Registrations (Legacy)** page.

4. Select **New application registration** button. Provide the details:

| Field | Suggested value |  Description | 
| --- | --- | --- | 
| Name | Data Catalog | A descriptive application name. | 
| Application type | Web app / API | This choice represents that you plan to interact using an API. |
| Sign-on URL | http://contoso.com | This URL is where a user can sign in and user you app. However, it is somewhat arbitrary if you are not coding a web app. |

5. One the new Registered app appears, select **Settings**

6. Generate a key and copy the password. 

   a. In an empty row under Passwords, provide a **Description** and the **Expires** duration.

   b. Select **Save** and the value for the key appears. 

   c. Highlight the **Value** that is generated. Then copy / paste the value to a safe location.

7. Browse to [http://www.azuredatacatalog.com](http://www.azuredatacatalog.com)

8. Select **Settings**. Then add the service principal to the appropriate Catalog User.

Based on the business need you can add to **glossary admin** or **catalog admin**

> [!Note]
> The service principal format is <clientid>@<tenantid>
> Where the the placeholders are:
> Clientid = Azure Active Directory | App Registration | Application ID
> TenantID = Azure Active Directory | Properties | Directory ID

9. Follow the [Service Principal Authentication sample](https://github.com/Azure-Samples/data-catalog-dotnet-service-principal-get-started) REST API code to build your solution. 

