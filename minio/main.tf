# Get the latest minio image
resource "docker_image" "minio" {
  name = "minio/minio:latest"
}

# Create a data directory for minio
resource "null_resource" "create_local_directory" {
  provisioner "local-exec" {
    when    = create
    command = "mkdir -p ~/minio/data"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "rm -rf ~/minio/data"
  }
}

# Start a minio container
resource "docker_container" "minio" {
  name  = "learn-minio"
  image = docker_image.minio.image_id
  env = ["MINIO_ROOT_USER=root", "MINIO_ROOT_PASSWORD=rootpassword"]
  restart = "always"

  ports {
    internal = 9000
    external = 9000
  }

  ports {
    internal = 9001
    external = 9001
  }

  mounts {
    type   = "bind"
    source = pathexpand(var.local_data_path)
    target = "/data"
  }

  command = ["server", "/data", "--console-address", ":9001"]
}