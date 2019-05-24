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

output "filecontent" {
    value = data.local_file.foo.content
}

data "local_file" "foo" {
    filename = "${path.module}/foo.bar"
}
resource "local_file" "foo2" {
    content  =  jsonencode(var.userinfo)
    filename = "tf-result/userinfo.json"
}