terraform{
    backend "s3" {
        bucket = "micro-service-app-15-03-2023"
        region = "eu-west-2"
        key ="eks-server/terraform.tfstate"
    }
}
