---
uid: management.azure.com/ApiManagementClient/2016-07-07/Subscriptions_ListByService
description: *content
---
Lists all subscriptions of the API Management service instance.

You can filter the results by specifying a value for the `$filter` parameter using OData filter expression [syntax](http://docs.oasis-open.org/odata/odata/v4.0/os/part2-url-conventions/odata-v4.0-os-part2-url-conventions.html#_Toc372793792). The following fields and operators are supported.

| Field | Supported operators    | Supported functions|
|-------|------------------------|---------------------------------------------|
| id           | ge, le, eq, ne, gt, lt | substringof, contains, startswith, endswith |
| stateComment | ge, le, eq, ne, gt, lt | substringof, contains, startswith, endswith |
| userId       | ge, le, eq, ne, gt, lt | substringof, contains, startswith, endswith |
| productId    | ge, le, eq, ne, gt, lt | substringof, contains, startswith, endswith |