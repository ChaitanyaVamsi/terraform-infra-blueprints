resource "aws_instance" "web_server" {
  ami = ""
  instance_type = "t3.micro"
  tags = {
    Name = "app_server"
  }

  provisioner "local-exec" {
      command = "echo ${self.public_ip} > ip_list.txt"
  }

   provisioner "local-exec" {
    when = destroy
    command = "echo instance deleted > instanceStatus.txt"
  }

  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("your_path_goes_here")
    host = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo dnf install -y nginx",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]
  }

  provisioner "remote-exec" {
    inline = [

      "sudo systemctl stop nginx",
      "echo shutting down"
    ]
    when = destroy
  }
}

# In Terraform, provisioners are used to run scripts or commands on a resource after it is created.
# There are two main types:
# local-exec - runs commands on your local machine, for example, saving the instance IP to a file.
# remote-exec - runs commands on the instance itself via SSH, for example, installing software or starting services.
# You can also use when = destroy to run commands when a resource is deleted.
# Provisioners are usually a last resort; for larger setups, we prefer user_data or configuration management tools like Ansible.