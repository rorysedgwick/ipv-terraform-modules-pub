data "local_file" "firewall_rules" {
  count    = length(var.allow_rules_file) > 1 ? 1 : 0
  filename = var.allow_rules_file
}
