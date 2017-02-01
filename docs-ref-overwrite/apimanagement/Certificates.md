---
uid: management.azure.com/ApiManagementClient/2016-07-07/Certificates_ListByService
description: *content
---
Lists a collection of all certificates in the specified service instance.

You can filter the results by specifying a value for the `$filter` parameter using OData filter expression [syntax](http://docs.oasis-open.org/odata/odata/v4.0/os/part2-url-conventions/odata-v4.0-os-part2-url-conventions.html#_Toc372793792). The following fields and operators are supported.

| Field | Supported operators    | Supported functions|
|-------|------------------------|---------------------------------------------|
| id    | ge, le, eq, ne, gt, lt | substringof, contains, startswith, endswith |
| subject  | ge, le, eq, ne, gt, lt | substringof, contains, startswith, endswith |
| thumbprint  | ge, le, eq, ne, gt, lt | substringof, contains, startswith, endswith |
| expirationDate  | ge, le, eq, ne, gt, lt | N/A |