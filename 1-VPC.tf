resource "aws_vpc" "CloudMaraduers-Prod" {
  cidr_block = "172.16.0.0/16"


  tags = {
    Name  = "CloudMaraduers-Prod"
    Owner = "CloudMaraduers"
    ring  = "prod"
  }
}

resource "aws_vpc" "CloudMaraduers-Test" {
  cidr_block = "172.52.0.0/16"


  tags = {
    Name  = "CloudMaraduers-Test"
    Owner = "CloudMaraduers"
    ring  = "test"
  }
}


resource "aws_vpc" "CloudMaraduers-Dev" {
  cidr_block = "172.88.0.0/16"


  tags = {
    Name  = "CloudMaraduers-Dev"
    Owner = "CloudMaraduers"
    ring  = "dev"
  }
}