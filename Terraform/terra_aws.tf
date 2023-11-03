resource "aws_instance" "my_ec2"{
   ami = "ami-0e83be366243f524a"
   instance_type = "t2.micro"
   key_name = "Villalobos-aws"
   tags = {
       Name = "My_instance"
     }
   vpc_security_group_ids = [aws_security_group.my_security_group.id]
}

output "My_ip"{
   value = aws_instance.my_ec2.public_ip
} 

resource "aws_security_group" "my_security_group" {
  name        = "my_security_group"
  description = "Security Group para SSH y HTTP"
 
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

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9090
    to_port     = 9090
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
