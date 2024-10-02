resource "aws_db_instance" "rds_instance" {
  identifier              = "db-instance"
  allocated_storage       = var.rds_allocated_storage
  engine                  = "mysql"
  instance_class          = var.rds_instance_class
  username                = var.rds_username
  password                = var.rds_password
  multi_az                = true
  publicly_accessible     = false
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
}
