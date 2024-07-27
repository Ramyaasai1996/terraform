resource "aws_vpc" "vpc" {
    cidr_block =  var.cidr
    tags = {
      Name = "vpc"
    }
  }
resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "IGW"
  }
}
resource "aws_subnet" "public" {
  vpc_id = aws_vpc.vpc.id
 availability_zone  = "ap-south-1a"
  cidr_block = var.cidr_public
  tags = {
    Name = "public"
  }
}
resource "aws_subnet" "private" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.cidr_private
    tags = {
      Name = "private"
    }
  
}
resource "aws_route_table" "public" {
    vpc_id = aws_vpc.vpc.id
    
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.IGW.id
    }
    tags = {
      Name = "public"
    }
  
}

resource "aws_route_table_association" "public" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public.id
  
}

resource "aws_instance" "ramya" {
    instance_type = "t2.micro"
    ami = "ami-022ce6f32988af5fa"
    subnet_id = aws_subnet.public.id
    tags = {
      Name = "ramya"
    }

  
}
