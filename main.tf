resource "aws_instance" "kubernetes" {
  count = length(var.ec2_names_qa)
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids =  [aws_security_group.allow_tls.id]
  user_data = file("volume.sh")

  root_block_device {
    volume_size = 50        # 👈 50GB
    volume_type = "gp3"     # recommended
  }

  

  tags = { Name = var.ec2_names_qa[count.index] }

}

resource "aws_security_group" "allow_tls" {
  name        = "allow_everyhing"
  description = "Allow TLS inbound traffic and all outbound traffic"
  

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}