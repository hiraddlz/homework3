# hello_http
Hello world with a webserver in C


## How to build
```gcc -o dummyserv dummy_serv.c```

Or to build a static binary

```gcc -o dummyserv dummy_serv.c```

## How to run
The port argument is optional and when not included the service will default to port 8081

```dummyserv <port>```

## How to use Terraform to build & run

From the repo root (where `main.tf` is):

1. Initialize Terraform:

```bash
terraform init
```

2. (optional) Validate:

```bash
terraform validate
```

3. See what Terraform will do:

```bash
terraform plan -out=plan.out
```

4. Apply (build image and run container):

```bash
terraform apply
```

## Dev Container Details

- The container is built from the included Dockerfile using Terraform.
- It exposes port **12344** to the host. When the app is running, access it at `http://localhost:12344`.
- The container includes **bash**, **git**, and **Python 3.7**.
- The app is built and run automatically inside the container on port 12344.

## Building & Running hello_http in the Dev Container

After running `terraform apply`, the container will be started and the app will be running on port 12344.

To access the container shell (for debugging or manual builds):

```bash
docker exec -it homework3-dummyserv bash
```

Inside the container, you can use bash, git, and Python 3.7 as needed.

To rebuild the app manually:

```bash
gcc -o dummyserv dummy_serv.c
./dummyserv 12344
```


```bash
terraform apply "plan.out"
# or simply:
# terraform apply
```

Terraform will:

* build the Docker image from the local `Dockerfile`, and
* create & start a container named `homework3-hello-http` mapped to host port 8081.

5. Test the running service (on the same host):

```bash
curl http://localhost:8081
```



