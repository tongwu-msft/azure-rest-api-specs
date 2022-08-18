---
title: "Use REST APIs from a device"
description: Use this API reference documentation to use REST APIs from a device.
ms.custom: ""
ms.date: 04/05/2019
ms.reviewer: ""
ms.service: "notification-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
author: "spelluru"
ms.author: "spelluru"
manager: "timlt"

---


# Use REST APIs from a Device
When using the REST APIs from a mobile device, a common pattern is to store the **registrationId**s of the registrations associated with the device in local storage. It enables you to update tags and channel information with a single update call.

Because mobile connections are not always reliable, it is best to avoid creating a new registration without being able to store the **registrationId** in local storage. It can result in the device registering multiple times, causing duplicate notifications. You can achieve it by using the [Create a registration ID](create-registration-id.md) and [Create or update a registration](create-update-registration.md) REST APIs.

The first API returns a **registrationId** without actually creating a registration. When the ID has been securely stored on the device storage, the device can call the [Create or update a registration](create-update-registration.md) API.


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

The create or update operation (“upsert”) is a simple **PUT** call on the returned location. You can construct the registration XML body in the same way as described in the [Using REST APIs from a backend](use-rest-api-backend.md) section.

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

