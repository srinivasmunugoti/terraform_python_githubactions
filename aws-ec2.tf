#custom security group with custom ingress rules

resource "aws_security_group" "sg_my_security_group" {
  name        = "sg_my_security_group"
  description = "Implements some security"
  vpc_id      = module.vpc.vpc_id

  ingress {
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
    Name = "my sg"
  }
}

# key pair generation
/*
resource "aws_key_pair" "tf-key-pair" {
key_name = "tf-key-pair2"
public_key = tls_private_key.rsa.public_key_openssh
}
resource "tls_private_key" "rsa" {
algorithm = "RSA"
rsa_bits  = 4096
}
resource "local_file" "tf-key" {
content  = tls_private_key.rsa.private_key_pem
filename = "tf-key-pair2"
}
*/
 
# instance launch with customization 

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.3.1"
  
  name = "jenkinsinstance"
  ami="ami-0a3c3a20c09d6f377"
  instance_type          = "t2.medium"
  key_name               = "allinone"
  monitoring             = false
  vpc_security_group_ids = [aws_security_group.sg_my_security_group.id]
  subnet_id              = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}



#custom security group with custom ingress rules

/*resource "null_resource" "copy_files" {
  provisioner "file" {
    source      = "scripts"
    destination = "/home/ubuntu/scripts"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ubuntu/scripts/ansible-install.sh",
      "sudo  sh /home/ubuntu/scripts/ansible-install.sh",
    ]
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("tf-key-pair")
    host        = "52.87.159.100"
  }
} 

*/
