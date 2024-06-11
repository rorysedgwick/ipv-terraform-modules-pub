locals {
  template_tags = {
    Template_Version    = data.external.template_data.result.version
    Template_Repository = data.external.template_data.result.repo
    Template_Commit_SHA = data.external.template_data.result.commit_sha
    Template_Version_ID = data.external.template_data.result.version_id
    Template_ETAG       = data.external.template_data.result.etag
  }

  version_id = data.external.template_data.result.version_id
}
