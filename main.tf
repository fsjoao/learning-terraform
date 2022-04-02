provider "aws" {
  version = "~> 2.0"
  region = "us-east-1"
}

#deploy

resource "aws_instance" "dev" {
  count = 3        #how many pcs
  ami = "AMI-KEY-HERE"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    "Name" = "dev${count.index}"
  }
  vpc_security_group_ids = ["VPC-KEY-HERE"]
}


#to deploy: 
#           terraform init
#           terraform plan #it shows how the ambient will look like
#           terraform apply #it will apply dã
#           terraform show #show everything
#           aws ec2 describe-security-groups --see with cli

resource "aws_security_group" "acesso_ssh" {
  name        = "acesso_ssh"
  description = "acesso_ssh"
  

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks = ["YOUR-PUBLIC-IP-HERE"]
  }

  tags = {
    Name = "allow_all"
  }
}





#