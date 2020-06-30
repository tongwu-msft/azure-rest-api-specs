# Changing the TOC

Building the master TOC involved several files for your service or product. You may need to change several files to get the correct TOC. 

## mapping.json
Main correlation between files and service/product. File your doc set in this file and make note of the `service_toc` value. The following example shows the single TOC to manage the TOC child node for **Advisor**. A service has only 1 main TOC but it may be in the `docs-ref-conceptual` or `docs-ref-autogen`. 

```json
      "services": [
        {
          "toc_title": "Advisor",
          "url_group": "advisor",
          "service_index": "docs-ref-conceptual/advisor/index.md",
          "service_toc": "docs-ref-conceptual/advisor/toc.md",
          "swagger_files": [
            {
              "source": "azure-rest-api-specs/specification/advisor/resource-manager/Microsoft.Advisor/stable/2017-03-31/advisor.json"
            }
          ]
        },
```
