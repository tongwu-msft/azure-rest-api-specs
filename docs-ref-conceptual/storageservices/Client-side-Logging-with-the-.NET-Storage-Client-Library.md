---
title: Client-side logging with the Azure Storage client library for .NET (REST API)
description: The Azure Storage client library for .NET enables you to log requests from within your .NET client application using the standard .NET diagnostics infrastructure.
author: pemari-msft

ms.date: 09/23/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Client-side logging with the client library for .NET

With the Azure Storage client library for .NET (version 2.1 and later), you can log Azure Storage requests from within your .NET client application by using the standard .NET diagnostics infrastructure. In this way, you can see details of the requests your client sends to Azure Storage services and the responses it receives.
  
The Azure Storage client library gives you control over which storage requests you can log, and the .NET diagnostics infrastructure gives you full control over the log data, such as where to send it. For example, you could choose to send the log data to a file or to an application for processing. In combination with Azure Storage Analytics and network monitoring, you can use client library logging to build a detailed picture of how your application interacts with Azure Storage services. For more information, see [Monitor, diagnose, and troubleshoot Azure Storage](https://go.microsoft.com/fwlink/?LinkID=510535).  
  
## How to enable client library logging  

The following example shows the system.diagnostics configuration necessary to collect and persist storage log messages to a text file. The configuration section can be added to either app.config or web.config files.

>[!Note]
> If you are using a version older than 10.0.0, use the name `Microsoft.WindowsAzure.Storage` instead of `Microsoft.Azure.Storage`.

```xml
<system.diagnostics>  
     <!--In a dev/test environment you can set autoflush to true in order to autoflush to the log file. -->  
  <trace autoflush="false">  
    <listeners>  
      ...
      <add name="storageListener" />  
    </listeners>  
  </trace>  
  <sources>  
    <source name="Microsoft.Azure.Storage">  
      <listeners>  
        <add name="storageListener"/>  
      </listeners>  
    </source>  
  </sources>  
  <switches>  
    <add name="Microsoft.Azure.Storage" value="Verbose" />  
  </switches>  
  <sharedListeners>  
    <add name="storageListener"  
      type="System.Diagnostics.TextWriterTraceListener"  
      initializeData="C:\logs\WebRole.log"
      traceOutputOptions="DateTime" />  
  </sharedListeners>  
</system.diagnostics>  
  
```

>[!NOTE]
> .NET Framework users on versions 4.6.1-4.7.1 (inclusive) may experience logging issues when using the .NET Standard 2.0 artifacts of the Azure Storage libraries, which may be automatically selected by Visual Studio's NuGet package manager. The libraries are also published as .NET Framework 4.5.2 artifacts, which do not experience these issues. For more information, read about [.NET Standard version support](https://docs.microsoft.com/dotnet/standard/net-standard#net-implementation-support).

This example configures the client library to write log messages to the physical file `C:\logs\WebRole.log`. You could also use other trace listeners such as the **EventLogTraceListener** to write to the Windows event log, or the **EventProviderTraceListener** to write trace data to the ETW subsystem.

>[!IMPORTANT]
> The full folder path for the log file must exist on the local file system. In this example, that means you must first create the `C:\logs` folder before writing logs to a file in that folder.

Additionally, you can set **autoflush** to true in order to write the log entries to the file immediately instead of buffering them. This setting could be useful in a dev/test environment with low volumes of trace messages, but in a production environment you might want to set **autoflush** to false. You use the configuration settings to enable client tracing (and to specify the level, such as **Verbose**, for all messages) for all storage operations in the client.  
  
||||  
|-|-|-|  
|Id|Log Level|Events|  
|0|Off|Nothing is logged.|  
|1|Error|If an exception can't be handled internally and is thrown to the user, it's logged as an error.|  
|2|Warning|If an exception is caught and handled internally, it's logged as a warning. Primary use case for this log level is the retry scenario, where an exception is not thrown back to the user to retry. This behavior can also happen in operations such as CreateIfNotExists, where the 404 error is handled silently.|  
|3|Informational|The following info is logged:<br /><br /> •Right after the user calls a method to start an operation, request details such as URI and client request ID are logged.<br /><br /> •Important milestones such as Sending Request Start/End, Upload Data Start/End, Receive Response Start/End, Download Data Start/End are logged to mark the timestamps.<br /><br /> •Right after the headers are received, response details such as request ID and HTTP status code are logged.<br /><br /> •If an operation fails and the storage client decides to retry, the reason for that decision is logged along with info about when the next retry will happen.<br /><br /> •All client-side timeouts are logged when a storage client decides to abort a pending request.|  
|4|Verbose|The following info is logged:<br /><br /> •String-to-sign for each request.<br /><br /> •Any extra details specific to operations (up to each operation to define and use).|  
  
 By default, the client library logs details of all storage operations at the verbosity level you specify in the configuration file. You can also limit logging to specific areas of your client application to reduce the amount of data logged and to help you find the information you need. To limit the amount of data written to the logs, you must add some code to your client application. Typically, after enabling client-side tracing in the configuration file, you then switch it off globally in code by using the **OperationContext** class. For example, you can do this in an ASP.NET MVC application in the **Application_Start** method before your application performs any storage operations:  
  
```csharp
protected void Application_Start()  
{  
    ...  
  
    // Disable Default Logging for Windows Azure Storage  
    OperationContext.DefaultLogLevel = LogLevel.Off;  
  
    // Verify that all of the tables, queues, and blob containers used in this application  
    // exist, and create any that don't already exist.  
    CreateTablesQueuesBlobContainers();  
}  
```  
  
 You can then enable tracing for the specific operations you're interested in by creating a custom **OperationContext** object that defines the logging level. Then, pass the **OperationContext** object as a parameter to the **Execute** method you use to invoke a storage operation, as in the following example:  
  
```csharp
[HttpPost]  
[ValidateAntiForgeryToken]  
public ActionResult Create(Subscriber subscriber)  
{  
    if (ModelState.IsValid)  
    {  
       ...  
        var insertOperation = TableOperation.Insert(subscriber);  
        OperationContext verboseLoggingContext = new OperationContext() { LogLevel = LogLevel.Verbose };  
        mailingListTable.Execute(insertOperation, null, verboseLoggingContext);  
        return RedirectToAction("Index");  
    }  
  
    ...  
    return View(subscriber);  
}  
  
```  
  
## Client-side log schema and sample

 The following example is an extract from the client-side log generated by the client library for an operation with a Client Request ID that includes c3aa328b. The Client Request ID is a correlation identifier that allows messages logged on the client side to be correlated with network traces and storage logs. For more information on correlation, see [Monitor, diagnose, and troubleshoot Azure Storage](https://go.microsoft.com/fwlink/?LinkID=510535). The extract includes commentary (indented and italicized) on some key information that can be observed from within the log files.  
      
 To illustrate this functionality using the first row of the following log file, the fields are:  
  
|||  
|-|-|  
|**Source**|Microsoft.Azure.Storage|  
|**Verbosity**|Information|  
|**Verbosity No**|3|  
|**Client Request ID**|c3aa328b...|  
|**Operation Text**|Starting operation with location Primary per location mode PrimaryOnly.|  
  
 `Microsoft.Azure.Storage Information: 3 : c3aa328b...: Starting operation with location Primary per location mode PrimaryOnly.`   
 *The preceding trace message shows that the [location mode](https://docs.microsoft.com/dotnet/api/microsoft.azure.storage.retrypolicies.locationmode) is set to primary only, meaning that a failed request will not be sent to a secondary location.*   
 `Microsoft.Azure.Storage Information: 3 : c3aa328b...: Starting synchronous request to https://storageaccountname.table.core.windows.net/mailinglist.`   
 *The preceding trace message shows that the request is synchronous.*   
 `Microsoft.Azure.Storage Information: 3 : c3aa328b...: Setting payload format for the request to 'Json'.`   
 *The preceding trace message shows that the response should be return formatted as JSON.*   
 `Microsoft.Azure.Storage Verbose: 4 : c3aa328b...: StringToSign = GET...Fri, 23 May 2014 06:19:48 GMT./storageaccountname/mailinglist.`   
 *The preceding trace message includes the StringToSign information, which is useful for debugging auth failures. Verbose messages also contain full request details, including operation type and request parameters.*   
 `Microsoft.Azure.Storage Information: 3 : c3aa328b...: Waiting for response.`   
 *The preceding trace message shows that the request has been sent and the client is awaiting a response.*   
 `Microsoft.Azure.Storage Information: 3 : c3aa328b...: Response received. Status code = 200, Request ID = 417db530-853d-48a7-a23c-0c8d5f728178, Content-MD5 = , ETag =`   
 *The preceding trace message shows that the response has been received and its http status code.*   
 `Microsoft.Azure.Storage Information: 3 : c3aa328b...: Response headers were processed successfully, proceeding with the rest of the operation.`   
 `Microsoft.Azure.Storage Information: 3 : c3aa328b...: Processing response body.`   
 `Microsoft.Azure.Storage Information: 3 : c3aa328b...: Retrieved '8' results with continuation token ''.`   
 *The preceding trace message shows that 8 results were retrieved and no continuation token was provided, meaning there are no more results for this query.*   
 `Microsoft.Azure.Storage Information: 3 : c3aa328b...: Operation completed successfully.`   
 *The preceding trace message shows that the operation completed successfully.*  
  
 The following two verbose (level 4) log entries show a HEAD and a DELETE request and illustrate the detailed information in the **Operation Text** field:   
`Microsoft.Azure.Storage Verbose: 4 : 07b26a5d...: StringToSign = HEAD............x-ms-client-request-id:07b26a5d....x-ms-date:Tue, 03 Jun 2014 10:33:11 GMT.x-ms-version:2014-02-14./storageaccountname/azuremmblobcontainer.restype:container.`  
`Microsoft.Azure.Storage Verbose: 4 : 07b26a5d...: StringToSign = DELETE............x-ms-client-request-id:07b26a5d....x-ms-date:Tue, 03 Jun 2014 10:33:12 GMT.x-ms-version:2014-02-14./storageaccountname/azuremmblobcontainer.restype:container.`  
*The preceding trace message shows the OperationText field within verbose trace messages, including detailed information related to a specific request. These details include the HTTP operation type (for example, HEAD, DELETE, POST), the client request ID, the timestamp, SDK version, and additional operation-specific data.*
