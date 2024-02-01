resource "aws_instance" "mi-primera-instancia" {
  ami           = data.aws_ami.Ubuntu_latest.id
  instance_type = "t2.micro"

  security_groups = ["default",aws_security_group.web-ssh.name]  # Gehienez bost security group izan ditzazke
  key_name = aws_key_pair.clave-ssh-curso.key_name

  user_data = file("userdata-script.sh")

  tags = {
    name = "mi-primera-instancia"
  }
}

resource "aws_key_pair" "clave-ssh-curso" {
  key_name = "terraform-ssh"
  public_key = file(var.AWS_PUBLIC_KEY)
}

output "public-ip" {
  value = aws_instance.mi-primera-instancia.public_ip
}

data "aws_ami" "Ubuntu_latest" {
  most_recent = true
  owners = ["099720109477"]

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22*"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }

 filter {
    name = "architecture"
    values = ["x86_64"]
  }
}