---
title: "Message Headers and Properties"
ms.custom: ""
ms.date: "07/02/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: cc8dfa91-43e3-4e21-8425-ef471a95e922
caps.latest.revision: 12
author: "sethmanheim"
ms.author: "sethm"
manager: "timlt"
translation.priority.mt: 
  - "de-de"
  - "es-es"
  - "fr-fr"
  - "it-it"
  - "ja-jp"
  - "ko-kr"
  - "pt-br"
  - "ru-ru"
  - "zh-cn"
  - "zh-tw"
---
# Message Headers and Properties
This section describes message headers and properties.  
  
## Message headers  
 One HTTP header named `BrokerProperties` contains all the `BrokeredMessage` headers. The properties are JSON-formatted. This makes it easy to extend the `BrokeredMessage` properties. Also, it aligns to the web programming model by leveraging the web-friendly JSON format. This makes it easy to produce and consume message properties with less string parsing. The following is an example of `BrokeredMessage` headers:  
  
```  
BrokerProperties:  { “SessionId”: “{27729E1-B37B-4D29-AA0A-E367906C206E}”, “MessageId”: “{701332E1-B37B-4D29-AA0A-E367906C206E}”, “TimeToLive” : 90, “CorrelationId”: “{701332F3-B37B-4D29-AA0A-E367906C206E}”, “SequenceNumber“ : 12345, “DeliveryCount“ : 2, “To“ : "http://contoso.com“, “ReplyTo“ : "http://fabrikam.com“,  "EnqueuedTimeUtc“ : " Sun, 06 Nov 1994 08:49:37 GMT“, "ScheduledEnqueueTimeUtc“ : " Sun, 06 Nov 1994 08:49:37 GMT“}  
```  
  
 The following table illustrates how `BrokeredMessage` properties are mapped to HTTP headers.  
  
|`BrokeredMessage` (SBMP) Parts|Type|HTTP header|Accessibility|HTTP Req/Res|  
|--------------------------------------|----------|-----------------|-------------------|-------------------|  
|ContentType|string|Content-Type|get, set|Req, Res|  
|CorrelationId|string|BrokerProperties{CorrelationId}|get, set|Req, Res|  
|SessionID|string|BrokerProperties {SessionId}|get, set|Req, Res|  
|DeliveryCount|int|BrokerProperties {DeliveryCount }|get|Res|  
|LockedUntilUtc|DateTime|BrokerProperties{LockedUntil}|get|Res|  
|LockToken|Guid|BrokerProperties{LockToken}|get|Res|  
|MessageId|string|BrokerProperties{MessageId}|get, set|Res|  
|Label|string|BrokerProperties {Label}|get, set|Req, Res|  
|ReplyTo|string|BrokerProperties {ReplyTo}|get, set|Req, Res|  
|EnqueuedTimeUtc|DateTime|Date|get|Res|  
|SequenceNumber|long|BrokerProperties {SequenceNumber}|get|Res|  
|TimeToLive|TimeSpan|BrokerProperties collection {TimeToLive}|get, set|Req, Res|  
|To|string|BrokerProperties {To}|get, set|Req, Res|  
|ScheduledEnqueueTimeUtc|DateTime|BrokerProperties {ScheduledEnqueueTimeUtc}|get, set|Req, Res|  
|ReplyToSessionId|string|BrokerProperties {ReplyToSessionId}|get, set|Req, Res|  
|PartitionKey|string|BrokerProperties {PartitionKey}|get, set|Req, Res|  
  
 **Notes**  
  
-   `DateTime` headers are formatted as defined by RFC2616: [http://www.w3.org/Protocols/rfc2616/rfc2616-sec3.html#sec3.3](http://www.w3.org/Protocols/rfc2616/rfc2616-sec3.html). For example, “Sun, 06 Nov 1994 08:49:37 GMT”.  
  
-   **BrokerProperties {TimeToLive}** is the number of seconds of the **TimeSpan (double)**.  
  
-   `ExpiresAtUtc` does not have a corresponding HTTP header because it can be derived from `Date` and `BrokerProperties {TimeToLive}`.  
  
-   Message headers with a **get** accessor can only appear in the HTTP response (for example, received message). When these headers are present in the HTTP request (that is, sent message), they are silently ignored. Unrecognized HTTP headers are also silently ignored.  
  
-   If the value is malformed, an appropriate HTTP status code is returned to the client.  
  
## Message properties  
 Message properties are user-defined key-value pairs contained in `message.Properties`. For the SBMP thick client, the values are restricted to `byte`, `sbyte`, `char`, `short`, `ushort`, `int`, `uint`, `long`, `ulong`, `float`, `double`, `decimal`, `bool`, `Guid`, `string`, `Uri`, `DateTime`, `DateTimeOffset`, and `TimeSpan`.  
  
 For REST/HTTP, `Uri` and `DateTimeOffset` are not supported (if they are in the `BrokeredMessage`, they are not included in the HTTP headers). GUID types are converted to strings and `TimeSpan` types are converted to “total seconds.” Due to these conversions, the type fidelity will be lost. Any property name that corresponds to the restricted HTTP header (for example, `Connection`, `Expect`, and so on), is also excluded.  
  
 Each key-value pair in `message.Properties` will be mapped to an HTTP header in the following format. `prop` is the key name, and `value` is the string representation of the value:  
  
```  
prop_name: value  
```  
  
 The type of value is inferred. If it is surrounded with double quotes, then:  
  
-   If the content has the form of an RFC2616 date time, then the broker treats it as a `System.DateTime`.  
  
-   Otherwise, the broker removes the quotes and treats the content as a `System.String`.  
  
 If it is not surrounded with double quotes, then:  
  
1.  If the content is true or false (case-sensitive!), then the broker treats it as a `System.Boolean` with the corresponding value.  
  
2.  If the content can be parsed as an integer, then the broker treats it as a System.Int64.  
  
3.  If the content can be parsed as a floating-point number, then the broker treats it as a `System.Double`.  
  
4.  Otherwise, the broker rejects the message.  
  
 For example:  
  
```  
product: Windows 7 Ultimate  
price: 299.98  
order-time: Fri, 04 Mar 2011 08:49:37 GMT  
```  
  
## Message body  
 No conversions are performed between the HTTP request/response body stream and the `BrokerMessage.BodyStream`. Also, the `Content-Type` header from the HTTP request is preserved and returned to the message receiver to allow the application to correctly interpret the bytes in the body.  
  
 If the message is created with the SBMP thick client without a custom xml object serializer, the content type will default to “application/msbin1”, which is the `DataContractBinarySerializer`, unless the application explicitly changes it (for example, `message.ContectType=”application/mytype”`) after the message is created. This content type value is returned to the HTTP consumer. It is the responsibility of the application to decide how to deserialize the bytes in the body.  
  
 The WCF Service Bus binding sets the `ContentType` to the message encoder’s `ContentType`. For example, if a text message encoder is used, the `Content-Type` is expected to be `“application/soap+xml”`.  
  
## Message conversion  
 Conversion between an HTTP request/response and a message is performed at the HTTP messaging runtime provider. The conversion methods are augmented to include the header/properties mapping in the table earlier in this section, and to preserve the content-type of the message.