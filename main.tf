terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
    }
  }

  backend "remote" {
    organization = "jkbis-ltd"

    workspaces {
      name = "gh-actions-demo"
    }
  }
}

provider "snowflake" {
	role  = "SYSADMIN"
	region = "eu-west-2.aws"
}


resource "snowflake_database" "demo_db" {
  name    = "DEMO_DB"
  comment = "Database for Snowflake Terraform demo"
}