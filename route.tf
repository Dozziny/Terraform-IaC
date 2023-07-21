# route.tf
resource "aws_route_table" "fullstackPublicRTb" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.fullstackIGW.id
  }

  tags = {
    "Name" = "fullstack-public-rtb"
  }
}

resource "aws_route_table" "fullstackPrivateRTb" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    "Name" = "fullstack-private-rtb"
  }
}

## route
### subnet associate
resource "aws_route_table_association" "publicRTbAssociation01" {
  subnet_id      = aws_subnet.publicSubnet1.id
  route_table_id = aws_route_table.fullstackPublicRTb.id
}

resource "aws_route_table_association" "publicRTbAssociation02" {
  subnet_id      = aws_subnet.publicSubnet2.id
  route_table_id = aws_route_table.fullstackPublicRTb.id
}

resource "aws_route_table_association" "privateRTbAssociation01" {
  subnet_id      = aws_subnet.privateSubnet1.id
  route_table_id = aws_route_table.fullstackPrivateRTb.id
}

resource "aws_route_table_association" "privateRTbAssociation02" {
  subnet_id      = aws_subnet.privateSubnet2.id
  route_table_id = aws_route_table.fullstackPrivateRTb.id
}