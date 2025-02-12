# Transit Gateway
resource "aws_ec2_transit_gateway" "CloudMaraduers_TGW" {
  security_group_referencing_support = "enable"
  dns_support                        = "enable"
  vpn_ecmp_support                   = "enable"
  default_route_table_association    = "enable"
  default_route_table_propagation    = "enable"
  tags = {
    Name = "CloudMaraduers-TGW"
  }
}

# Transit Gateway Attachments for Each VPC
resource "aws_ec2_transit_gateway_vpc_attachment" "prod_attachment" {
  transit_gateway_id = aws_ec2_transit_gateway.CloudMaraduers_TGW.id
  vpc_id             = aws_vpc.CloudMaraduers-Prod.id
  subnet_ids         = [aws_subnet.Production-A-Pub.id]
}

resource "aws_ec2_transit_gateway_vpc_attachment" "test_attachment" {
  transit_gateway_id = aws_ec2_transit_gateway.CloudMaraduers_TGW.id
  vpc_id             = aws_vpc.CloudMaraduers-Test.id
  subnet_ids         = [aws_subnet.Testing-B-Private.id]
}

resource "aws_ec2_transit_gateway_vpc_attachment" "dev_attachment" {
  transit_gateway_id = aws_ec2_transit_gateway.CloudMaraduers_TGW.id
  vpc_id             = aws_vpc.CloudMaraduers-Dev.id
  subnet_ids         = [aws_subnet.Development-C-Private.id]
}