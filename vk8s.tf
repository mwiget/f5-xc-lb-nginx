resource "volterra_virtual_k8s" "cluster" {
    name      = format("%s-vk8s", var.projectPrefix)
    namespace = var.namespace
    depends_on = [ volterra_namespace.ns ]
}
