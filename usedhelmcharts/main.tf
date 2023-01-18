data "terraform_remote_state" "aks" {
  backend = "azurerm"
  config = {
    resource_group_name = "devops-gl5"
    storage_account_name = "storageaccountdevopsgl5"
    container_name = "devopsgl5"
    key = "cluster-terraform-provisioning"
   }
}


resource "helm_release" "datadog" {
  name = "datadog"
  chart = "datadog"
  repository = "https://helm.datadoghq.com"

  set {
    name = "datadog.apiKey"
    value = "f792c67aa43101964dbb1b0c24cb0814"
    type = "string"
  }
  values = [
    "${file("../infra-helm-charts-values/datadog-values.yaml")}"
  ]
}

resource "helm_release" "prometheus" {
  name = "prometheus"
  chart = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  values = [ "${file("../infra-helm-charts-values/prometheus-values.yaml")}" ]
}

resource "helm_release" "grafana" {
  name = "grafana"
  chart = "grafana"
  repository = "https://grafana.github.io/helm-charts"
}