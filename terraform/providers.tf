provider "aws" {
  region = "us-east-1"
  access_key = "AKIAJQCXXQKFWEWLSRFA"
  secret_key = "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"
  profile = "default"
}

data "aws_availability_zones" "available" {}

# Not required: currently used in conjunction with using
# icanhazip.com to determine local workstation external IP
# to open EC2 Security Group access to the Kubernetes cluster.
# See workstation-external-ip.tf for additional information.
provider "http" {}
