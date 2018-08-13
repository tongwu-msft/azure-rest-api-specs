---
title: Azure Data Catalog limitations
description: Understand the limits when using the Azure Data Catalog REST API.
ms.date: 11/09/2017
author: steelanddata
ms.author: maroche
ms.reviewer: jasonwhowell
ms.service: data-catalog
ms.topic: reference
ms.assetid: 84c628b8-c98e-4d2e-a447-04fbff75256b
translation.priority.mt: 
  - de-de
  - es-es
  - fr-fr
  - it-it
  - ja-jp
  - ko-kr
  - pt-br
  - ru-ru
  - zh-cn
  - zh-tw
---
# Data Catalog limitations
The Data Catalog Assets REST API has the following limitations:  
  
-   Maximum annotation or asset root size in bytes: 256 K.  
-   Maximum number of annotations on an asset: 3000.  
-   Maximum overall size of asset and its annotations: 8 MB.  
-   Transactions are scoped to a single asset and its annotations. Transcations cannot span assets.  
-   Delete of an asset deletes all annotations associated with that asset. A delete of annotation deletes all annotations beneath that annotation.  
-   Maximum length of the value for the "key" property (applicable only to non-singleton annotations): 256.