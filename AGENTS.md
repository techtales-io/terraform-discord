# Agent Instructions for terraform-discord

Welcome! This repository manages the Techtales Discord server infrastructure using Terraform, driven by custom YAML manifests.

This guide will help AI agents (and human developers) understand the repository structure, conventions, and CI/CD workflow.

## Architecture

Instead of writing raw `.tf` files for every channel or category, this repository uses a custom `yaml-loader` Terraform module.

- You will primarily add or edit `.yaml` files in the `data/` directory.
- The `terraform/` directory contains the main Terraform files that invoke the modules.

## File Structure

- `data/server.yaml`: The main Discord server configuration. It lists all active categories.
- `data/categories/`: YAML files defining Discord categories (e.g., `general.yaml`, `gaming-category.yaml`).
- `data/channels/`: YAML files defining Discord text, voice, or forum channels.

## Key Workflows and Rules

### 1. Adding a Category

- Create a new file in `data/categories/<category-name>.yaml`.
- Update `data/server.yaml` to include `<category-name>` in the `spec.categories` list.
- Use the `terraform.techtales.io/v1alpha1` API version and `DiscordCategoryChannel` kind.
- Example:

```yaml
---
apiVersion: terraform.techtales.io/v1alpha1
kind: DiscordCategoryChannel
metadata:
  name: gaming-category
  namespace: techtales.io
spec:
  displayName: 🎮・GAMING
  channels:
    - valorant-clips
```

### 2. Adding a Channel

- Create a new file in `data/channels/<channel-name>.yaml`.
- Assign it to a category by adding it to the category's `spec.channels` list in the respective `data/categories/` file.
- The `metadata.name` MUST match the file's basename (without `.yaml`) to prevent `yaml-loader` duplicate key errors.

#### Private (per-user) Channels

For channels that should only be visible to specific users, add an `owner` field to the spec:

```yaml
spec:
  displayName: 🤖・crowlex
  owner: crowlex
  syncPermissionsWithCategory: false
```

This automatically creates 4 `discord_channel_permission` resources per channel:

1. Deny @everyone VIEW_CHANNEL
2. Allow the owner VIEW_CHANNEL + SEND_MESSAGES + READ_MESSAGE_HISTORY
3. Allow @admin role the same permissions
4. Allow the Hermes bot the same permissions

**To add a new private user channel:**

1. Create the channel YAML with `owner` and `syncPermissionsWithCategory: false`.
2. Add the channel to the category's `spec.channels` list.
3. Add the user's Discord snowflake ID to the `user_ids` map in `terraform/locals.tf`.

### 3. Aesthetic Conventions

- Use emojis and interpuncts for display names.
- For categories: `displayName: 🎮・GAMING` (Capitalized).
- For text channels: `displayName: 🎬・valorant-clips` (Lowercase).

### 4. Tooling

- **Mise**: Used for tool versioning (`.mise.toml`). Run `mise install` to get `terraform`, `tflint`, `trivy`, etc.
- **Terraform Validation**: When validating, ensure you use the installed version of Terraform (e.g., via `mise exec -- terraform -chdir=terraform validate`).

### 5. CI/CD via Atlantis

- Create a branch, push, and open a Pull Request.
- **Atlantis** will automatically run `atlantis plan`.
- If the plan is locked by another PR, go to that PR and comment `atlantis unlock`, then come back to your PR and comment `atlantis plan`.
- **MegaLinter** runs on all PRs. Ensure your YAML and Markdown are well-formatted (e.g., 2 spaces for YAML).
