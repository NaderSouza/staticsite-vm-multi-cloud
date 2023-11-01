# VPC
resource "aws_vpc" "vpc" {
    cidr_block           = var.rede_cidr
    enable_dns_hostnames = "true"
}

# INTERNET GATEWAY
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id
}

# SUBNET
resource "aws_subnet" "sn_public" {
    vpc_id                  = aws_vpc.vpc.id
    cidr_block              = var.subnet_cidr
    map_public_ip_on_launch = "true"
    availability_zone       = "us-east-1a"
}

# ROUTE TABLE
resource "aws_route_table" "rt_public" {
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
}

# SUBNET ASSOCIATION
resource "aws_route_table_association" "rt_public_To_sn_public" {
  subnet_id      = aws_subnet.sn_public.id
  route_table_id = aws_route_table.rt_public.id
}

# SECURITY GROUP
resource "aws_security_group" "https" {
  name        = "allow-https"
  description = "Allow inbound HTTPS traffic"
  
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Permitir tráfego de qualquer origem. Considere limitar para IPs específicos.
  }
}
