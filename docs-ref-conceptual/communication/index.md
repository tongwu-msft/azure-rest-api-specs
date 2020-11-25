---
title: Azure Communication Services REST API
description: Azure Communication Services REST API
author: mikben
ms.author: mikben
ms.manager: jken
ms.date: 10/06/2020
ms.topic: reference
ms.service: azure-communication-services
ms.devlang: rest-api
---
# Azure Communication Services

Azure Communication Services allows you to easily add real-time multimedia voice, video, and telephony-over-IP communications features to your applications. The Communication Services client libraries also allow you to add chat and SMS functionality to your communications solutions.

The Azure Communication Services REST API provides programmatic access to resources and items within Communication Services.

## Communication Services Resource Groups

TODO: Chat has no Overview page, due to its multi-folder listings, how can we make it have one?
You can perform various actions against several key areas of communication services:

| Resource Groups                                                                       | Description                                                                                            |
| ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| [Chat](xref:communication.chat)                                                       | Create, manage, and participate in Chat Threads within Communication Services.                         |
| [Communication Service](xref:management.azure.com.communication.communicationservice) | Create, update, or delete a Communication Services instance, Link a Notification Hub, regenerate keys. |
| [Communication Identity](xref:communication.communicationidentity)                    | Create, manage, and issue tokens for Communication Services Identities.                                |
| [Sms](xref:communication.sms)                                                         | Send SMS messages.                                                                                     |

## Additional Material

In addition to the reference material above, we have some additional available information:
TODO: Write these pages

- [Authentication](authentication.md) - Learn about how to authenticate your REST Requests with our Services.
- [Common Headers](headers.md) - Learn about standard headers you might see in your responses from Communication Services.
- [Error Codes](errorcodes.md) - View information about Error Codes you might see while interacting with our REST API.

## See Also

For additional information on Azure Communication Services, you can also review our other documentation sources:

- [Azure Communication Services Product Overview](https://azure.microsoft.com/services/communication-services/) - Communication Services product overview.
- [Azure Communication Services conceptual documentation](https://docs.microsoft.com/azure/communication-services/overview) - Communication Services Conceptual documentation, this documentation will provide additional information on how to use communication services, including how to use its available SDKs.
