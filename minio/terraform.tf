terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "3.0.2"
    }
    minio = {
      source = "aminueza/minio"
      version = "3.2.3"
    }
    null = {
      source = "hashicorp/null"
      version = "3.2.3"
    }
}
}