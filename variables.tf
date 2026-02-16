variable "app_type" {
  description = "Type of application to create: 'saml' or 'oidc'"
  type        = string
}

variable "app_label" {
  description = "Display name for the application"
  type        = string
}

# SAML Specifics
variable "sso_url" {
  type    = string
  default = "https://example.com"
}

variable "audience" {
  type    = string
  default = "https://example.com/metadata"
}

# OIDC Specifics
variable "redirect_uris" {
  type    = list(string)
  default = ["https://example.com/callback"]
}

variable "scopes" {
  type        = list(string)
  description = "The list of Okta API scopes to grant to the OIDC application (e.g., okta.users.manage)."
  default     = ["openid", "profile", "email"]
}

variable "group_ids" {
  type    = list(string)
  default = []
}