# Get the latest PostgreSQL image
resource "docker_image" "postgres" {
  name = "postgres:latest"
}

# Start a PostgreSQL container
resource "docker_container" "postgres" {
  name  = "learn-postgres"
  image = docker_image.postgres.image_id
  env = ["POSTGRES_USER=root", "POSTGRES_PASSWORD=rootpassword"]
  ports {
    internal = 5432
    external = 5432
    }
  rm = true
}