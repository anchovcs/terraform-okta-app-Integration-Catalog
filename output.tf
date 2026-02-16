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