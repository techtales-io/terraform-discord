# Valorant Clips Channel Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Create a new Discord text channel for Valorant clips and a new Gaming category to hold it, configured via Terraform YAML definitions.

**Architecture:** We are creating standard Kubernetes-like CRD YAML definitions that the existing `yaml-loader` Terraform module parses to provision Discord resources.

**Tech Stack:** Terraform, YAML

---

### Task 1: Create Gaming Category Configuration

**Files:**
- Create: `data/categories/gaming.yaml`

- [ ] **Step 1: Write the Gaming Category YAML**
Create the file `data/categories/gaming.yaml` with the following content:

```yaml
---
apiVersion: terraform.techtales.io/v1alpha1
kind: DiscordCategoryChannel
metadata:
  name: gaming
  namespace: techtales.io
spec:
  displayName: 🎮・GAMING
  channels:
    - valorant-clips
```

- [ ] **Step 2: Commit**

```bash
git add data/categories/gaming.yaml
git commit -m "feat: add gaming category"
```

---

### Task 2: Create Valorant Clips Channel Configuration

**Files:**
- Create: `data/channels/valorant-clips.yaml`

- [ ] **Step 1: Write the Valorant Clips Channel YAML**
Create the file `data/channels/valorant-clips.yaml` with the following content:

```yaml
---
apiVersion: terraform.techtales.io/v1alpha1
kind: DiscordTextChannel
metadata:
  name: valorant-clips
  namespace: techtales.io
spec:
  displayName: 🎬・valorant-clips
```

- [ ] **Step 2: Commit**

```bash
git add data/channels/valorant-clips.yaml
git commit -m "feat: add valorant-clips text channel"
```

---

### Task 3: Verify with Terraform Plan

**Files:**
- N/A

- [ ] **Step 1: Run Terraform Plan**

Run: `terraform plan` from the `terraform` directory to ensure no syntax errors exist and resources are correctly picked up. Wait, let's use the standard `atlantis.yaml` or just `cd terraform && terraform init && terraform plan` assuming local auth is valid, or simply rely on `terraform fmt` and validation. Since this is a simple data change, we'll validate the module.

Run: `cd terraform && terraform validate`
Expected: Success.

- [ ] **Step 2: Commit**
(No code changes expected from validation, but if any formatting was fixed, commit it. Otherwise, nothing to commit.)
