output "app_id" {
  value = var.app_type == "saml" ? okta_app_saml.samlapp[0].id : okta_app_oauth.oidcapp[0].id
}

output "client_id" {
  value = var.app_type == "oidc" ? okta_app_oauth.oidcapp[0].client_id : null
}

output "client_secret" {
  value     = var.app_type == "oidc" ? okta_app_oauth.oidcapp[0].client_secret : null
  sensitive = true
}

output "saml_metadata_url" {
  description = "The URL for the IdP metadata"
  value       = var.app_type == "saml" ? okta_app_saml.samlapp[0].metadata_url : null
}

output "saml_metadata_xml" {
  description = "The raw XML metadata (Sensitive)"
  value       = var.app_type == "saml" ? okta_app_saml.samlapp[0].metadata : null
  sensitive   = true
}