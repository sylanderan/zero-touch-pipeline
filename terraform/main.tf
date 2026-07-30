# Terraform script to provision an AWS EC2 instance for our Docker app
# This demonstrates Infrastructure as Code (IaC)

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

# Create a Security Group for the Web Server
resource "aws_security_group" "web_sg" {
  name        = "zero-touch-app-sg"
  description = "Allow HTTP and SSH traffic"

  ingress {
    description = "HTTP from anywhere"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH for admin access"
    from_port   = 22
    to_port     = 22
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
    Name = "zero-touch-sg"
  }
}

# Launch the EC2 Instance
resource "aws_instance" "app_server" {
  ami           = "ami-0c7217cdde317cfec" # Ubuntu 22.04 LTS
  instance_type = "t2.micro"              # Free Tier Eligible

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  # User data script to install Docker and run our container automatically on boot
  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y docker.io
              sudo systemctl start docker
              sudo systemctl enable docker
              # Pulling the image built by our CI/CD pipeline
              sudo docker run -d -p 3000:3000 zero-touch-app:latest
              EOF

  tags = {
    Name        = "ZeroTouchProductionServer"
    Environment = "Production"
    Project     = "DevOps Portfolio"
  }
}

# Output the public IP address so we can easily access our deployed app
output "app_public_url" {
  description = "The public URL to access our application"
  value       = "http://${aws_instance.app_server.public_ip}:3000"
}
