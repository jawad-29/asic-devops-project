terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 3.2"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace_v1" "eda" {
  metadata {
    name = "semiconductor-devops"
  }
}

resource "kubernetes_job_v1" "openroad" {
  metadata {
    name      = "openroad-eda-job"
    namespace = kubernetes_namespace_v1.eda.metadata[0].name
  }

  spec {
    backoff_limit = 1

    template {
      metadata {
        labels = {
          app = "openroad-eda"
        }
      }

      spec {
        restart_policy = "Never"

        container {
          name  = "openroad"
          image = "ghcr.io/the-openroad-project/openlane:1.0.2"

          command = [
            "/bin/bash",
            "-c",
            "/build/bin/openroad -version"
          ]
        }
      }
    }
  }
}
