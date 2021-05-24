---
title: Azure Data Catalog limitations
description: Understand the limits when using the Azure Data Catalog REST API.
author: jasonwhowell
ms.author: jasonh
ms.reviewer: jasonwhowell
ms.service: data-catalog
ms.topic: reference
ms.date: 08/08/2019
---

# Data Catalog limitations

The Data Catalog Assets REST API has the following limitations:  
  
- Maximum annotation or asset root size in bytes: 256 K.  
- Maximum number of annotations on an asset: 3000.  
- Maximum overall size of asset and its annotations: 8 MB.  
- Transactions are scoped to a single asset and its annotations. Transcations cannot span assets.  
- Delete of an asset deletes all annotations associated with that asset. A delete of annotation deletes all annotations beneath that annotation.  
- Maximum length of the value for the "key" property (applicable only to non-singleton annotations): 256.