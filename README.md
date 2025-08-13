# mongodb-k8s-monitoring

## Purpose
This repository provides a Docker image to monitor MongoDB instances running on Kubernetes. It utilizes the official MongoDB Automation Agent to collect monitoring data.

## How it Works
The repository is structured to automatically build and publish the monitoring agent Docker image to Docker Hub.

### Dockerfile
The `Dockerfile` is based on `ubuntu:18.04` and performs the following steps:
1.  Installs necessary dependencies like `curl` and `sudo`.
2.  Downloads a specific version of the MongoDB Automation Agent (`.deb` package).
3.  Installs the agent using `dpkg`.
4.  Cleans up the downloaded package and other temporary files to keep the image size small.

The default command for the container is to print the help message for the agent. You are expected to override this with your specific configuration when running the container.

### CI/CD Workflow
The repository contains a GitHub Actions workflow defined in `.github/workflows/docker-image.yml`.
-   **Trigger**: The workflow runs on every push or pull request to the `main` branch.
-   **Jobs**:
    1.  **Build**: Checks out the code, builds the `Dockerfile`, and tags the resulting image as `harishnaga07/monitoring:v1`.
    2.  **Push**: Logs into Docker Hub and pushes the new image to the `harishnaga07/monitoring` repository.

This setup ensures that any changes to the `Dockerfile` are automatically built and published, providing a continuous integration and delivery pipeline for the monitoring agent.
