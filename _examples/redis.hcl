variables {
  aws_access_key      = "dummy-key"
  aws_secret_key      = "dummy-secret"
  aws_session_token   = "dummy-token"
  aws_default_region  = "eu-west-1"
}

builders = [{
  ami_name      = "redis"
  type          = "amazon-ebs"
  instance_type = "t2.micro"
  ssh_username  = "ec2-user"
  source_ami    = "ami-d834aba1"
}]

provisioners = [{
  type   = "shell"
  inline = [
    "sleep 30",
    "sudo yum install epel-release -y",
    "sudo yum --enablerepo=epel install redis -y"
  ]
}]