---
uid: management.azure.com/ApiManagementClient/2016-07-07/Apis_CreateOrUpdate
description: *content
---
Creates new or updates existing specified API of the API Management service instance.

To import an API you can specify `true` for the `import` query parameter, and provide the API to import in the body of the request, using one of the following content types that you then specify in the `Content-Type` header.

| Content-Type | Description |
|--------------|-------------|
| `application/vnd.sun.wadl+xml`, `application/vnd.swagger.doc+json`, `application/json`|These media types are used when the API metadata is provided in the body of the request.|
|`application/vnd.swagger.link+json`, `application/vnd.sun.wadl.link+json`|These media types are used when the API metadata is provided via a link in the body of the request in the following format: `{"link" : http://contoso.com/myapi/metadata}`|


>[!IMPORTANT]
>The `path` parameter must be present only if the `import` parameter is set to `true`. `path` is a relative URL uniquely identifying this API and all of it resource paths within the API Management service instance. It is appended to the API endpoint base URL specified during the service instance creation to form a public URL for this API.

---
uid: management.azure.com/ApiManagementClient/2016-07-07/Apis_ListByService
description: *content
---
Lists all APIs of the API Management service instance.

You can filter the results by specifying a value for the `$filter` parameter using OData filter expression [syntax](http://docs.oasis-open.org/odata/odata/v4.0/os/part2-url-conventions/odata-v4.0-os-part2-url-conventions.html#_Toc372793792). The following fields and operators are supported.

| Field | Supported operators    | Supported functions|
|-------|------------------------|---------------------------------------------|
| id          | ge, le, eq, ne, gt, lt | substringof, contains, startswith, endswith |
| name        | ge, le, eq, ne, gt, lt | substringof, contains, startswith, endswith |
| description | ge, le, eq, ne, gt, lt | substringof, contains, startswith, endswith |
| serviceUrl  | ge, le, eq, ne, gt, lt | substringof, contains, startswith, endswith |
| path        | ge, le, eq, ne, gt, lt | substringof, contains, startswith, endswith |