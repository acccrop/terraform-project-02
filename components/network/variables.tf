variable "environment" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "vpc" {
  type = object({
    availability_zones = list(string)
    cidr = object({
      vpc             = string
      private_subnets = list(string)
      public_subnets  = list(string)
    })
  })
}