module "eks-server" {
    source  = "terraform-aws-modules/eks/aws"
    version = "~> 19.0"
    cluster_name = "eks-cluster-micro-app"
    cluster_version = "1.24"

    cluster_endpoint_public_access  = true
    cluster_endpoint_private_access = true

    vpc_id = module.vpc-micro-app.vpc_id
    subnet_ids = module.vpc-micro-app.private_subnets

    tags = {
        environment = "development"
        application = "micro-app"
    }

    eks_managed_node_groups = {
        dev = {
            min_size = 1
            max_size = 3
            desired_size = 2

            instance_types = ["t2.small"]
        }
    }
}
