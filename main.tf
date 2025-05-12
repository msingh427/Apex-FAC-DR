
module "rg" {
  source   = "../../module/rg"
  for_each = var.resource_groups
  rg_name  = each.value.name
  location = each.value.location
}

module "network" {
  source    = "../../module/network"
  for_each  = var.virtual_networks
  vnet_name = each.value.name
  # subnet_names = each.value.subnets
  rg_name  = each.value.rg_name
  location = each.value.location
  depends_on = [ module.rg ]
}

module "app_gateway" {
  source      = "../../module/appgateway"
  for_each    = var.application_gateways
  appgw_name  = each.value.name
  rg_name     = each.value.rg_name
  vnet_name   = each.value.vnet_name
  subnet_name = each.value.subnet_name
  location    = each.value.location
  subnet_id   = lookup(module.network["vnet1"].subnet_ids, each.value.subnet_name, null)
}
