# Recommended Ansible Directory Structure

For managing multiple computers (hosts) with Ansible, use the following structure for clarity and scalability:

```
Ansible/
├── inventories/
│   ├── production/
│   │   ├── hosts        # Inventory file for production (list your 5 computers here)
│   │   └── group_vars/  # Group variables for production
│   └── staging/
│       ├── hosts        # Inventory file for staging (if needed)
│       └── group_vars/  # Group variables for staging
├── group_vars/          # Global group variables (applies to all inventories)
├── host_vars/           # Host-specific variables (one file per host)
├── roles/               # Reusable roles (nginx, apache, users, etc.)
│   └── example_role/
│       ├── tasks/
│       ├── handlers/
│       ├── templates/
│       ├── files/
│       └── vars/
├── playbooks/
│   ├── site.yml         # Main playbook
│   └── webservers.yml   # Example playbook for webservers
├── ansible.cfg
└── README.md
```

**Key points:**
- Place your inventory files (listing the 5 computers) under `inventories/production/hosts`.
- Use `group_vars` and `host_vars` for variable management.
- Organize reusable logic in `roles/`.
- Keep playbooks in `playbooks/`.
## Ansible Tasks ##
- Use the sample website present in the GitHub repository, the link for which is mentioned below.
- https://github.com/Sameer-8080/Website-PRT-ORG.git
- Clone this repository in the Ansible master machine to use for the next task.
- Create the Ansible script to install nginx in one of the Slaves and apache2 in the other, and replace the original index.html files for both the machines with the website in the GitHub link that will have been cloned in the previous step.
