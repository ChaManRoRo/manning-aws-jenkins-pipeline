# Prod VPC Route Table

resource "aws_route_table" "prod_route_table" {
  vpc_id = aws_vpc.CloudMaraduers-Prod.id

  tags = {
    Name  = "CloudMaraduers-Prod-Route-Table"
    Owner = "CloudMaraduers"
    ring  = "prod"
  }

}


# Prod routes to Test and Dev VPCs

resource "aws_route" "prod_route_to_test" {
  route_table_id         = aws_route_table.prod_route_table.id
  destination_cidr_block = aws_vpc.CloudMaraduers-Test.cidr_block
  transit_gateway_id     = aws_ec2_transit_gateway.CloudMaraduers_TGW.id

  depends_on = [aws_ec2_transit_gateway.CloudMaraduers_TGW]

}

resource "aws_route" "prod_route_to_dev" {
  route_table_id         = aws_route_table.prod_route_table.id
  destination_cidr_block = aws_vpc.CloudMaraduers-Dev.cidr_block
  transit_gateway_id     = aws_ec2_transit_gateway.CloudMaraduers_TGW.id

  depends_on = [aws_ec2_transit_gateway.CloudMaraduers_TGW]
}


# Test VPC Route Table

resource "aws_route_table" "test_route_table" {
  vpc_id = aws_vpc.CloudMaraduers-Test.id

  tags = {
    Name  = "CloudMaraduers-Test-Route-Table"
    Owner = "CloudMaraduers"
    ring  = "test"
  }

}

# Test routes to Prod VPC

resource "aws_route" "test_route_to_prod" {
  route_table_id         = aws_route_table.test_route_table.id
  destination_cidr_block = aws_vpc.CloudMaraduers-Prod.cidr_block
  transit_gateway_id     = aws_ec2_transit_gateway.CloudMaraduers_TGW.id

  depends_on = [aws_ec2_transit_gateway.CloudMaraduers_TGW]

}

# Dev VPC Route Table

resource "aws_route_table" "dev_route_table" {
  vpc_id = aws_vpc.CloudMaraduers-Dev.id

  tags = {
    Name  = "CloudMaraduers-Dev-Route-Table"
    Owner = "CloudMaraduers"
    ring  = "dev"
  }

}

# Dev routes to Prod VPC

resource "aws_route" "dev_route_to_prod" {
  route_table_id         = aws_route_table.dev_route_table.id
  destination_cidr_block = aws_vpc.CloudMaraduers-Prod.cidr_block
  transit_gateway_id     = aws_ec2_transit_gateway.CloudMaraduers_TGW.id

  depends_on = [aws_ec2_transit_gateway.CloudMaraduers_TGW]
}