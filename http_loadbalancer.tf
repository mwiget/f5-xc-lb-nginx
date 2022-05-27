resource "volterra_http_loadbalancer" "webserver" {
  name                            = format("%s-webserver", var.projectPrefix)
  namespace                       = var.namespace
  no_challenge                    = true
  domains                         = [var.fqdn]
  advertise_on_public_default_vip = true

  disable_rate_limit              = true
  service_policies_from_namespace = true
  disable_waf                     = true

  https_auto_cert {
    http_redirect = true
  }

  default_route_pools {
    pool {
      namespace = var.namespace
      name = volterra_origin_pool.webserver.name
    }
  }

  depends_on = [ volterra_origin_pool.webserver, volterra_namespace.ns ]
}
