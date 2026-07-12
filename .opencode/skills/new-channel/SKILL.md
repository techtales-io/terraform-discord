---
name: new-channel
description: Creates a new Discord channel and/or category in the terraform-discord repository. Use this skill whenever the user asks to add a Discord channel, create a category, or make a channel for a specific topic in the techtales server.
---

# New Channel Skill

This skill automates the creation of new Discord channels and categories in the `terraform-discord` repository.
It safely navigates the YAML loader requirements, Atlantis pipeline, and enforces strict manual approval before applying infrastructure changes.

## 1. Information Gathering

Determine the following from the user:

- Channel purpose and name.
- Which category it should belong to (or if a new category is needed).
- Display names (Aesthetic conventions: categories are uppercase like `🎮・GAMING`, channels are lowercase like `🎬・valorant-clips`).

## 2. Implementation

1. **Create the Category YAML (if needed)** in `data/categories/<category-name>.yaml`.
  - Ensure `metadata.name` exactly matches `<category-name>` (the file basename).
  - Add the new category to `spec.categories` list in `data/server.yaml`.
2. **Create the Channel YAML** in `data/channels/<channel-name>.yaml`.
  - Ensure `metadata.name` exactly matches `<channel-name>` (the file basename).
  - Add the channel to the `spec.channels` list in the corresponding category YAML.
3. **Validate**: Check that your file basenames and `metadata.name` fields match perfectly to prevent `duplicate object key` errors in the `yaml-loader`.

## 3. PR Creation & CI/CD

1. Create a feature branch (`git checkout -b feat/...`).
2. Commit the changes and push to origin.
3. Create a Pull Request using `gh pr create`.
4. Monitor the PR checks (`gh pr checks` or `gh pr view --comments`).
  - If `atlantis/plan` fails due to a lock from a previous PR, find the blocking PR, comment `atlantis unlock` on it, and then comment `atlantis plan` on the new PR.
  - Wait until `MegaLinter`, `atlantis/plan`, and all other hooks succeed.

## 4. MANDATORY APPROVAL GATE

**<HARD-GATE>** <!-- markdownlint-disable-line MD033 -->
You MUST explicitly ask the user for permission before applying the infrastructure changes.
Ask the user: _"All pipelines have passed. Do I have your permission to comment `atlantis apply` to deploy these changes?"_
**Do NOT proceed to step 5 until the user explicitly approves.**
**</HARD-GATE>** <!-- markdownlint-disable-line MD033 -->

## 5. Deployment and Reporting

1. Once approved by the user, comment `atlantis apply` on the PR (`gh pr comment <PR_NUMBER> --body "atlantis apply"`).
2. Wait for the apply pipelines to succeed (poll `gh pr checks` and `gh pr view --comments`).
3. Present the final result to the user as a short report table. For example:

| Resource Type | Internal Name     | Display Name         | Status               |
| ------------- | ----------------- | -------------------- | -------------------- |
| Category      | `gaming-category` | `🎮・GAMING`         | Applied              |
| Channel       | `valorant-clips`  | `🎬・valorant-clips` | Applied              |
| Pull Request  | `#123`            | N/A                  | Successfully Applied |
