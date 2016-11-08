# Specifying conditional headers

The Batch service supports conditional headers on all the PUT, PATCH, DELETE, HEAD and GET operations on the following resources: pool, job schedule, job, task and files. A PUT/PATCH and possibly a POST call (the exact list of operations is listed below) on these resources can cause the ETag and Last-Modified-Time to change.  Both write operations (PUT/PATCH/POST) and read operations (GET/HEAD) will return the current ETag and a Last-Modified-Time for the resource.  These can be used in for subsequent conditional PUT, PATCH, POST, DELETE, HEAD or GET operations.

Pool, job schedule, job and task support both ETag and Last-Modified-Time. Files only support Last-Modified-Time because files are modified directly by tasks on the node using Windows File System APIs.  The Last-Modified-Time for files are based on the file system maintained file attributes. Nodes do not support any conditional operations.

The following table lists the APIs which support conditional operations and also the APIs which return the current ETag and Last-Modified time of the resource. All other APIs which are not listed in the below table do not support conditional headers and also do not return E-Tag/Last-Modified.

|Operation|Supports Conditional Headers?|Returns E-Tag/Last-Modified Headers?|
|---------------|-----------------------------------|---------------------------------------------|
|[Get information about a pool](../Topic/Get%20information%20about%20a%20pool.md)|Yes|Yes|
|[Add a pool to an account](../Topic/Add%20a%20pool%20to%20an%20account.md)|No|Yes|
|[Delete a pool from an account](../Topic/Delete%20a%20pool%20from%20an%20account.md)|Yes|No|
|[Upgrade the operating system of compute nodes in a pool](../Topic/Upgrade%20the%20operating%20system%20of%20compute%20nodes%20in%20a%20pool.md)|Yes|Yes|
|[Change the size of a pool](../Topic/Change%20the%20size%20of%20a%20pool.md)|Yes|Yes|
|[Remove compute nodes from a pool](../Topic/Remove%20compute%20nodes%20from%20a%20pool.md)|Yes|Yes|
|[Enable automatic scaling on a pool](../Topic/Enable%20automatic%20scaling%20on%20a%20pool.md)|Yes|Yes|
|[Disable automatic scaling on a pool](../Topic/Disable%20automatic%20scaling%20on%20a%20pool.md)|Yes|Yes|
|[Stop changing the size of a pool](../Topic/Stop%20changing%20the%20size%20of%20a%20pool.md)|Yes|Yes|
|[Replace the properties of a pool](../Topic/Replace%20the%20properties%20of%20a%20pool.md)|Yes|Yes|
|[Update the properties of a pool](../Topic/Update%20the%20properties%20of%20a%20pool.md)|Yes|Yes|
|[Get data from a file on a compute node](../Topic/Get%20data%20from%20a%20file%20on%20a%20compute%20node.md)|Yes|Yes|
|[Get data from a file on a compute node](../Topic/Get%20data%20from%20a%20file%20on%20a%20compute%20node.md)|Yes|Yes|
|[Get information about a job schedule](../Topic/Get%20information%20about%20a%20job%20schedule.md)|Yes|Yes|
|[Add a job schedule to an account](../Topic/Add%20a%20job%20schedule%20to%20an%20account.md)|No|Yes|
|[Delete a job schedule from an account](../Topic/Delete%20a%20job%20schedule%20from%20an%20account.md)|Yes|No|
|[Update the properties of a job schedule](../Topic/Update%20the%20properties%20of%20a%20job%20schedule.md)|Yes|Yes|
|[Enable a job schedule](../Topic/Enable%20a%20job%20schedule.md)|Yes|Yes|
|[Disable a job schedule](../Topic/Disable%20a%20job%20schedule.md)|Yes|Yes|
|[Terminate a job schedule](../Topic/Terminate%20a%20job%20schedule.md)|Yes|Yes|
|[Add a job to an account](../Topic/Add%20a%20job%20to%20an%20account.md)|No|Yes|
|[Get information about a job](../Topic/Get%20information%20about%20a%20job%20in%20Batch.md)|Yes|Yes|
|[Delete a job from an account](../Topic/Delete%20a%20job%20from%20an%20account.md)|Yes|No|
|[Update the properties of a job](../Topic/Update%20the%20properties%20of%20a%20job.md)|Yes|Yes|
|[Enable a job](../Topic/Enable%20a%20job.md)|Yes|Yes|
|[Disable a job](../Topic/Disable%20a%20job.md)|Yes|Yes|
|[Terminate a job](../Topic/Terminate%20a%20job.md)|Yes|Yes|
|[Get information about a task](../Topic/Get%20information%20about%20a%20task.md)|Yes|Yes|
|[Add a task to a job](../Topic/Add%20a%20task%20to%20a%20job.md)|No|Yes|
|[Delete a task from a job](../Topic/Delete%20a%20task%20from%20a%20job.md)|Yes|No|
|[Update the properties of a task](../Topic/Update%20the%20properties%20of%20a%20task.md)|Yes|Yes|
|[Terminate a task](../Topic/Terminate%20a%20task.md)|Yes|Yes|

 You can specify conditional headers to carry out an operation only if a specified condition has been met.

 The Batch service follows the [HTTP/1.1 protocol specification](http://go.microsoft.com/fwlink/?linkid=150478) for conditional headers.

## Supported Conditional Headers
 The supported conditional headers are described in the following table.  Task Files only support if-modified-since and if-unmodified-since.

|||
|-|-|
|Conditional header|Description|
|If-Match|An ETag is specified.  Specify this header to perform the operation only if the resource’s ETag is an exact match as specified.|
|If-None-Match|An ETag is specified.  Specify this header to perform the operation only if the resource’s ETag does not match the specified ETag.|
|If-Modified-Since|A DateTime value. Specify this header to perform the operation only if the resource has been modified since the specified time.|
|If-Unmodified-Since|A DateTime value. Specify this header to perform the operation only if the resource has not been modified since the specified date/time.|

 The Batch service uses the below rules to process requests specifying conditional headers:

-   If a request specifies both the *If-None-Match* and *If-Modified-Since* headers, the request is evaluated based on the criteria specified in *If-None-Match*.

-   If a request specifies both the *If-Match* and *If-Unmodified-Since* headers, the request is evaluated based on the criteria specified in *If-Match*.

-   With the exception of the two combinations of conditional headers listed above, a request may specify only a single conditional header. Specifying more than one conditional header results in status code 400 (Bad Request).

## HTTP Response Codes for Operations Supporting Conditional Headers
 Batch service returns an HTTP response code in accordance with the HTTP/1.1 protocol specification (RFC 2616).

### Read Operations
 The following table indicates the response codes returned for an unmet condition for each conditional header when the operation is a read operation. Read operations use the verbs GET or HEAD.

|Conditional header|Response code if condition has not been met|
|------------------------|-------------------------------------------------|
|*If-Match*|Precondition Failed (412)|
|*If-None-Match*|Not Modified (304)|
|*If-Modified-Since*|Not Modified (304)|
|*If-Unmodified-Since*|Precondition Failed (412)|

### Write Operations
 The following table indicates the response codes returned for an unmet condition for each conditional header when the operation is a write operation. Write operations use the verbs POST, PUT, PATCH or DELETE.

|Conditional header|Response code if condition has not been met|
|------------------------|-------------------------------------------------|
|*If-Match*|Precondition Failed (412)|
|*If-None-Match*|Precondition Failed (412)|
|*If-Modified-Since*|Precondition Failed (412)|
|*If-Unmodified-Since*|Precondition Failed (412)|

