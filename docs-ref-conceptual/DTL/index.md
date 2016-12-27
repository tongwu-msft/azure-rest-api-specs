---
ms.assetid: afbc721a-55eb-4f74-9034-bd15f469f041
ms.title: Azure DevTest Labs
ms.service: devtest-lab
author: steved0x
ms.author: sdanie
ms.manager: douge
---


# Azure DevTest Labs

Azure DevTest Labs is a service that helps developers and testers quickly create environments in Azure while minimizing waste and controlling cost. You can test the latest version of your application by quickly provisioning Windows and Linux environments using reusable templates and artifacts. Easily integrate your deployment pipeline with DevTest Labs to provision on-demand environments. Scale up your load testing by provisioning multiple test agents, and create pre-provisioned environments for training and demos.

## REST Operation Groups

| Resource Groups                     | Description                                                                                                          |
|-------------------------------------|----------------------------------------------------------------------------------------------------------------------|
| [Artifact](./artifact)              | Provides operations for working with artifacts, including generating a Resource Management template for an artifact. |
| [Artifact Source](./artifactsource) | Provides operations for managing artifact sources.                                                                   |
| [Cost](./cost)                      | Lists the costs for a lab.                                                                                           |
| [Custom Image](./customimage)       | Provides operations for creating and managing custom images.                                                         |
| [Formula](./formula)                | Provides operations for managing formulas.                                                                           |
| [Gallery Image](./galleryimage)     | Lists the gallery images for a lab.                                                                                  |
| [Lab](./lab)                        | Provides operations for managing labs.                                                                               |
| [Policy](./policy)                  | Provides operations for managing a lab's policies.                                                                            |
| [Policy Set](./policyset)           | Evaluates the lab policy.                                                                                            |
| [Schedule](./schedule)              | Provides operations for managing schedules.                                                                          |
| [Virtual Machine](./virtualmachine) | Provides operations for adding artifacts to and managing a lab's virtual machines.                                   |
| [Virtual Network](./virtualnetwork) | Provides operations for managing a lab's virtual networks.                                                           |   |


## See Also

- [Azure DevTest Labs documentation](https://azure.microsoft.com/documentation/services/devtest-lab/)
- [What is DevTest Labs?](https://azure.microsoft.com/documentation/articles/devtest-lab-overview/)
- [Azure DevTest Labs Premium tier](https://azure.microsoft.com/documentation/articles/devtest-lab-faq/)