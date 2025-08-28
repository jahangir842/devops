# 🚀 Azure DevOps YAML Triggers Cheat Sheet

---

## 🔹 1. **CI Trigger** – Run pipeline on branch push

Runs automatically when code is pushed to selected branches.

```yaml
trigger:
- main          # Only main branch
```

👉 **Use when:** You want automatic builds/deploys on commits.

---

## 🔹 2. **Path Filters** – Run only on file/folder changes

Limits CI trigger to specific paths.

```yaml
trigger:
  branches:
    include: [main]
  paths:
    include: [src/]
    exclude: [docs/]
```

👉 **Use when:** You want to avoid builds for docs/ or non-code changes.

---

## 🔹 3. **PR Trigger** – Run on Pull Request creation/update

Validates PRs targeting certain branches.

```yaml
pr:
- main
```

👉 **Use when:** You want tests/validation before merging.

---

## 🔹 4. **Scheduled Trigger** – Run on a timer (cron)

Runs pipeline at fixed times (UTC).

```yaml
schedules:
- cron: "0 2 * * 1-5"   # 2 AM Mon–Fri
  branches:
    include: [main]
  always: true
```

👉 **Use when:** You need nightly builds or regular tests.

---

## 🔹 5. **Manual Trigger** – Start from UI/API with parameters

Pipeline runs only when triggered manually.

```yaml
parameters:
- name: environment
  type: string
  default: dev
  values: [dev, prod]
```

👉 **Use when:** You want full control before starting (e.g., Prod).

---

## 🔹 6. **Pipeline Resource Trigger** – Run when another pipeline finishes

Chained pipelines (Build → Deploy).

```yaml
resources:
  pipelines:
  - pipeline: BuildPipeline
    source: MyApp-Build
    trigger:
      branches:
        include: [main]
```

👉 **Use when:** You want to auto-deploy after a successful build pipeline.

---

## 🔹 7. **Repository Resource Trigger** – Run when another repo changes

Monitors external/multi-repo setup.

```yaml
resources:
  repositories:
  - repository: tools
    type: git
    name: ProjectX/tools
    trigger:
      branches:
        include: [main]
```

👉 **Use when:** You depend on shared repos/tools.

---

## 🔹 8. **Tag Trigger (Workaround)** – Run on Git tag push

Azure DevOps doesn’t support native tags, but you can target refs.

```yaml
trigger:
  branches:
    include:
    - refs/tags/*
```

👉 **Use when:** You release based on version tags.

---

## 🔹 9. **Disable Triggers** – No auto runs

Stops CI or PR triggers.

```yaml
trigger: none
pr: none
```

👉 **Use when:** The pipeline should run only manually or via another pipeline.

---

## 🔹 10. **Best Practices**

✔ Use **path filters** to save build minutes.
✔ Use **PR triggers** for code quality before merging.
✔ Use **schedules** for nightly tests.
✔ Use **pipeline chaining** for Build → Deploy flows.
✔ Use **manual triggers with parameters** for Prod.

---
