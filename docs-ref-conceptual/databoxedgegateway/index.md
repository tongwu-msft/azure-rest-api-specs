---
title: Data Box Edge/Data Box Gateway REST API | Microsoft Docs
description: Learn how Azure Data Box Edge and Azure Data Box Gateway are on-premises storage solutions that allow you to send the data over the network to Azure.
ms.date: 03/19/2019
ms.service: databox
ms.topic: reference
ms.devlang: rest-api
author: alkohli
ms.author: alkohli
manager: twooley
---

# Azure Data Box Edge and Azure Data Box Gateway REST API

Azure Data Box Edge and Azure Data Box Gateway are on-premises storage solutions that allow you to send the data over the network to Azure.
Data Box Gateway is a virtual device based on a virtual machine provisioned in your virtualized environment or hypervisor. 
Data Box Edge uses a physical device supplied by Microsoft to accelerate the secure data transfer. 
Data Box Edge has all the capabilities of Data Box Gateway and is additionally equipped with AI-enabled edge computing capabilities that help analyze, process, or filter data as it moves to Azure.

For each of the solutions, the device resides in your premises and you write data to it using the NFS and SMB protocols. 
The device then transfers your data to Azure block blob, page blob, or Azure Files. 

REST APIs are now available for both Data Box Edge and Data Box Gateway and can be used to manage these devices. Most management operations for the devices such as creating a resource, deleting a resource, or monitoring the device can also be done via the REST APIs.
