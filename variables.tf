# variable "permission_sets" {
#   type = list(object({
#     name               = string
#     description        = string
#     relay_state        = string
#     session_duration   = string
#     tags               = map(string)
#     inline_policy      = string
#     policy_attachments = list(string)
#     customer_managed_policy_attachments = list(object({
#       name = string
#       path = string
#     }))
#   }))

#   default = []
# }

variable "aws_region" {
    default = "ap-southeast-1"
    type = string
}

variable "permission_set_name" {
    default = "null"
    type = string
}