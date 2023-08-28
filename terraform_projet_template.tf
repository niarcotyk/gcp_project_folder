  locals {
	akeneo_project      = "example_project"
	env                 = "sdx"
	viewer_members      = "group:dodo-squad@akeneo.com"
	impersonate_members = "group:dodo-squad@akeneo.com"
	admin_members       = "group:dodo-squad@akeneo.com"
	folder_id           = "823637986681"
	folder_name         = "example-proj"
  }

  module "project" {
	source         = "../../../../modules/project"
	project_id     = "akecld-prd-${local.akeneo_project}-${local.env}"
	project_name   = "${local.akeneo_project}-${local.env}"
	folder_id      = local.folder_id
	env_name       = local.env
	app_name       = local.akeneo_project
	viewer_members = local.viewer_members
	admin_members  = local.admin_members
  }

  terraform {
	backend "gcs" {
	  bucket = "akecld-terraform-product-apps"
	  prefix = "projects/${local.folder_name}/akecld-prd-${local.akeneo_project}-${local.env}"
	}
	required_version = "= 1.1.3"
  }
