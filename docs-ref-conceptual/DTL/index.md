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
 
| Resource Groups                                 | Description                                                                                                          |
|-------------------------------------------------|----------------------------------------------------------------------------------------------------------------------|
| [ARM Templates](./armtemplates)                 | Provides operations for getting and listing a lab's ARM templates.                                                   |
| [Artifacts](./artifacts)                        | Provides operations for working with artifacts, including generating a Resource Management template for an artifact. |
| [Artifact Sources](./artifactsources)           | Provides operations for managing artifact sources.                                                                   |
| [Costs](./costs)                                | Lists the costs for a lab.                                                                                           |
| [Custom Images](./customimages)                 | Provides operations for creating and managing custom images.                                                         |
| [Disks](./disks)                                | Provides operations for managing a lab's storage disks.                                                              |
| [Environments](./environments)                  | Provides operations for managing a lab's environments (ARM template deployments).                                    |
| [Formulas](./formulas)                          | Provides operations for managing formulas.                                                                           |
| [Gallery Images](./galleryimages)               | Lists the gallery images for a lab.                                                                                  |
| [Global Schedules](./globalschedules)           | Provides operations for managing the global schedules for a lab.                                                     |
| [Labs](./labs)                                  | Provides operations for managing labs.                                                                               |
| [Notification Channels](./notificationchannels) | Provides operations for managing a lab's notification channels.                                                      |
| [Policies](./policies)                          | Provides operations for managing a lab's policies.                                                                   |
| [Policy Sets](./policysets)                     | Evaluates the lab policy.                                                                                            |
| [Schedules](./schedules)                        | Provides operations for managing schedules.                                                                          |
| [Secrets](./secrets)                            | Provides operations for managing a lab's secrets.                                                                    |
| [Service Runners](./servicerunners)             | Provides operations for managing a lab's service runners.                                                            |
| [Users](./users)                                | Provides operations for managing a lab's users                .                                                      |
| [VM Schedules](./virtualmachineschedules)       | Provides operations for managing schedules for a lab's virtual machines.                                             |
| [Virtual Machines](./virtualmachines)           | Provides operations for adding artifacts to and managing a lab's virtual machines.                                   |
| [Virtual Networks](./virtualnetworks)           | Provides operations for managing a lab's virtual networks.                                                           |


## See Also

- [Azure DevTest Labs documentation](https://azure.microsoft.com/documentation/services/devtest-lab/)
- [What is DevTest Labs?](https://azure.microsoft.com/documentation/articles/devtest-lab-overview/)
- [Azure DevTest Labs Premium tier](https://azure.microsoft.com/documentation/articles/devtest-lab-faq/)