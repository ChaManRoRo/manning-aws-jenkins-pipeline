# EC2 for prod

resource "aws_instance" "prod-basicmicrosoft" {
  ami           = "ami-0c808db6baea2d0ed"
  instance_type = "t2.micro"

  key_name = "CloudMaraduers-prod-A-winBastion01"


  subnet_id              = aws_subnet.Production-A-Pub.id
  vpc_security_group_ids = [aws_security_group.Production-A-basicmicrosoft-SG.id]

  tags = {
    Name  = "prod-basicmicrosoft"
    Owner = "CloudMaraduers"
    ring  = "prod"
  }
}



# EC2 for test

resource "aws_instance" "testing-basiclinux" {
  ami           = "ami-037774efca2da0726"
  instance_type = "t2.micro"

  key_name = "basiclinux"

  subnet_id              = aws_subnet.Testing-B-Private.id
  vpc_security_group_ids = [aws_security_group.Testing-B-basiclinux-SG.id]

  tags = {
    Name  = "testing-basiclinux"
    Owner = "CloudMaraduers"
    ring  = "test"
  }
}



# EC2 for dev
resource "aws_instance" "dev-basiclinux" {
  ami           = "ami-037774efca2da0726"
  instance_type = "t2.micro"

  key_name = "basiclinux"

  subnet_id              = aws_subnet.Development-C-Private.id
  vpc_security_group_ids = [aws_security_group.Dev-C-basiclinux-SG.id]

  tags = {
    Name  = "dev-basiclinux"
    Owner = "CloudMaraduers"
    ring  = "dev"
  }
}
