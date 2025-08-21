# List of Tested Actions

---

### **azure/login\@v2**

This action is used to authenticate with **Azure** using a Service Principal.

```yaml
- name: Azure Login
  uses: azure/login@v2
  with:
    auth-type: SERVICE_PRINCIPAL
    creds: ${{ secrets.AZURE_CREDENTIALS }}
    enable-AzPSSession: false
    environment: azurecloud
    allow-no-subscriptions: false
```

---

### **azure/arm-deploy\@v2**

This action is used to **deploy Azure resources** using an ARM template or a Bicep file.

```yaml
- name: Deploy Infrastructure
  uses: azure/arm-deploy@v2
  with:
    subscriptionId: ${{ secrets.AZURE_SUBSCRIPTION_ID }}
    resourceGroupName: ${{ env.AZURE_RESOURCE_GROUP }}
    template: ./bicep/main.bicep
    parameters: ./bicep/parameters/dev.parameters.json
    deploymentName: portal-dev-${{ github.run_number }}
```

---

👉 Do you also want me to **add comments inline** in YAML (like explaining each key in the workflow itself), or keep it in separate documentation style like above?
