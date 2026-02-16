<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_okta"></a> [okta](#requirement\_okta) | ~> 6.5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_okta"></a> [okta](#provider\_okta) | ~> 6.5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [okta_app_group_assignment.saml_groups](https://registry.terraform.io/providers/okta/okta/latest/docs/resources/app_group_assignment) | resource |
| [okta_app_oauth.oidcapp](https://registry.terraform.io/providers/okta/okta/latest/docs/resources/app_oauth) | resource |
| [okta_app_oauth_api_scope.scopes](https://registry.terraform.io/providers/okta/okta/latest/docs/resources/app_oauth_api_scope) | resource |
| [okta_app_saml.samlapp](https://registry.terraform.io/providers/okta/okta/latest/docs/resources/app_saml) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_label"></a> [app\_label](#input\_app\_label) | Display name for the application | `string` | n/a | yes |
| <a name="input_app_type"></a> [app\_type](#input\_app\_type) | Type of application to create: 'saml' or 'oidc' | `string` | n/a | yes |
| <a name="input_audience"></a> [audience](#input\_audience) | n/a | `string` | `"https://example.com/metadata"` | no |
| <a name="input_redirect_uris"></a> [redirect\_uris](#input\_redirect\_uris) | OIDC Specifics | `list(string)` | <pre>[<br/>  "https://example.com/callback"<br/>]</pre> | no |
| <a name="input_scopes"></a> [scopes](#input\_scopes) | The list of Okta API scopes to grant to the OIDC application (e.g., okta.users.manage). | `list(string)` | <pre>[<br/>  "openid",<br/>  "profile",<br/>  "email"<br/>]</pre> | no |
| <a name="input_sso_url"></a> [sso\_url](#input\_sso\_url) | SAML Specifics | `string` | `"https://example.com"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_id"></a> [app\_id](#output\_app\_id) | n/a |
| <a name="output_client_id"></a> [client\_id](#output\_client\_id) | n/a |
| <a name="output_client_secret"></a> [client\_secret](#output\_client\_secret) | n/a |
| <a name="output_saml_metadata_url"></a> [saml\_metadata\_url](#output\_saml\_metadata\_url) | The URL for the IdP metadata |
| <a name="output_saml_metadata_xml"></a> [saml\_metadata\_xml](#output\_saml\_metadata\_xml) | The raw XML metadata (Sensitive) |
<!-- END_TF_DOCS -->