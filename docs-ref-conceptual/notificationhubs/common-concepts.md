---
title: "Common concepts"
ms.custom: ""
ms.date: "2019-04-05"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "notification-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
author: "spelluru"
ms.author: "spelluru"
manager: "timlt"

---


# Common concepts

 


## Parse Connection String

In order to access a notification hub, you must have two pieces of information: the hub name (can be a path such as “a/b/c”), and a connection string. The connection string contains information about the endpoint of your hub, and the security credentials used to access it (For SAS, it contains a rule name and a key value).

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

    String[] parts = connectionString.split(";");
    if (parts.length != 3)
    throw new RuntimeException("Error parsing connection string: "
    + connectionString);
    
    for (int i = 0; i < parts.length; i++) {
    if (parts[i].startsWith("Endpoint")) {
    this.endpoint = "https" + parts[i].substring(11);
    } else if (parts[i].startsWith("SharedAccessKeyName")) {
    this.SasKeyName = parts[i].substring(20);
    } else if (parts[i].startsWith("SharedAccessKey")) {
    this.SasKeyValue = parts[i].substring(16);
    }
    }

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

## Create SAS Security Token

In order to authenticate using SAS, a client must specify a SAS token in the Authorization header of their requests. The token is constructed from the information extracted from the connection string and the current request that has to be authenticated. The token has the following form:

``` xml
SharedAccessSignature sig=<signature-string>&se=<expiry>&skn=<keyName>&sr=<URL-encoded-resourceURI>
```

The token refers to a keyName (to send notifications, you usually use the **DefaultFullSharedAccessSignature** property that is created automatically on all notification hubs).

The signature for the SAS token is computed using the HMAC-SHA256 of a string-to-sign value with the **PrimaryKey** property of an authorization rule. The string-to-sign value consists of a resource URI and an expiry, formatted as follows:

    StringToSign = <resourceURI> + "\n" + expiry;

Use the unencoded resource URI for this operation. The resource URI is the full URI of the Service Bus resource to which access is claimed. The form is as follows:

    http://<namespace>.servicebus.windows.net/<hubName>

For example:

    http://contoso.servicebus.windows.net/myHub

The expiry is represented as the number of seconds since the epoch 00:00:00 UTC on 1 January 1970.

The shared access authorization rule used for signing must be configured on the entity specified by this URI. In the previous example, URI is http://contoso.servicebus.windows.net/myHub or http://contoso.servicebus.windows.net.

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

    private String generateSasToken(URI uri) {
    String targetUri;
    try {
    targetUri = URLEncoder
    .encode(uri.toString().toLowerCase(), "UTF-8")
    .toLowerCase();
    
    long expiresOnDate = System.currentTimeMillis();
    int expiresInMins = 60; // 1 hour
    expiresOnDate += expiresInMins * 60 * 1000;
    long expires = expiresOnDate / 1000;
    String toSign = targetUri + "\n" + expires;
    
    // Get an hmac_sha1 key from the raw key bytes
    byte[] keyBytes = SasKeyValue.getBytes("UTF-8");
    SecretKeySpec signingKey = new SecretKeySpec(keyBytes, "HmacSHA256");
    
    // Get an hmac_sha1 Mac instance and initialize with the signing key
    Mac mac = Mac.getInstance("HmacSHA256");
    mac.init(signingKey);
    // Compute the hmac on input data bytes
    byte[] rawHmac = mac.doFinal(toSign.getBytes("UTF-8"));
    
    // using Apache commons codec for base64
    String signature = URLEncoder.encode(
    Base64.encodeBase64String(rawHmac), "UTF-8");
    
    // construct authorization string
    String token = "SharedAccessSignature sr=" + targetUri + "&sig="
    + signature + "&se=" + expires + "&skn=" + SasKeyName;
    return token;
    } catch (Exception e) {
    throw new RuntimeException(e);
    }
    }

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

