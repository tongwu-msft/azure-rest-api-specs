# Staging an overwrite

What follows is a how-to (from a git perspective) for getting an overwrite staged on [review.docs.microsoft.com](https://review.docs.microsoft.com).

## Prerequisites

### Request write permissions to azure-docs-rest-apis

**NOTE: This is a temprorary requirement.** This step will be unnecessary in the future, and your write permissions will (likely) be revoked on or around 14 November 2016.

**How:** Send an email to [Brady Gaster](mailto:bradyg@microsoft.com) and request **write access** to the **azure-docs-rest-apis** repository, stating that you need to be able to add overwrites for your service.

**Why:** This allows you to create branches in the repo, a current requirement for triggering OPS builds when you commit > push > issue PRs for your overwrites.

### Clone the azure-docs-rest-apis repo

If you haven't already, create a local clone of the the **azure-docs-rest-apis** repo and `cd` into the new clone's directory:

```bash
marsma@MARSMA-01 MINGW64 /c/repos
$ git clone https://mmacy:12345678abcdef12345678@github.com/Azure/azure-docs-rest-apis.git
Cloning into 'azure-docs-rest-apis'...
remote: Counting objects: 1581, done.
remote: Compressing objects: 100% (11/11), done.
remote: Total R15e81 (delta 2), reused 0 (delta 0), pack-reused 1570
Receiving objects: 100% (1581/1581), 2.61 MiB | 1.72 MiB/s, done.
Resolving deltas: 100% (982/982), done.
Checking connectivity... done.
Checking out files: 100% (224/224), done.

marsma@MARSMA-01 MINGW64 /c/repos
$ cd azure-docs-rest-apis
```

**IMPORTANT!** This process differs from our azure-content-pr setup in that we're cloning the "main" **Azure/azure-docs-rest-apis** repo, NOT our *fork* of the repo.

## Step-by-step: staging an overwrite

### 1. Checkout `master` and `pull` to ensure you're local clone is up to date

```bash
marsma@MARSMA-01 MINGW64 /c/repos/azure-docs-rest-apis (some-other-branch)
$ git checkout master
Switched to branch 'master'
Your branch is behind 'origin/master' by 11 commits, and can be fast-forwarded.
  (use "git pull" to update your local branch)

marsma@MARSMA-01 MINGW64 /c/repos/azure-docs-rest-apis (master)
$ git pull
Updating fa16bdb..f30ea4c
Fast-forward
 api-ref/apimanagement/ApiManagementServices.json   | 1160 ++++++++
 api-ref/apimanagement/ApiOperations.json           | 2687 +++++++++++++++++++
 api-ref/apimanagement/ApiProducts.json             | 2489 +++++++++++++++++
 ...
```

### 2. Create a local working branch

```bash
marsma@MARSMA-01 MINGW64 /c/repos/azure-docs-rest-apis (master)
$ git checkout -b batch-overwrite-pool_list
Switched to a new branch 'batch-overwrite-pool_list'
```

### 3. Make your edits, add files, etc.
### 4. `add`, `commit`, and `push` to remote

```bash
marsma@MARSMA-01 MINGW64 /c/repos/azure-docs-rest-apis (batch-overwrite-pool_list)
$ git status
On branch batch-overwrite-pool_list
Untracked files:
  (use "git add <file>..." to include in what will be committed)

        api-doc/batch/

nothing added to commit but untracked files present (use "git add" to track)

marsma@MARSMA-01 MINGW64 /c/repos/azure-docs-rest-apis (batch-overwrite-pool_list)
$ git add .

marsma@MARSMA-01 MINGW64 /c/repos/azure-docs-rest-apis (batch-overwrite-pool_list)
$ git commit -m "[batch] overwrite adding pool_list filter options"
[batch-overwrite-pool_list e6e4427] [batch] overwrite adding pool_list filter options
 1 file changed, 20 insertions(+)
 create mode 100644 api-doc/batch/Pool.md

marsma@MARSMA-01 MINGW64 /c/repos/azure-docs-rest-apis (batch-overwrite-pool_list)
$ git push origin batch-overwrite-pool_list
Counting objects: 5, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (4/4), done.
Writing objects: 100% (5/5), 770 bytes | 0 bytes/s, done.
Total 5 (delta 1), reused 0 (delta 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local objects.
To https://mmacy:12345678abcdef12345678@github.com/Azure/azure-docs-rest-apis.git
 * [new branch]      batch-overwrite-pool_list -> batch-overwrite-pool_list
```

### 5. Verify the build was completed and published in the [OPS Publishing History](https://op-portal-prod.azurewebsites.net/#/containers/history/repositories/All)

![OPS build portal](./images/overwrites_in_gitbash_03.png)

### 6. Check the published changes in your branch on review.docs.microsoft.com. The URL is in the form:

```
https://review.docs.microsoft.com/en-us/rest/api/<servicename>/index?branch=<my-branch-name>
```

Example:
```
https://review.docs.microsoft.com/en-us/rest/api/batch/index?branch=batch-overwrite-pool_list
```

In this particular overwrite, I replaced the Pool_List `description`, adding a table that specifies the supported filter values:

![PR creation in GitHub](./images/overwrites_in_gitbash_04.png)

### 7. Create the PR in GitHub

![Image of PR creation in GitHub](./images/overwrites_in_gitbash_01.png)

### 8. Verify **All checks have passed** on the PR

![CI check status GitHub](./images/overwrites_in_gitbash_02.png)

### 9. Merging is now in the hands of those with the permissions to do so.

## `git` command summary

The abbreviated process to stage (not including [cloning the repo](#prerequisites)) is as such:

```bash
$ git checkout master
$ git pull
$ git checkout -b my_local_branch
...add/edit your overwrite files...
$ git add my_awesome_overwrite.md
$ git commit -m "commit message detailing overwrite intention"
$ git push origin my_local_branch
 ```

After that last `push` command, you're at **step 5** above.

## Troubleshooting

If you feel like you're stuck in a trial-and-error mode, throwing @#$%^ at the wall and it's not sticking, check out some of the solutions to common problems below. 

NOTE: This section is intended to help with overwrite-specific issues, not necessarily common Markdown issues. For Markdown help, see the [Markdown section in the Docs Contributor Guide](https://stage.docs.microsoft.com/en-us/contribute/markdown), or the [OPS User Guide](https://opsdocs.azurewebsites.net/en-us/opsdocs/partnerdocs/gfm?branch=master).

### Issue: My list is not rendering correctly.

For example, sometimes when you do an overwrite of an item (say, a description), you need to use the "*content" keyword to do more than just overwrite a few words or single line. Sometimes you want to do a whole block of Markdown text, with an unordered list, like this: 

```
description: *content
---

## Test
- bullet 1  
- bullet 2  
- bullet 3  

```

But when the Markdown renders, it ends up looking something like this, where your bullets are misaligned with the text above them:

<b>Test</b>
<li>bullet 1</li>
<li>bullet 2</li>
<li>bullet 3</li>

At this point, there is no solution. We are exploring this with the VSC team and have filed a bug (https://mseng.visualstudio.com/DefaultCollection/VSChina/_workitems?_a=edit&id=801775). We will update as soon as we know more.


### Issue: I can't get *anything* to show for my overwrite. In fact, none of my overwrites seem to work for a given .md file, or they just stop at a certain point.

**Extraneous (`:`) colon character**  
A common cause of this is due to a colon being used in the overwrite text. This is because the overwrite file syntax uses the YAML format to express the name/value pairs, and YAML specifies a single colon per line to separate the overwrite name/value pair.

For example, if you have a overwrite that looks like the following, the extraneous `:` in the description for the `api-version` parameter overwrite will cause an exception in the build and none of your overwrites will be applied to the final page/output.

```
---
uid: management.azure.com/RateCardManagementClient/2015-06-01-preview/RateCard_Get
parameters:
    - name: api-version
      description: Use the latest version: `2016-08-31-preview`.
    - name: subscriptionId
      description: The identifier of the target Azure subscription. 
description: *content
---
```

**Extraneous `---` separator** in a overwrite  
As with other issues, this is about making sure you have valid YAML. If your description overwrite contains extra `---` delimiter at the end for example (like the one below), this will also cause an exception in the build and none of your overwrite will be applied to the final page/output.

```
---
uid: management.azure.com/RateCardManagementClient/2015-06-01-preview/RateCard_Get
description: *content
---
<content>
---
<EOF > 
```

### Issue: My exception overwrite is not working.
For example, the following will not overwrite the text for the specified exception:

```
---
uid: Microsoft.ServiceBus.Messaging.TopicDescription.EnableFilteringMessagesBeforePublishing
exceptions: *content
---
[NoMatchingSubscriptionException](/dotnet/api/microsoft.servicebus.messaging.nomatchingsubscriptionexception)

Thrown if no subscriptions are found.
```

We are exploring this with the VSC team and have filed a bug (https://mseng.visualstudio.com/VSChina/_workitems?id=800955). We will update as soon as we know more.
