variable "aws_region" {
  description = "AWS region to deploy resources in"
  type        = string
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr" {
  type        = string
  description = "CIDR for public subnet"
}

variable "private_subnet_cidr" {
  type        = string
  description = "CIDR for private subnet"
}

variable "availability_zone" {
  type        = string
  description = "Availability zone for subnets"
}

variable "bastion_ami" {
  type        = string
  description = "AMI for Bastion EC2"
}

variable "backend_ami" {
  type        = string
  description = "AMI for Backend EC2"
}

variable "instance_type" {
  type        = string
  description = "Instance type for both EC2s"
}

variable "bastion_key" {
  type        = string
  description = "Key pair name for Bastion EC2"
}

variable "backend_key" {
  type        = string
  description = "Key pair name for Backend EC2"
}

variable "my_ip" {
  type        = string
  description = "Your IP to allow SSH to Bastion"
}