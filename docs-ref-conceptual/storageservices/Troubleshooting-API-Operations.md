---
title: Troubleshooting API operations (REST API) - Azure Storage
description: Troubleshooting API operations.
author: pemari-msft
ms.date: 09/30/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Troubleshooting API operations

The following sections offer troubleshooting tips for API operations. 
  
## Failed request tracing  

The development environment supports the use of a feature of Internet Information Services (IIS) 7.0 to log information about requests. The feature is called *failed request tracing*, and it produces detailed trace logs according to filters established within a web role’s configuration.  
  
### Logging destination  

Azure outputs trace log files to the default IIS directory for failed request logs. By default, this directory is *%SystemDrive%\inetpub\logs\FailedReqLogFiles*.  
  
### Enabling tracing  

Each web role must enable tracing by using rules placed in the project's *web.config* file. To enable tracing, place the following in the `system.webServer` section of your *web.config* file:  
  
```  
<tracing>  
  <traceFailedRequests>  
    <add path="*">  
      <traceAreas>  
        <add provider="ASP" verbosity="Verbose" />  
        <add provider="ASPNET" areas="Infrastructure,Module,Page,AppServices" verbosity="Verbose" />  
        <add provider="ISAPI Extension" verbosity="Verbose" />  
        <add provider="WWW Server" areas="Authentication,Security,Filter,StaticFile,CGI,Compression,Cache,RequestNotifications,Module" verbosity="Verbose" />  
      </traceAreas>  
      <failureDefinitions statusCodes="400-599" />  
    </add>  
  </traceFailedRequests>  
</tracing>  
```  
  
To disable tracing, remove this section from the *web.config* file.  
  
## The x-ms-request-id header  

Every request made against Azure Storage returns a response header named `x-ms-request-id`. This header contains an opaque value that uniquely identifies the request.  
  
If a request is consistently failing, and you have verified that the request is properly formulated, you can use this value to report the error to Microsoft. In your report, include the following information:

- The value of `x-ms-request-id`.
- The approximate time that the request was made.
- The Storage service against which the request was made.
- The type of operation that the request attempted.  
  
## See also  

[Storage services REST](Azure-Storage-Services-REST-API-Reference.md)