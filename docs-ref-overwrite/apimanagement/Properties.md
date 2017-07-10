---
uid: management.azure.com/ApiManagementClient/2016-10-10/Properties_ListByService
description: *content
---
Lists a collection of properties defined within a service instance.

You can filter the results by specifying a value for the `$filter` parameter using OData filter expression [syntax](http://docs.oasis-open.org/odata/odata/v4.0/os/part2-url-conventions/odata-v4.0-os-part2-url-conventions.html#_Toc372793792). The following fields and operators are supported.

| Field | Supported operators    | Supported functions|
|-------|------------------------|---------------------------------------------|
| tags  | ge, le, eq, ne, gt, lt | substringof, contains, startswith, endswith |
| name  | ge, le, eq, ne, gt, lt | substringof, contains, startswith, endswith |