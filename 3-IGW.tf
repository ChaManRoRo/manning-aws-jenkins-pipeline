
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.CloudMaraduers-Prod.id

  tags = {
    Name  = "CloudMaraduers-Prod"
    Owner = "CloudMaraduers"
    ring  = "prod"
  }
}


resource "aws_route_table" "prod_public_route_table" {
  vpc_id = aws_vpc.CloudMaraduers-Prod.id

  tags = {
    Name  = "CloudMaraduers-Prod-Public-Route-Table"
    Owner = "CloudMaraduers"
    ring  = "prod"
  }
}


resource "aws_route" "prod_public_route_internet" {
  route_table_id         = aws_route_table.prod_public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}


resource "aws_route_table_association" "prod_public_subnet_association" {
  subnet_id      = aws_subnet.Production-A-Pub.id
  route_table_id = aws_route_table.prod_public_route_table.id
}