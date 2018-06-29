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
  source_ami_filter {
    filters {
      virtualization-type = "hvm"
      name = "ubuntu/images/*ubuntu-xenial-16.04-amd64-server-*"
      root-device-type = "ebs"
    }
    owners = ["099720109477"]
    most_recent = true
  }
}]

provisioners = [{
  type   = "shell"
  inline = [
    "sleep 30",
    "sudo apt-get update -y",
    "sudo apt-get upgrade -y"
  ]
}]