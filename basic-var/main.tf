variable "username" {
    type = string
    default = "dalongdemo"
}

variable "userinfo" {
    type = map
    default =  {
        name = "dalong"
        age =44
        version = "v1.0"
    }
}
output "username" {
    value = var.username
}

locals {
    service_name ="dalongapp"
}

output "filecontent" {
    value = data.local_file.foo.content
}


output "service_info" {
    value = local.service_name
}
data "local_file" "foo" {
    filename = "${path.module}/foo.bar"
}
resource "local_file" "foo2" {
    content  =  jsonencode(var.userinfo)
    filename = "tf-result/userinfo.json"
}