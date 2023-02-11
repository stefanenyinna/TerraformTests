provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "hello_world" {
    ami = "ami-09cd747c78a9add63"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.instance.id]

    user_data = <<-EOF
        #!/bin/bash
        echo 'Hello World' > index.html
        nohup busybox httpd -f -p 8080 &
        EOF

    user_data_replace_on_change = true

    tags = {
        Name = "Hello World"
    }
}

resource "aws_security_group" "instance" {
    name = "HWSecurity Group"

    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}