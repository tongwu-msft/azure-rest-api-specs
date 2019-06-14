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

1. Follow this article to Register a new client application in your company Azure Active Directory:
[Quickstart: Register an application with the Microsoft identity platform](/azure/active-directory/develop/quickstart-register-app)

To learn how to authenticate a client app using an Azure AD **Client ID**, see [Authenticate a client app](Authenticate-a-client-app.md).  

2. On your new app registration, select **API Permissions**. Select **+ Add a permission**.

3. In the list of Permissions, select **Azure Data Catalog**

4. Select the option **Delegated permissions** for the question **What type of permissions does your application require?"

5. Check the checkbox to grant permission **user_impersonation**. Then select **Add permission**.
  
## Get a client app ID

When you register a client app, such as a console app, you receive a **Client ID**.  The **Client ID** is used by the application to identify themselves to the users that they are requesting permissions from.

  
## Configure a Service Principal

1. Open the [Azure portal](http://portal.azure.com).

2. Select **Azure Active Directory** from the list of resources.

3. Under the **Manage** heading, select **App Registrations (Legacy)** page.

4. Select **New application registration** button. Provide the details:

   | Field | Suggested value |  Description | 
   | --- | --- | --- | 
   | Name | Data Catalog | A descriptive application name. | 
   | Application type | Web app / API | This choice represents that you plan to interact using an API. |
   | Sign-on URL | http://contoso.com | This URL is where a user can sign in and user you app. However, it is somewhat arbitrary if you are not coding a web app. |

5. Once the new registered app appears, select **Settings**.

6. Generate a key and copy the password.

   a. In an empty row under Passwords, provide a **Description** and the **Expires** duration.

   b. Select **Save** and the value for the key appears. 

   c. Highlight the **Value** that is generated. Then copy / paste the value to a safe location.

7. Browse to [http://www.azuredatacatalog.com](http://www.azuredatacatalog.com)

8. Select **Settings**. Then add the service principal to the appropriate Catalog User.

Based on the business need, you can add it to **glossary admin** or **catalog admin**.

   > [!Note]
   > The service principal format is `<clientid>@<tenantid>`.
   > To locate the values to insert for the <placeholders>, use the [Azure portal](https://portal.azure.com) and open the Azure Active Directory. 
   >
   > - The **Clientid** value is listed on the Azure Active Directory **App registrations (Legacy)** page in the Application ID column.
   > - The **TenantID** value is listed on the Azure Active Directory **Properties** page as the **Directory ID** property.
   >

9. Follow the [Service Principal Authentication sample](https://github.com/Azure-Samples/data-catalog-dotnet-service-principal-get-started) REST API code to build your solution. 
