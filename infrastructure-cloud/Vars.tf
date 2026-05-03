variable "region" {
  default = "us-east-1"
}

variable "zone1" {
  default = "us-east-1a"
}

variable "amiID" {
  type = map(any)
  default = {
    "us-east-1" = "ami-00403f401ee6a4b98"
    "us-west-2" = "ami-0b898040803850657"
    "eu-west-1" = "ami-047bb4163c506cd98"
  }
}