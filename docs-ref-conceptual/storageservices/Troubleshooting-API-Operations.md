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

The following sections offer troubleshooting tips for API operations:  
  
 [Failed Request Tracing](#failed-request-tracing)  
  
 [The x-ms-request-id Header](#the-x-ms-request-id-header)  
  
## Failed Request Tracing  
 The development environment supports the use of the Internet Information Services (IIS) 7.0 Failed Request Tracing feature to log information about requests. Failed Request Tracing produces detailed trace logs according to filters established within a web role’s configuration.  
  
### Logging Destination  
 Windows Azure outputs trace log files to the default IIS directory for failed request logs. This directory by default is %SystemDrive%\inetpub\logs\FailedReqLogFiles.  
  
### Enabling Tracing  
 Each web role must enable tracing by using rules placed in the project's web.config file. To enable tracing, place the following in the `system.webServer` section of your web.config file:  
  
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
  
 To disable tracing, remove this section from the web.config file.  
  
## The x-ms-request-id Header  
 Every request made against the storage services returns a response header named `x-ms-request-id`. This header contains an opaque value that uniquely identifies the request.  
  
 If a request is consistently failing and you have verified that the request is properly formulated, you may use this value to report the error to Microsoft. In your report, include the value of `x-ms-request-id`, the approximate time that the request was made, the storage service against which the request was made, and the type of operation that the request attempted.  
  
## See Also  
 [Storage Services REST](Azure-Storage-Services-REST-API-Reference.md)
