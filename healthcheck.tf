resource "volterra_healthcheck" "webserver" {
  name      = format("%s-webserver", var.projectPrefix)
  namespace = var.namespace

  http_health_check {
    use_origin_server_name = true
    path                   = "/"
  }
  healthy_threshold   = 1
  interval            = 15
  timeout             = 1
  unhealthy_threshold = 2

  depends_on = [ volterra_namespace.ns ]
}
