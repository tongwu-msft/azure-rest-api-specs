---
ms.assetid: 6bd963de-3f81-4e9a-b4b1-dae4b1b30d23
ms.title: Azure Logic Apps REST API | Microsoft Docs
ms.service: logic-apps
author: MandiOhlinger
ms.author: mandia
ms.manager: anneta
---


# Azure Logic Apps

Azure Logic Apps help you simplify and implement scalable integrations and workflows in the cloud. 
You can model and automate your process visually as a series of steps known as a workflow in the Logic App Designer. 
There are also [many connectors](https://docs.microsoft.com/azure/connectors/apis-list) 
that you can add to your logic app so you can quickly integrate across services 
and protocols across the cloud and on-premises. A logic app begins with a trigger, 
like 'When an account is added to Dynamics CRM', and after firing, 
can begin many combinations actions, conversions, and condition logic.

Logic apps offer these advantages:

- Save time by designing complex processes using easy-to-understand design tools
- Seamlessly implement patterns and workflows that would otherwise be difficult to implement in code
- Get started quickly from templates
- Customize your logic app with your own custom APIs, code, and actions
- Connect and synchronise disparate systems across on-premises and the cloud
- Build off of BizTalk server, API Management, Azure Functions, and Azure Service Bus with first-class integration support

Azure Logic Apps is a fully managed iPaaS (integration Platform as a Service), 
so developers don't have to worry about building hosting, scalability, availability, and management. 
Azure Logic Apps scales up automatically to meet demand.

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

- [Azure Logic Apps documentation](https://docs.microsoft.com/azure/logic-apps/)
- [What are logic apps?](https://docs.microsoft.com/azure/logic-apps/logic-apps-what-are-logic-apps)
- [Azure Logic Apps Examples and Common Scenarios](https://docs.microsoft.com/azure/logic-apps/logic-apps-examples-and-scenarios)
