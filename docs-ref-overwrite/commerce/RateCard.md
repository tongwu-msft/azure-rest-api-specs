---
uid: management.azure.com/RateCardManagementClient/2015-06-01-preview/RateCard_Get
parameters:
    - name: api-version
      description: Two versions are available <ul><li><code>2015-06-01-preview</code> - the base version from the initial release</li><li><code>2016-08-31-preview`</code> - adds a new "MeterStatus" property to each item of the “Meters” collection, indicating whether a particular meter is “Active” or “Deprecated”</li></ul>
    - name: $filter
      description: There are 4 filter query parameters, all of which are required. Only the `eq` and `and` logical operators are supported at this time. For example <p><code>https://management.azure.com/subscriptions/{subscription-Id}/providers/Microsoft.Commerce/RateCard?api-version={api-version}&$filter=OfferDurableId eq ’{OfferDurableId}’ and Currency eq ’{Currency}’ and Locale eq ’{Locale}’ and RegionInfo eq ’{RegionInfo}’</code></p><ul><li>Set {OfferDurableId} to a valid Offer ID code (e.g., MS-AZR-0026P). See [Microsoft Azure Offer Details](http://azure.microsoft.com/support/legal/offer-details/) for more information on the list of available Offer IDs, country/region availability, and billing currency. The Offer ID parameter consists of the “MS-AZR-“ prefix, plus the Offer ID number.</li><li>Set {Currency} to the currency in which the resource rates need to be provided.</li><li>Set {Locale} to the culture in which the resource metadata needs to be localized.</li><li>Set {RegionInfo} to the 2 letter ISO code where the offer was purchased.</li></ul>
description: *content
---

Enables you to query for the resource/meter metadata and related prices used in a given subscription by Azure Offer ID, Currency, Locale, and Region.

<p> </p>

