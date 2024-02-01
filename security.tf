resource "aws_security_group" "web-ssh" {
  name = "allow_http"
  vpc_id = aws_vpc.primera-vpc.id
  
  description = "Allow HTTP inbound traffic"
    ingress {
    description = "HTTP from everywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
    ingress {
    description = "SSH from everywhere"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
    egress {
    description = "Allow to send to everywhere"
    from_port = 0
    to_port = 0
    protocol = "-1" #Edozein protokolo TCP/UDP
    cidr_blocks = ["0.0.0.0/0"]
  }
}
