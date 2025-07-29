provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "patient_vpc" {
  cidr_block = var.vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "patient-vpc"
  }
}

resource "aws_subnet" "patient_subnet_public" {
  vpc_id     = aws_vpc.patient_vpc.id
  cidr_block = var.public_subnet_cidr_block
  availability_zone = "${var.aws_region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "patient-public-subnet"
  }
}

resource "aws_internet_gateway" "patient_igw" {
  vpc_id = aws_vpc.patient_vpc.id

  tags = {
    Name = "patient-igw"
  }
}

resource "aws_route_table" "patient_public_rt" {
  vpc_id = aws_vpc.patient_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.patient_igw.id
  }

  tags = {
    Name = "patient-public-rt"
  }
}

resource "aws_route_table_association" "patient_public_rta" {
  subnet_id      = aws_subnet.patient_subnet_public.id
  route_table_id = aws_route_table.patient_public_rt.id
}

resource "aws_security_group" "patient_sg" {
  vpc_id = aws_vpc.patient_vpc.id
  name   = "patient-sg"
  description = "Security group for patient web interface"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8000
    to_port     = 8000
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
    Name = "patient-sg"
  }
}

resource "aws_instance" "patient_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.patient_subnet_public.id
  security_groups = [aws_security_group.patient_sg.id]
  key_name      = var.key_pair_name

  tags = {
    Name = "patient-web-interface-ec2"
  }
}