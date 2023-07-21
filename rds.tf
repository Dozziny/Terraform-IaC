# rds.tf
resource "aws_db_subnet_group" "fullstackSubnetGroup" {
  name = "fullstack-sg"
  subnet_ids = [
    aws_subnet.privateSubnet1.id,
    aws_subnet.privateSubnet2.id
  ]

  tags = {
    "Name" = "fullstack-subnet-group"
  }

}

resource "aws_db_instance" "fullstackDB" {
  allocated_storage      = 20
  max_allocated_storage  = 50
  availability_zone      = "ap-northeast-2a"
  vpc_security_group_ids = [aws_security_group.privateSG01.id]
  db_subnet_group_name   = aws_db_subnet_group.fullstackSubnetGroup.name
  engine                 = "mysql"
  engine_version         = "8.0.28"
  instance_class         = "db.t2.micro"
  skip_final_snapshot    = true
  identifier             = "test-mysql"
  username               = "root"
  password               = "fullstackexample"
  db_name                = "fullstackDB"
  port                   = "3306"
}