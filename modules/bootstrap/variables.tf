variable "global_tags" {
  description = "Map of arbitrary tags to apply to all resources."
  default     = {}
  type        = map(any)
}

variable "prefix" {
  description = "The prefix to use for bucket name, IAM role name, and IAM role policy name. It is allowed to use dash \"-\" as the last character."
  default     = "bootstrap-"
  type        = string
}

variable "iam_instance_profile_name" {
  description = "Name of the instance profile to create. If empty, name will be auto-generated."
  default     = ""
  type        = string
}

variable "force_destroy" {
  description = "Set to false to prevent Terraform from destroying a bucket with unknown objects or locked objects."
  default     = true
  type        = bool
}

variable "source_root_directory" {
  description = "The source directory to be copied recursively onto the bucket's root directory. Examples: \"/home/me/bucket\" or \"$${path.root}/files\""
  type        = string

  validation {
    condition     = !contains(fileset(var.source_root_directory, "**"), "config/init-cfg.txt")
    error_message = "Please remove disallowed file 'config/init-cfg.txt' from under this directory, and instead specify here the inputs like `panorama-server`, etc."
  }
}

variable "bootstrap_directories" {
  description = "The directories comprising the bootstrap package."
  default = [
    "config/",
    "content/",
    "software/",
    "license/",
    "plugins/"
  ]
}

### Variables below go to the init-cfg.txt
variable "hostname" {
  description = "The hostname of the VM-series instance."
  default     = ""
  type        = string
}

variable "panorama-server" { # tflint-ignore: terraform_naming_convention # TODO rename to snake_case
  description = "The FQDN or IP address of the primary Panorama server."
  default     = ""
  type        = string
}

variable "panorama-server2" { # tflint-ignore: terraform_naming_convention # TODO rename to snake_case
  description = "The FQDN or IP address of the secondary Panorama server."
  default     = ""
  type        = string
}

variable "tplname" { # tflint-ignore: terraform_naming_convention # TODO rename to snake_case
  description = "The Panorama template stack name."
  default     = ""
  type        = string
}

variable "dgname" { # tflint-ignore: terraform_naming_convention # TODO rename to snake_case
  description = "The Panorama device group name."
  default     = ""
  type        = string
}

variable "dns-primary" { # tflint-ignore: terraform_naming_convention # TODO rename to snake_case
  description = "The IP address of the primary DNS server."
  default     = ""
  type        = string
}

variable "dns-secondary" { # tflint-ignore: terraform_naming_convention # TODO rename to snake_case
  description = "The IP address of the secondary DNS server."
  default     = ""
  type        = string
}

variable "vm-auth-key" { # tflint-ignore: terraform_naming_convention # TODO rename to snake_case
  description = "Virtual machine authentication key."
  default     = ""
  type        = string
}

variable "op-command-modes" { # tflint-ignore: terraform_naming_convention # TODO rename to snake_case
  description = "Set jumbo-frame and/or mgmt-interface-swap."
  default     = ""
  type        = string
}
