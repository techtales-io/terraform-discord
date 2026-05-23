# Valorant Clips Channel Design

## Objective
Create a new text channel specifically for sharing Valorant clips, along with a dedicated "Gaming" category to house it, matching the existing Discord infrastructure managed via Terraform and YAML configuration.

## Architecture & Components

The Discord infrastructure uses a custom YAML-based loading mechanism (`terraform.techtales.io/v1alpha1`). We need to create two new resources.

### 1. Gaming Category
A new `DiscordCategoryChannel` resource.
- **File**: `data/categories/gaming.yaml`
- **Metadata Name**: `gaming`
- **Metadata Namespace**: `techtales.io`
- **Display Name**: `🎮・GAMING`
- **Channels**: `valorant-clips`

### 2. Valorant Clips Channel
A new `DiscordTextChannel` resource.
- **File**: `data/channels/valorant-clips.yaml`
- **Metadata Name**: `valorant-clips`
- **Metadata Namespace**: `techtales.io`
- **Display Name**: `🎬・valorant-clips`

## Data Flow
The Terraform module `yaml-loader` automatically loads all YAML files in `data/categories` and `data/channels`. Creating these files is sufficient to provision the resources during the next `terraform apply`.

## Testing
1. Run `terraform plan` to verify that the new category and channel are picked up correctly without syntax errors.
2. Ensure no existing resources are unintentionally modified.
