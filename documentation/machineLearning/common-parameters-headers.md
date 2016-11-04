# Common parameters and headers

The following information is common to all tasks related to web services:

- Replace {api-version} with **2016-05-01-preview**.
- Replace {subscription-id} with your subscription identifier in the URI.
- Replace {resource-group-name} with the resource group name.
- Set the Content-Type header to **application/json**.
- Set the Authorization header to a JSON Web Token that you obtain from Azure Active Directory. For more information, see [Authenticating Azure Resource Manager requests](https://msdn.microsoft.com/library/azure/dn790557.aspx).