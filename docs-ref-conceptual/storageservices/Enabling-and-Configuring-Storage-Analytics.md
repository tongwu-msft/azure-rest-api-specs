---
title: "Enabling and Configuring Storage Analytics"
ms.custom: na
ms.date: 2017-01-30
ms.prod: azure
ms.reviewer: na
ms.service: storage
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.assetid: 07f9a76c-8a60-4153-8ccf-770642053c41
caps.latest.revision: 17
author: tamram
manager: carolz
translation.priority.mt:
  - de-de
  - es-es
  - fr-fr
  - it-it
  - ja-jp
  - ko-kr
  - pt-br
  - ru-ru
  - zh-cn
  - zh-tw
---
# Enabling and Configuring Storage Analytics

Storage Analytics metrics are enabled by default for new storage accounts. You can enable logging and configure both metrics and logging in the [Azure portal](https://portal.azure.com/); for details, see [Monitor a storage account in the Azure portal](/azure/storage/storage-monitor-storage-account). You can also enable Storage Analytics programmatically via the REST API or the client library. Use the `Set Service Properties` operation for an individual service to enable Storage Analytics.  

> [!NOTE]
> Storage Analytics metrics are available for the Blob, Queue, Table, and File services.  
>   
> Storage Analytics logging is available for the Blob, Queue, and Table services. However, premium storage account is not supported.
>

 The following example enables Storage Analytics for the Table service of a fictional account named *myaccount*.  

> [!IMPORTANT]
> Although hourly metrics are enabled by default for new storage accounts, minute metrics must be enabled programmatically. You can also use [PowerShell](/powershell/storage/azure.storage/v2.5.0/set-azurestorageservicemetricsproperty) and the [Azure CLI 2.0](/cli/azure/storage/metrics) to enable minute metrics.
>

1.  Configure your request URI and headers to match the following examples. The HTTP method is PUT, and you must apply an authentication scheme to sign the request. For more information about signing your request, see [Authentication for the Azure Storage Services](authorization-for-the-azure-storage-services.md).  

    ```  
    PUT https://myaccount.table.core.windows.net/?restype=service&comp=properties HTTP/1.1  
    x-ms-version: 2013-08-15  
    x-ms-date: Wed, 23 Oct 2013 04:28:19 GMT  
    Authorization: SharedKey  
    myaccount:Z1lTLDwtq5o1UYQluucdsXk6/iB7YxEu0m6VofAEkUE=  
    Host: myaccount.table.core.windows.net  
    ```  

2.  Your request also needs a request body, consisting of XML that the storage service will process and use to configure Storage Analytics. The following example enables logging for delete and write requests and sets a log retention policy of 7 days. It also enables hourly and minute metrics, excludes API-level summary statistics, and sets a metrics data retention policy of 7 days.  

    ```xml  
    <?xml version="1.0" encoding="utf-8"?>  
    <StorageServiceProperties>  
        <Logging>  
            <Version>1.0</Version>  
                  <Delete>true</Delete>  
            <Read>false</Read>  
            <Write>true</Write>  
            <RetentionPolicy>  
                <Enabled>true</Enabled>  
                <Days>7</Days>  
            </RetentionPolicy>  
        </Logging>  
        <HourMetrics>  
            <Version>1.0</Version>  
            <Enabled>true</Enabled>  
            <IncludeAPIs>false</IncludeAPIs>  
            <RetentionPolicy>  
                <Enabled>true</Enabled>  
                <Days>7</Days>  
            </RetentionPolicy>  
        </HourMetrics>  
        <MinuteMetrics>  
            <Version>1.0</Version>  
            <Enabled>true</Enabled>  
            <IncludeAPIs>false</IncludeAPIs>  
            <RetentionPolicy>  
                <Enabled>true</Enabled>  
                <Days>7</Days>  
            </RetentionPolicy>  
        </MinuteMetrics>  
    ...
    </StorageServiceProperties>  
    ```

3.  When this request is sent, it will receive a response that will indicate whether or not Storage Analytics was configured. If the response has an HTTP status code of 202 (Accepted), your Storage Analytics settings have been updated. The following example response indicates that our settings were updated:  

    ```  
    HTTP/1.1 202 Accepted  
    Connection: Keep-Alive  
    Transfer-Encoding: chunked  
    Date: Wed, 23 Oct 2013 04:28:20 GMT  
    Server: Windows-Azure-Table/1.0 Microsoft-HTTPAPI/2.0  
    x-ms-request-id: cb939a31-0cc6-49bb-9fe5-3327691f2a30  
    x-ms-version: 2013-08-15  
    ```  

 After you have enabled Storage Analytics with your initial configuration, you can always get your current settings by calling the [Get Blob Service Properties](Get-Blob-Service-Properties.md), [Get Table Service Properties](Get-Table-Service-Properties.md), or [Get Queue Service Properties](Get-Queue-Service-Properties.md) operation.  

## Updating Storage Analytics  
 To change Storage Analytics settings for a storage service, call the `Set Service Properties` operation again. Ensure that your new XML request body retains your desired configuration options, such as enabling/disabling Storage Analytics and/or a retention policy for the service. Each time one of these operations is called, it changes the applicable service’s settings immediately.  

## See Also  
 [Setting a Storage Analytics Data Retention Policy](Setting-a-Storage-Analytics-Data-Retention-Policy.md)   
 [Set Blob Service Properties](Set-Blob-Service-Properties.md)   
 [Get Blob Service Properties](Get-Blob-Service-Properties.md)   
 [Set Table Service Properties](Set-Table-Service-Properties.md)   
 [Get Table Service Properties](Get-Table-Service-Properties.md)   
 [Set Queue Service Properties](Set-Queue-Service-Properties.md)   
 [Get Queue Service Properties](Get-Queue-Service-Properties.md)   
 [Set File Service Properties](Set-File-Service-Properties.md)   
 [Get File Service Properties](Get-File-Service-Properties.md)
