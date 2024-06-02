resource "aws_vpc" "vpc1" {
  cidr_block = var.cidr_block
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = var.public_cidr_block
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags = {
    Name = var.publictags
  }
}


resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = var.private_cidr_block
  tags = {
    Name = var.privatetags
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc1.id

  tags = {
    Name = var.tags
  }
}

resource "aws_route_table" "route-table" {
  vpc_id = aws_vpc.vpc1.id

  route {
    cidr_block = var.route_cidrBlock
    gateway_id = aws_internet_gateway.gw.id
  }

}

resource "aws_route_table_association" "rtp" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.route-table.id
}

resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "example" {
  connectivity_type = var.nat_gateway
  allocation_id     = aws_eip.nat.id
  subnet_id         = aws_subnet.public.id

  tags = {
    Name = "gw NAT"
  }
}


resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc1.id

  route {
    cidr_block     = var.route_cidrBlock
    nat_gateway_id = aws_nat_gateway.example.id
  }
}

resource "aws_route_table_association" "private_rt_assoc" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private_rt.id
}
