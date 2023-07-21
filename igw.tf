# igw.tf
resource "aws_internet_gateway" "fullstackIGW" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    "Name" = "fullstackIGW"
  }
}