variable "ami_id"{
    type = string
    default = "ami-0868dcfe959a48f15"
    description = "RHEL 8.7 image for us-east-1 region"

}

variable "instance_type" {

    type = string
    default = "t3.micro"

  
}

variable "Hosted_zone_id_QA" {

    type = string
    default = "Z019184425TWL87B91K51"
  
}

variable "domain_name" {

    type = string
    default = "sndp.online"
  
}



variable "ec2_names_qa" {

    type = list(string)

    default = ["kubernetes"]
  
}

variable "ec2_tags" {

    type = map(string)
    default = {
        project = "Roboshop"
        env = "QA"
    }

  
}