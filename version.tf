terraform {
  required_providers {
    okta = {
      source  = "okta/okta"
      version = "~> 6.5.0" # Match the version you saw in your logs
    }
  }
}