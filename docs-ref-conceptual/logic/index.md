---
ms.assetid: 6bd963de-3f81-4e9a-b4b1-dae4b1b30d23
ms.title: Azure App Service Logic Apps
ms.service: logic-apps
author: MandiOhlinger
ms.author: mandia
ms.manager: anneta
---


# Azure Logic Apps

Logic Apps provide a way to simplify and implement scalable integrations and workflows in the cloud. It provides a visual designer to model and automate your process as a series of steps known as a workflow.  There are [many connectors](https://docs.microsoft.com/azure/connectors/apis-list) across the cloud and on-premises to quickly integrate across services and protocols.  A logic app begins with a trigger (like 'When an account is added to Dynamics CRM') and after firing, can begin many combinations actions, conversions, and condition logic.

The advantages of using Logic Apps include the following:  

- Saving time by designing complex processes using easy to understand design tools
- Implementing patterns and workflows seamlessly, that would otherwise be difficult to implement in code
- Getting started quickly from templates
- Customizing your logic app with your own custom APIs, code, and actions
- Connect and synchronise disparate systems across on-premises and the cloud
- Build off of BizTalk server, API Management, Azure Functions, and Azure Service Bus with first-class integration support

Logic Apps is a fully managed iPaaS (integration Platform as a Service) allowing developers not to worry about building hosting, scalability, availability and management.  Logic Apps will scale up automatically to meet demand.

## REST Operation Groups

| Resource Groups                                          | Description                                                    |
|----------------------------------------------------------|----------------------------------------------------------------|
| [Workflow Run Actions](./workflowrunactions)             | Lists workflow run actions.                                    |
| [Workflow Runs](./workflowruns)                          | Provides operations for listing and cancelling workflow runs.  |
| [Workflow Trigger Histories](./workflowtriggerhistories) | Lists workflow trigger histories.                              |
| [Workflow Triggers](./workflowtriggers)                  | Provides operations for listing and running workflow triggers. |
| [Workflow Versions](./workflowversions)                  | Lists workflow versions.                                       |
| [Workflows](./workflows)                                 | Provides operations for creating and managing workflows.       |


## See Also

- [Logic Apps documentation](https://azure.microsoft.com/documentation/services/logic-apps/)
- [What are Logic Apps](https://azure.microsoft.com/documentation/articles/app-service-logic-what-are-logic-apps/)
- [Logic Apps Examples and Common Scenarios](https://azure.microsoft.com/documentation/articles/app-service-logic-examples-and-scenarios/)
