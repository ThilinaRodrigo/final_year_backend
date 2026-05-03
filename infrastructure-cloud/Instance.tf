resource "aws_instance" "web" {
  ami                    = var.amiID[var.region]
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.backend_key.key_name # "dove_key"
  vpc_security_group_ids = [aws_security_group.backend_sg.id]
  availability_zone      = var.zone1

  user_data = file("${path.module}/scripts/install-docker.sh")
  tags = {
    Name    = "backend_dev"
    Project = "fabriq"
  }
}

resource "aws_ec2_instance_state" "web_state" {
  instance_id = aws_instance.web.id
  state       = "running"
}

output "Instance_public_id" {
  value = aws_instance.web.public_ip
}