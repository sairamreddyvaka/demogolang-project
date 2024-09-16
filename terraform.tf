
provider "aws" {
  region = "us-west-2"  
  
}


resource "aws_key_pair" "key" {
  key_name   = "my-key"  
  public_key = file("~/.ssh/id_rsa.pub")  
}

# Security Group
resource "aws_security_group" "instance_sg" {
  name        = "allow_ssh_http"
  description = "Allow SSH and HTTP inbound traffic"

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

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "my_instance" {
  ami           = "ami-0c55b159cbfafe1f0"  
  instance_type = "t2.micro"               
  key_name      = aws_key_pair.key.key_name 
  security_groups = [aws_security_group.instance_sg.name] 

  
  tags = {
    Name = "MyEC2Instance"
  }

  
  user_data = <<-EOF
              #!/bin/bash
              curl -LO https://releases.hashicorp.com/terraform/1.9.5/terraform_1.9.5_linux_amd64.zip
                sudo apt-get install -y unzip
                unzip terraform_1.9.5_linux_amd64.zip
                sudo mv terraform /usr/local/bin/

              EOF

  

  
  output "instance_public_ip" {
    value = aws_instance.my_instance.public_ip
  }