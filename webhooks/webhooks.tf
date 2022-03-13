module "webhook" {
  source  = "tedilabs/modules/github//modules/webhook"
  version = "~> 0.7.0"

  for_each = {
    for webhook in local.config.webhooks :
    webhook.url => webhook
  }

  url          = each.key
  content_type = try(each.value.content_type, "JSON")
  ssl_enabled  = try(each.value.ssl_enabled, true)
  secret       = try(each.value.secret, "")

  repositories = try(each.value.repositories, ["*"])
  events       = try(each.value.events, ["push"])

  enabled = try(each.value.enabled, true)
}
