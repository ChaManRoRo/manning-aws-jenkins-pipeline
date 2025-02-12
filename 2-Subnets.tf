#These are   for  public

resource "aws_subnet" "Production-A-Pub" {
  vpc_id                  = aws_vpc.CloudMaraduers-Prod.id
  cidr_block              = "172.16.1.0/24"
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true

  tags = {
    Name  = "CloudMaraduers-Prod-Public"
    Owner = "CloudMaraduers"
    ring  = "prod"
  }
}



#these are for private
resource "aws_subnet" "Production-A-Private" {
  vpc_id            = aws_vpc.CloudMaraduers-Prod.id
  cidr_block        = "172.16.11.0/24"
  availability_zone = "us-east-2a"

  tags = {
    Name  = "CloudMaraduers-Prod-Private"
    Owner = "CloudMaraduers"
    ring  = "prod"
  }
}

resource "aws_subnet" "Testing-B-Private" {
  vpc_id            = aws_vpc.CloudMaraduers-Test.id
  cidr_block        = "172.52.12.0/24"
  availability_zone = "us-east-2b"

  tags = {
    Name  = "CloudMaraduers-Test-Private"
    Owner = "CloudMaraduers"
    ring  = "test"
  }
}


resource "aws_subnet" "Development-C-Private" {
  vpc_id            = aws_vpc.CloudMaraduers-Dev.id
  cidr_block        = "172.88.13.0/24"
  availability_zone = "us-east-2c"

  tags = {
    Name  = "CloudMaraduers-Dev-Private"
    Owner = "CloudMaraduers"
    ring  = "dev"
  }
}
