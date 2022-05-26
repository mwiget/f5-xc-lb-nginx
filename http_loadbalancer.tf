resource "volterra_http_loadbalancer" "staticnginx" {
  name                            = format("%s-staticnginx", var.projectPrefix)
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

  routes {
    simple_route {
      http_method = "ANY"
      path {
        prefix = "/"
      }
      origin_pools {
        pool {
          namespace = var.namespace
          name = volterra_origin_pool.staticnginx.name
        }
      }
      advanced_options {
        web_socket_config {
          use_websocket = true
        }
      }
    }
  }
  depends_on = [ volterra_origin_pool.staticnginx, volterra_namespace.ns ]
}
