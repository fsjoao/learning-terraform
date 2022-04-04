variable "amis" {
    type = map

    default = {
        "us-east-1" = "ami-0e472ba40eb589f49"
        "us-east-2" = "ami-064ff912f78e3e561"
    }
}

variable "cdirs_acesso_remoto" {
    type = "list"
    default = ["PUBLIC-IP-HERE"]
}

variable "key_name" {
    default = "terraform-aws"
  
}