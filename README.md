# hello_http
Hello world with a webserver in C


## How to build
```gcc -o dummyserv dummy_serv.c```

Or to build a static binary

```gcc -o dummyserv dummy_serv.c```

## How to run
The port argument is optional and when not included the service will default to port 8080

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
terraform apply "plan.out"
# or simply:
# terraform apply
```

Terraform will:

* build the Docker image from the local `Dockerfile`, and
* create & start a container named `homework3-hello-http` mapped to host port 8080.

5. Test the running service (on the same host):

```bash
curl http://localhost:8080
```



