resource "volterra_virtual_site" "vs" {
  name      = format("%s-all-re", var.projectPrefix)
  namespace = var.namespace

  site_selector {
    expressions = ["ves.io/siteName"]
  }

  site_type = "REGIONAL_EDGE"

  depends_on = [ volterra_namespace.ns ]
}

