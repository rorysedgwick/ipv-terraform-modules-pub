data "external" "template_data" {
  program = ["bash", "${path.module}/get_template_version.sh"]

  query = {
    template_bucket  = var.template.bucket
    template_object  = var.template.object
    template_version = var.template.version
  }
}
