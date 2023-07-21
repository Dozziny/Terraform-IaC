# subnet.tf
resource "aws_subnet" "publicSubnet1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "fullstack-Public-Subnet-01"
  }
}

resource "aws_subnet" "publicSubnet2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "fullstack-Public-Subnet-02"
  }
}

## private rds subnet
resource "aws_subnet" "privateSubnet1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "fullstack-Private-Subnet-01"
  }
}

resource "aws_subnet" "privateSubnet2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "fullstack-Private-Subnet-02"
  }
}