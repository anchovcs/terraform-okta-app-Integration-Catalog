output "app_id" {
  value = var.app_type == "saml" ? okta_app_saml.samlapp[0].id : okta_app_oauth.oidcapp[0].id
}