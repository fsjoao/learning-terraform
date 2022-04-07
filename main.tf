provider "aws" {
  version = "~> 2.0"
  region = "us-east-1"
}

provider "aws" {
  alias = "us-east-2"
  version = "~> 2.0"
  region = "us-east-2"
}

#deploy

resource "aws_instance" "dev" {
  count = 3        #hom many pcs
  ami = "ami-0e472ba40eb589f49"
  instance_type = "t2.micro"
  key_name = var.key_name
  tags = {
    "Name" = "dev${count.index}"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh-us-east-2.id}"]
}


#to deploy: 
#           terraform init
#           terraform plan #it shows how the ambient will look like
#           terraform apply #it will apply dã
#           terraform show #show everything
#           aws ec2 describe-security-groups --see with cli

resource "aws_instance" "dev4" {
  ami = "ami-0e472ba40eb589f49"
  instance_type = "t2.micro"
  key_name = var.key_name
  tags = {
    "Name" = "dev4"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh-us-east-2.id}"]
  
}


resource "aws_instance" "dev5" {
  ami = var.amis["us-east-1"]
  instance_type = "t2.micro"
  key_name = var.key_name
  tags = {
    "Name" = "dev5"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh-us-east-2.id}"]
}

resource "aws_instance" "dev6" {
  provider = aws.us-east-2
  ami = var.amis["us-east-2"]
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    "Name" = "dev6"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh-us-east-2.id}"]
}

#if wants to destroy some instance, use "terraform destroy -target #NAME-OF0-THE-INSTANCE-HERE-SOMETHING-LIKE-AWS_INSTANCE.DEV4#"
#if you have sure, like sure 4REAL, apply "terraform destroy", and will destroy every instance it haves."

#
