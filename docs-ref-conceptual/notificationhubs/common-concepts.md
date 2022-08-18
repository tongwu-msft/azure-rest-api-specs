---
title: "Common concepts"
description: Learn about common concepts when developing applications that use the Azure Notification Hubs REST API.
ms.custom: ""
ms.date: 01/30/2020
ms.reviewer: ""
ms.service: "notification-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
author: "sethmanheim"
ms.author: "sethm"
manager: "femila"

---


# Common concepts
This article provides common concepts when developing applications that use the Azure Notification Hubs REST API.

> [!NOTE]
> To ensure a higher level of security, Notification Hubs will disable support for TLS versions 1.0 and 1.1 on April 30, 2020. For more information, see [Transport Layer Security (TLS)](/azure/notification-hubs/notification-hubs-tls12) in the Azure Notification Hubs documentation.


## Parse connection string
To access a notification hub, you must have two pieces of information: the **hub name**, and a **connection string**. The connection string contains information about the endpoint of your hub, and the security credentials used to access it (For SAS, it contains a rule name and a key value).

The following code parses the connection string to extract the relevant information:

``` csharp
public partial class ConnectionStringUtility
{
    public string Endpoint { get; private set; }
    public string SasKeyName { get; private set; }
    public string SasKeyValue { get; private set; }

    public ConnectionStringUtility(string connectionString)
    {
        //Parse Connectionstring
        char[] separator = { ';' };
        string[] parts = connectionString.Split(separator);
        for (int i = 0; i < parts.Length; i++)
        {
            if (parts[i].StartsWith("Endpoint"))
                Endpoint = "https" + parts[i].Substring(11);
            if (parts[i].StartsWith("SharedAccessKeyName"))
                SasKeyName = parts[i].Substring(20);
            if (parts[i].StartsWith("SharedAccessKey"))
                SasKeyValue = parts[i].Substring(16);
        }
    }
}
```

``` javascript
var parts = connectionString.split(';');
if (parts.length != 3)
throw "Error parsing connection string";

parts.forEach(function(part) {
if (part.indexOf('Endpoint') == 0) {
endpoint = 'https' + part.substring(11);
} else if (part.indexOf('SharedAccessKeyName') == 0) {
sasKeyName = part.substring(20);
} else if (part.indexOf('SharedAccessKey') == 0) {
sasKeyValue = part.substring(16);
}
});
```

## Create SAS security token

In order to authenticate using SAS, a client must specify a SAS token in the Authorization header of their requests. The token is constructed from the information extracted from the connection string and the current request that has to be authenticated. The token has the following form:

``` xml
SharedAccessSignature sig=<signature-string>&se=<expiry>&skn=<keyName>&sr=<URL-encoded-resourceURI>
```

The token refers to a keyName (to send notifications, you usually use the **DefaultFullSharedAccessSignature** property that is created automatically on all notification hubs).

The signature for the SAS token is computed using the HMAC-SHA256 of a string-to-sign value with the **PrimaryKey** property of an authorization rule. The string-to-sign value consists of a resource URI and an expiry, formatted as follows:

```
StringToSign = <resourceURI> + "\n" + expiry;
```

Use the unencoded resource URI for this operation. The resource URI is the full URI of the Service Bus resource to which access is claimed. The form is as follows:

```
http://<namespace>.servicebus.windows.net/<hubName>
```

For example:

```
http://contoso.servicebus.windows.net/myHub
```

The expiry is represented as the number of seconds since the epoch 00:00:00 UTC on 1 January 1970.

The shared access authorization rule used for signing must be configured on the entity specified by this URI. In the previous example, URI is `http://contoso.servicebus.windows.net/myHub` or `http://contoso.servicebus.windows.net`.

The URL-encoded **resourceURI** must be the same as the URI used in the string-to-sign during the computation of the signature. It should be percent-encoded and lowercase.

The following code, given a request URI, creates a SAS token. The Java version uses Apache Commons Codec and the Javascript version uses CryptoJS.

``` csharp
public partial class ConnectionStringUtility
{
    public string getSaSToken(string uri, int minUntilExpire)
    {
        string targetUri = Uri.EscapeDataString(uri.ToLower()).ToLower();

        // Add an expiration in seconds to it.
        long expiresOnDate = DateTime.Now.Ticks / TimeSpan.TicksPerMillisecond;
        expiresOnDate += minUntilExpire * 60 * 1000;
        long expires_seconds = expiresOnDate / 1000;
        String toSign = targetUri + "\n" + expires_seconds;

        // Generate a HMAC-SHA256 hash or the uri and expiration using your secret key.
        MacAlgorithmProvider macAlgorithmProvider = MacAlgorithmProvider.OpenAlgorithm(MacAlgorithmNames.HmacSha256);
        BinaryStringEncoding encoding = BinaryStringEncoding.Utf8;
        var messageBuffer = CryptographicBuffer.ConvertStringToBinary(toSign, encoding);
        IBuffer keyBuffer = CryptographicBuffer.ConvertStringToBinary(SasKeyValue, encoding);
        CryptographicKey hmacKey = macAlgorithmProvider.CreateKey(keyBuffer);
        IBuffer signedMessage = CryptographicEngine.Sign(hmacKey, messageBuffer);

        string signature = Uri.EscapeDataString(CryptographicBuffer.EncodeToBase64String(signedMessage));

        return "SharedAccessSignature sr=" + targetUri + "&sig=" + signature + "&se=" + expires_seconds + "&skn=" + SasKeyName;
    }
}
```

``` javascript
var getSelfSignedToken = function(targetUri, sharedKey, ruleId,
expiresInMins) {
targetUri = encodeURIComponent(targetUri.toLowerCase()).toLowerCase();

// Set expiration in seconds
var expireOnDate = new Date();
expireOnDate.setMinutes(expireOnDate.getMinutes() + expiresInMins);
var expires = Date.UTC(expireOnDate.getUTCFullYear(), expireOnDate
.getUTCMonth(), expireOnDate.getUTCDate(), expireOnDate
.getUTCHours(), expireOnDate.getUTCMinutes(), expireOnDate
.getUTCSeconds()) / 1000;
var tosign = targetUri + '\n' + expires;

// using CryptoJS
var signature = CryptoJS.HmacSHA256(tosign, sharedKey);
var base64signature = signature.toString(CryptoJS.enc.Base64);
var base64UriEncoded = encodeURIComponent(base64signature);

// construct autorization string
var token = "SharedAccessSignature sr=" + targetUri + "&sig="
+ base64UriEncoded + "&se=" + expires + "&skn=" + ruleId;
// console.log("signature:" + token);
return token;
};
```

