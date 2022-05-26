resource "volterra_origin_pool" "staticnginx" {
  name                   = format("%s-staticnginx", var.projectPrefix)
  namespace              = var.namespace
  endpoint_selection     = "LOCAL_PREFERRED"
  loadbalancer_algorithm = "LB_OVERRIDE"
  port                   = 8080
  no_tls                 = true

  origin_servers {
    k8s_service {
      service_name  = "staticnginx"
      vk8s_networks = true
      site_locator {
        site {
          name      = volterra_virtual_k8s.cluster.name
          namespace = "system"
        }
      }
    }
  }
  healthcheck {
    name = format("%s-staticnginx", var.projectPrefix)
  }
  depends_on = [ volterra_virtual_k8s.cluster ]
}
