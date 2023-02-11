provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
    ami = "ami-09cd747c78a9add63"
    instance_type = "t2.micro"

    tags = {
      Name = "Test1"
    }
}