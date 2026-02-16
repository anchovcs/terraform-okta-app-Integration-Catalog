# Create SAML App ONLY if app_type is "saml"
resource "okta_app_saml" "samlapp" {
  count  = var.app_type == "saml" ? 1 : 0
  label  = var.app_label
  sso_url     = var.sso_url
  recipient   = var.sso_url
  destination = var.sso_url
  audience    = var.audience
  
  subject_name_id_template = "$${user.userName}"
  subject_name_id_format   = "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress"
  signature_algorithm      = "RSA_SHA256"
  digest_algorithm         = "SHA256"
  authn_context_class_ref  = "urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport"
  # --------------------------------
  # Standard User Claims (Attribute Statements)
  attribute_statements {
    name   = "email"
    values = ["user.email"]
  }

#   # Group Membership Claim (The "Group Attribute Statement")
#   attribute_statements {
#     type         = "GROUP"
#     name         = "groups"
#     filter_type  = "REGEX"
#     filter_value = ".*" # This sends all groups assigned to the user
#   }
# }
}
# Assign Groups to the SAML App
resource "okta_app_group_assignment" "saml_groups" {
  for_each = var.app_type == "saml" ? toset(var.group_ids) : []
  
  app_id   = okta_app_saml.samlapp[0].id
  group_id = each.value
}



# Create OIDC App ONLY if app_type is "oidc"
resource "okta_app_oauth" "oidcapp" {
  count          = var.app_type == "oidc" ? 1 : 0
  label          = var.app_label
  type           = "web"
  grant_types    = ["authorization_code"]
  redirect_uris  = var.redirect_uris
  response_types = ["code"]
}

# The Automated "Grant Consent" Resource
resource "okta_app_oauth_api_scope" "scopes" {
  # This creates one grant per scope in the list
  for_each   = var.app_type == "oidc" ? toset(var.scopes) : []
  
  app_id     = okta_app_oauth.oidcapp[0].id
  issuer     = "https://trial-3738467.okta.com"
  scopes     = [each.value]
}