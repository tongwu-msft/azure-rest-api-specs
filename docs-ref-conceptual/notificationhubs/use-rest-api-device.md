---
title: Using REST APIs from the Device
TOCTitle: Using REST APIs from the Device
ms:assetid: dc28bdeb-67d0-4d33-9263-dee969898e1e
ms:mtpsurl: https://msdn.microsoft.com/en-us/library/Dn495631(v=Azure.100)
ms:contentKeyID: 60572136
ms.date: 08/18/2015
mtps_version: v=Azure.100
dev_langs:
- javascript
---

# Using REST APIs from the Device

 


When using the REST APIs from a mobile device, a common pattern is to store the **registrationId**s of the registrations associated with the device in local storage. This enables you to update tags and channel information with a single update call.

Because mobile connections are not always reliable, it is best to avoid creating a new registration without being able to store the **registrationId** in local storage. This can result in the device registering multiple times, causing duplicate notifications. You can achieve this by using the [Create Registration ID](dn495626\(v=azure.100\).md) and [Create or Update Registration](dn495630\(v=azure.100\).md) REST APIs.

The first API returns a **registrationId** without actually creating a registration. When the ID has been securely stored on the device storage, the device can call the [Create or Update Registration](dn495630\(v=azure.100\).md) API.


> [!IMPORTANT]
> <P>In order to keep the device local storage in sync with the hub, even in the event of loss of local storage data, it is suggested that you delete all registrations with the current channel (that is, the ChannelURI, device token, or GCM registrationId) every time local storage is not initialized.</P>



The following Javascript code creates a **registrationId** using **jQuery**:

``` javascript
var createRegistrationId = function() {
        var registrationPath = hub.hubPath + "/Registrations";
    var serverUrl = hub.endpoint + registrationPath
        + "?api-version=2015-01";

    var token = getSelfSignedToken(serverUrl,sasKeyValue,
        sasKeyName, 60);

    var deferred = $.Deferred();
    $.ajax({
        type : "POST",
        url : serverUrl,
        headers : {
            "Authorization" : token
        },
    }).done(function(data, status, response) {
        var location = response.getResponseHeader("Content-Location");
        deferred.resolve(location);
    }).fail(function(response, status, error) {
        console.log("Error: " + error);
        deferred.reject("Error: " + error);
    });
    return deferred.promise();
};
```

The create or update operation (“upsert”) is a simple **PUT** call on the returned location. You can construct the registration XML body in the same way as described in the [Using REST APIs from a Backend](dn495628\(v=azure.100\).md) section.

The following Javascript code example demonstrates an “upsert” operation:

``` javascript
var updateRegistration = function(location, registration) {
    var registrationPayload = buildCreatePayload(registration);
    var serverUrl = location;

    var token = getSelfSignedToken(serverUrl, sasKeyValue,
        sasKeyName, 60);

    var deferred = $.Deferred();
    return $.ajax({
        type : "PUT",
        url : serverUrl,
        headers : {
            "Content-Type" : "application/atom+xml",
            "Authorization" : token,
        },
        data : registrationPayload
    }).done(function(data, status, response) {
        var location = response.getResponseHeader("Content-Location");
        deferred.resolve(location);
    }).fail(function(response, status, error) {
        console.log("Error: " + error);
        deferred.reject("Error: " + error);
    });
    return deferred.promise();
};
```

