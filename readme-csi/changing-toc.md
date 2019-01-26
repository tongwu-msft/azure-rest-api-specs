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

## Changing the toc.md

Once you locate your toc.md, realize this is a shared file with all other services. If you are changing child node names or moving items up and down the TOC, be careful to use the appropriate heading, `##`. After you change the heading indentation (H3 -> H4 or H4 -> H3), test view the built page. If the nodes you touched are gone or in the wrong place, make sure you added the correct number of `#` for the indentation you need. 