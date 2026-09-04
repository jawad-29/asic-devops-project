terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "devops_eda" {
  metadata {
    name = "devops-eda"
  }
}

resource "kubernetes_pod" "eda_runner" {
  metadata {
    name      = "openroad-runner"
    namespace = kubernetes_namespace.devops_eda.metadata[0].name
  }
  spec {
    container {
      name    = "openroad-container"
      image   = "efabless/openlane:v0.2"
      command = ["/bin/sh", "-c", "sleep 3600"]
    }
  }
}

