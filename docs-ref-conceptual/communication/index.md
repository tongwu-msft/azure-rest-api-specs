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

You can perform various actions against several key areas of communication services:

| Resource Groups                                                                       | Description                                                                                            |
| ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| [Communication Service](xref:management.azure.com.communication.communicationservice) | Create, update, or delete a Communication Services instance, Link a Notification Hub, regenerate keys. |
| [Communication Identity](xref:communication.communicationidentity)                    | Create, manage, and issue tokens for Communication Services Identities.                                |
| [Sms](xref:communication.sms)                                                         | Send SMS messages.                                                                                     |

### Chat

Chat currently doesn't have a contents page available, so its operations are listed here.

| Chat Area                                                                                          | Description                                                                  |
| -------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| [Add Chat Thread Members](xref:communication.chat.addchatthreadmembers.addchatthreadmembers)       | Adds thread members to a thread. If members already exist, no change occurs. |
| [Create Chat Thread](xref:communication.chat.createchatthread.createchatthread)                    | Creates a chat thread.                                                       |
| [Delete Chat Message](xref:communication.chat.deletechatmessage.deletechatmessage)                 | Deletes a message.                                                           |
| [Delete Chat Thread](xref:communication.chat.deletechatthread.deletechatthread)                    | Deletes a thread.                                                            |
| [Get Chat Message](xref:communication.chat.getchatmessage.getchatmessage)                          | Gets a message by id.                                                        |
| [Get Chat Thread](xref:communication.chat.getchatthread.getchatthread)                             | Gets a chat thread.                                                          |
| [List Chat Messages](xref:communication.chat.listchatmessages.listchatmessages)                    | Gets a list of messages from a thread.                                       |
| [List Chat Read Receipts](xref:communication.chat.listchatreadreceipts.listchatreadreceipts)       | Gets read receipts for a thread.                                             |
| [List Chat Thread Members](xref:communication.chat.listchatthreadmembers.listchatthreadmembers)    | Gets the members of a thread.                                                |
| [List Chat Threads](xref:communication.chat.listchatthreads.listchatthreads)                       | Gets the list of chat threads of a user.                                     |
| [Remove Chat Thread Member](xref:communication.chat.removechatthreadmember.removechatthreadmember) | Remove a member from a thread.                                               |
| [Send Chat Message](xref:communication.chat.sendchatmessage.sendchatmessage)                       | Sends a message to a thread.                                                 |
| [Send Chat Read Receipt](xref:communication.chat.sendchatreadreceipt.sendchatreadreceipt)          | Sends a read receipt event to a thread, on behalf of a user.                 |
| [Send Typing Notification](xref:communication.chat.sendtypingnotification.sendtypingnotification)  | Posts a typing event to a thread, on behalf of a user.                       |
| [Update Chat Message](xref:communication.chat.updatechatmessage.updatechatmessage)                 | Updates a message.                                                           |
| [Update Chat Thread](xref:communication.chat.updatechatthread.updatechatthread)                    | Updates a thread's properties.                                               |

## Extra Material

In addition to the reference material above, we have some more material below. These pages may help you utilize Azure Communication Services' REST API more easily.

- [Authentication](authentication.md) - Learn about how to authenticate your REST Requests with our Services.
- [Common Headers](headers.md) - Learn about standard headers you might see in your responses from Communication Services.
- [Error Codes](errorcodes.md) - View information about Error Codes you might see while interacting with our REST API.

## See Also

For additional information on Azure Communication Services, you can also review our other documentation sources:

- [Azure Communication Services Product Overview](https://azure.microsoft.com/services/communication-services/) - Communication Services product overview.
- [Azure Communication Services conceptual documentation](https://docs.microsoft.com/azure/communication-services/overview) - Communication Services Conceptual documentation, this documentation will provide additional information on how to use communication services, including how to use its available SDKs.
