# Securtiy Group for Production-A-basicmicrosoft

resource "aws_security_group" "Production-A-basicmicrosoft-SG" {
  vpc_id      = aws_vpc.CloudMaraduers-Prod.id
  description = "Allow RDP "
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "Production-A-basicmicrosoft-SG"
    Owner = "CloudMaraduers"
    ring  = "Prod"
  }

}

# Security Group for Testing-B-basiclinux

resource "aws_security_group" "Testing-B-basiclinux-SG" {
  vpc_id      = aws_vpc.CloudMaraduers-Test.id
  description = "Allow SSH, ICMP and HTTP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["172.0.0.0/8"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["172.0.0.0/8"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["172.0.0.0/8"]

  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "Testing-B-basiclinux-SG"
    Owner = "CloudMaraduers"
    ring  = "Test"
  }
}

# Security Group for development-C-basiclinux

resource "aws_security_group" "Dev-C-basiclinux-SG" {
  vpc_id      = aws_vpc.CloudMaraduers-Dev.id
  description = "Allow SSH, ICMP and HTTP "

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["172.0.0.0/8"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["172.0.0.0/8"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["172.0.0.0/8"]

  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name  = "Dev-C-basiclinux-SG"
    Owner = "CloudMaraduers"
    ring  = "dev"
  }
}
