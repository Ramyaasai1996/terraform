output "aws_vpc" {
    value = aws_vpc.vpc.id
}
output "aws_internet_gateway" {
    value = aws_internet_gateway.IGW.id
}

output "aws_route_table" {
    value = aws_route_table.public.id
  
}
output "aws_subnet" {
    value = aws_subnet.public.id
  
}
