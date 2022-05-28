resource "volterra_origin_pool" "webserver" {
  name                   = format("%s-webserver", var.projectPrefix)
  namespace              = var.namespace
  endpoint_selection     = "LOCAL_PREFERRED"
  loadbalancer_algorithm = "LB_OVERRIDE"
  port                   = 8080
  no_tls                 = true

  origin_servers {
    k8s_service {
      service_name  = format("webserver.%s", var.projectPrefix)
      vk8s_networks = true
      site_locator {
        site {
          name      = volterra_virtual_site.vs.name
          namespace = var.namespace
        }
      }
    }
  }
  healthcheck {
    name = format("%s-webserver", var.projectPrefix)
  }
  depends_on = [ volterra_virtual_k8s.cluster, volterra_virtual_site.vs ]
}
