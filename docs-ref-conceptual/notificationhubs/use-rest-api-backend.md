---
title: "Use REST APIs from a backend"
description: Use this API reference documentation to use REST APIs from a backend.
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


# Use REST APIs from a backend
As explained in [Registration management](https://docs.microsoft.com/azure/notification-hubs/notification-hubs-push-notification-registration-management), usually the application back-end sends notifications and might perform registrations management. Because there is already a REST wrapper for Node.js in the Azure SDK for Node, this section shows examples in Java.

## Sending notifications

The REST API for sending notifications is a simple POST on /yourHub/messages, with special headers. When sending notifications in a platform-native format, the body is the platform-specific body to be sent. The additional headers are:

  - **ServiceBusNotification-Format**: Specifies that the platform (if sending a native notification) or “template” is to send a template notification.

  - **ServiceBusNotification-Tags** (optional): Specifies the tag (or tag expression) defining the targeted set of registrations. If this header is not present, the notification hub broadcasts to all registrations.

Other headers are supported for platform-specific functionality, as specified in the [Notification Hubs REST APIs](notification-hubs-rest.md) documentation.

The following Java code sends a native notification to Windows Store apps (using Apache HttpClient):

``` java
public Notification createWindowsNotification(String body) {
    Notification n = new Notification();
    n.body = body;

    n.headers.put("ServiceBusNotification-Format", "windows");

    if (body.contains("<toast>"))
        n.headers.put("X-WNS-Type", "wns/toast");
    if (body.contains("<tile>"))
        n.headers.put("X-WNS-Type", "wns/tile");
    if (body.contains("<badge>"))
        n.headers.put("X-WNS-Type", "wns/badge");

    if (body.startsWith("<")) {
        n.contentType = ContentType.APPLICATION_XML;
    }

    return n;
}

public void sendNotification(Notification notification, String tagExpression) {
    HttpPost post = null;
    try {
        URI uri = new URI(endpoint + hubPath + "/messages"+APIVERSION);
        post = new HttpPost(uri);
        post.setHeader("Authorization", generateSasToken(uri));

        if (tagExpression != null && !"".equals(tagExpression)) {
            post.setHeader("ServiceBusNotification-Tags", tagExpression);
    }

        for (String header: notification.getHeaders().keySet()) {
            post.setHeader(header, notification.getHeaders().get(header));
        }

        post.setEntity(new StringEntity(notification.getBody()));
        HttpResponse response = httpClient.execute(post);

        if (response.getStatusLine().getStatusCode() != 201) {
            String msg = "";
            if (response.getEntity() != null && response.getEntity().getContent() != null) {
                msg = IOUtils.toString(response.getEntity().getContent());
            }
            throw new RuntimeException("Error: " + response.getStatusLine() + " body: "+msg);
        }
    } catch (Exception e) {
        throw new RuntimeException(e);
    } finally {
        if (post != null) post.releaseConnection();
    }
}
```

Similarly, the following code sends a template notification:

``` java
public Notification createTemplateNotification(Map<String, String> properties) {
    Notification n = new Notification();
    StringBuffer buf = new StringBuffer();
    buf.append("{");
    for (Iterator<String> iterator = properties.keySet().iterator(); iterator.hasNext();) {
        String key = iterator.next();
        buf.append("\""+ key + "\":\""+properties.get(key)+"\"");
        if (iterator.hasNext()) buf.append(",");
    }
    buf.append("}");
    n.body = buf.toString();

    n.contentType = ContentType.APPLICATION_JSON;

    n.headers.put("ServiceBusNotification-Format", "template");

    return n;
}
```

For more information about sending notifications to other platforms, see [Notification Hubs REST APIs](notification-hubs-rest.md).

## Creating and updating registrations

Creating and updating registrations requires the serialization and deserialization of the registration XML format. The [Create a registration](create-registration.md) API topic shows the XML formats for creating different kinds of registrations (native and template for every platform).


> [!IMPORTANT]
> <P>The XML elements must be in the exact order shown.</P>



The following is an example of creating a registration in Java, using simple string concatenations to create the registration XML payload, and [Apache Digester](http://commons.apache.org/proper/commons-digester/) to parse the result. As previously noted, any XML serialization or deserialization approach works.

``` java
public Registration createRegistration(Registration registration) {
    HttpPost post = null;
    try {
        URI uri = new URI(endpoint + hubPath + "/registrations"+APIVERSION);
        post = new HttpPost(uri);
        post.setHeader("Authorization", generateSasToken(uri));

        StringEntity entity = new StringEntity(registration.getXml(),ContentType.APPLICATION_ATOM_XML);
        entity.setContentEncoding("utf-8");
        post.setEntity(entity);
        HttpResponse response = httpClient.execute(post);

        if (response.getStatusLine().getStatusCode() != 200)
            throw new RuntimeException("Error: " + response.getStatusLine());

        return Registration.parse(response.getEntity().getContent());
    } catch (Exception e) {
        throw new RuntimeException(e);
    } finally {
        if (post != null) post.releaseConnection();
    }
}
```

The getXml() method for native Windows registrations is as follows:

``` java
private static final String WNS_NATIVE_REGISTRATION = "<?xml version=\"1.0\" encoding=\"utf-8\"?><entry xmlns=\"http://www.w3.org/2005/Atom\"><content type=\"application/xml\"><WindowsRegistrationDescription xmlns:i=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns=\"http://schemas.microsoft.com/netservices/2010/10/servicebus/connect\">{0}<ChannelUri>{1}</ChannelUri></WindowsRegistrationDescription></content></entry>";

public String getXml() {
    String xml = WNS_NATIVE_REGISTRATION.replaceFirst("\\{1\\}", channelUri.toString());
    xml = xml.replaceFirst("\\{0\\}", getTagsXml());
    return xml.toString();
}
```

You can easily derive the methods for other registration types from the examples in the [Create a registration](create-registration.md) API topic.

The response contains the result of the creation, including read-only properties such as **RegistrationId**, **ETag**, and **ExpirationTime**. The following code example parses the result using [Apache Digester](http://commons.apache.org/proper/commons-digester/):

``` java
public static Registration parse(InputStream content) throws IOException,
            SAXException {
    Digester digester = new Digester();
    digester.addObjectCreate("*/WindowsRegistrationDescription",
                WindowsRegistration.class);

    digester.addCallMethod("*/RegistrationId", "setRegistrationId", 1);
    digester.addCallParam("*/RegistrationId", 0);
    digester.addCallMethod("*/ETag", "setEtag", 1);
    digester.addCallParam("*/ETag", 0);
    digester.addCallMethod("*/ChannelUri", "setChannelUri", 1);
    digester.addCallParam("*/ChannelUri", 0);
    digester.addCallMethod("*/Tags", "setTagsFromString", 1);
    digester.addCallParam("*/Tags", 0);
    digester.addCallMethod("*/BodyTemplate", "setBodyTemplate", 1);
    digester.addCallParam("*/BodyTemplate", 0);
    digester.addCallMethod("*/WnsHeader", "addHeader", 2);
    digester.addCallParam("*/WnsHeader/Header", 0);
    digester.addCallParam("*/WnsHeader/Value", 1);

    return digester.parse(content);
}
```

The **Create** call returns a **registrationId**, which is used to retrieve, update, or delete the registration.


> [!NOTE]
> <P>The preceding snippet assumes that there is a subclass of Registration called WindowsRegistrationDescription.</P>



You can update a registration by issuing a **PUT** call on **/yourhub/registrations/{registrationId}**. The **If-Match** header is used to provide an **ETag** (supporting optimistic concurrency) or simply a “\*” to always overwrite. If the **If-Match** header is not present, the operation performs an “upsert” (always overwriting the current registration, or creating one on the provided **registrationId** if it is not present). For example:

``` java
public Registration updateRegistration(Registration registration) {
    HttpPut put = null;
    try {
        URI uri = new URI(endpoint + hubPath + "/registrations/"+registration.getRegistrationId()+APIVERSION);
        put = new HttpPut(uri);
        put.setHeader("Authorization", generateSasToken(uri));
        put.setHeader("If-Match", registration.getEtag()==null?"*":"W/\""+registration.getEtag()+"\"");

        put.setEntity(new StringEntity(registration.getXml(),ContentType.APPLICATION_ATOM_XML));
        HttpResponse response = httpClient.execute(put);

        if (response.getStatusLine().getStatusCode() != 200)
            throw new RuntimeException("Error: " + response.getStatusLine());

        return Registration.parse(response.getEntity().getContent());
    } catch (Exception e) {
        throw new RuntimeException(e);
    } finally {
        if (put != null) put.releaseConnection();
    }
}
```

[Delete a registration](delete-registration.md) is a similar operation.

## Retrieving registrations

When retrieving a registration, issue a GET call on the /registrations/{registrationId}. You retrieve a collection of registrations as specified in the following REST APIs:

  - [Read all registrations of a channel](read-all-registrations-channel.md)
  - [Read all Registrations with a tag](read-all-registrations-tag.md)
  - [Read all registrations](read-all-registrations.md)

You then have the option to specify a **$top** parameter, which limits the number of registrations returned. If more registrations are present for that query, then an **X-MS-ContinuationToken** header is returned, which you can pass to subsequent calls in order to continue retrieving the remaining registrations. Also note that the format of the body is now an XML Atom feed, as shown in the previously mentioned API topics.

The following Java code from **minterastlib** retrieves all registrations with a tag;

``` java
    private CollectionResult retrieveRegistrationByTag() {
        String queryUri = endpoint + hubPath + "/tags/"+tag+"/registrations"+APIVERSION;
    HttpGet get = null;
        try {
            URI uri = new URI(queryUri);
            get = new HttpGet(uri);
            get.setHeader("Authorization", generateSasToken(uri));
    
            HttpResponse response = httpClient.execute(get);
    
            if (response.getStatusLine().getStatusCode() != 200)
                throw new RuntimeException("Error: " + response.getStatusLine());
    
            CollectionResult result = Registration.parseRegistrations(response.getEntity().getContent());
            Header contTokenHeader = response.getFirstHeader("X-MS-ContinuationToken");
            if (contTokenHeader !=null) {
                result.setContinuationToken(contTokenHeader.getValue());
            }
            return result;
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            if (get != null) get.releaseConnection();
        }
    }
```

In this code, a CollectionResult encapsulates a set of registrations along with an optional continuation token.

The following code uses [Apache Digester](http://commons.apache.org/proper/commons-digester/):

``` java
public static CollectionResult parseRegistrations(InputStream content)
            throws IOException, SAXException {
    Digester digester = new Digester();

    // add all rules for parsing single registrations
    digester.addObjectCreate("feed", CollectionResult.class);
    digester.addSetNext("*/WindowsRegistrationDescription", "addRegistration");
    // add rules for other types of registrations (if required)

    return digester.parse(content);
}
```

