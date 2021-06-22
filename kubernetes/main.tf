/*resource "azurerm_log_analytics_workspace" "analytics_workspace" {
  name                = "${var.kubernetes_cluster_name}-analytics"
  location            = "${var.resouce_group_location}"
  resource_group_name = "${var.resource_group_name}"
  sku                 = "${var.analytics_sku}"
  retention_in_days   = "${var.retention_in_days}"
}

resource "azurerm_log_analytics_solution" "analytics_solution" {
  solution_name         = "ContainerInsights"
  location              = "${var.resouce_group_location}"
  resource_group_name   = "${var.resource_group_name}"
  workspace_resource_id = "${azurerm_log_analytics_workspace.analytics_workspace.id}"
  workspace_name        = "${azurerm_log_analytics_workspace.analytics_workspace.name}"

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}

resource "azurerm_kubernetes_cluster" "kubernetes_cluster" {
  name                = "${var.kubernetes_cluster_name}"
  location            = "${var.resouce_group_location}"
  resource_group_name = "${var.resource_group_name}"
  dns_prefix          = "${var.dns_prefix}"  

  default_node_pool {
    name            = "default"
    count           = "${var.vm_count}"
    vm_size         = "${var.vm_size}"
    os_type         = "${var.os_type}"
    os_disk_size_gb = "${var.os_disk_size_gb}"
  }

  service_principal {
    client_id     = "${var.client_id}"
    client_secret = "${var.client_secret}"
  }

  addon_profile {
        oms_agent {
        enabled                    = true
        log_analytics_workspace_id = "${azurerm_log_analytics_workspace.analytics_workspace.id}"
        }
    }
}*/
resource "azurerm_log_analytics_workspace" "analytics_workspace" {
  name                = "${var.kubernetes_cluster_name}-analytics"
  location            = "${var. resouce_group_location}"
  resource_group_name = "${var.resource_group_name}"
  sku                 = "${var.analytics_sku}"
  retention_in_days   = "${var.retention_in_days}"
}

resource "azurerm_log_analytics_solution" "analytics_solution" {
  solution_name         = "ContainerInsights"
  location              = "${var. resouce_group_location}"
  resource_group_name   = "${var.resource_group_name}"
  workspace_resource_id = "${azurerm_log_analytics_workspace.analytics_workspace.id}"
  workspace_name        = "${azurerm_log_analytics_workspace.analytics_workspace.name}"

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}

/*resource "azurerm_kubernetes_cluster" "kubernetes_cluster" {
  name                = "${var.kubernetes_cluster_name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  dns_prefix          = "${var.dns_prefix}"  

  default_node_pool {
    name            = "default"
    node_count      = "${var.vm_count}"
    vm_size         = "${var.vm_size}"
   # os_type         = "${var.os_type}"
    os_disk_size_gb = "${var.os_disk_size_gb}"
  }

  service_principal {
    client_id     = "${var.client_id}"
    client_secret = "${var.client_secret}"
  }

  addon_profile {
        oms_agent {
        enabled                    = true
        log_analytics_workspace_id = "${azurerm_log_analytics_workspace.analytics_workspace.id}"
        }
    }
}*/
resource "azurerm_kubernetes_cluster" "kubernetes_cluster" {
    name                = "${var.kubernetes_cluster_name}"
    location            = "${var. resouce_group_location}"
    resource_group_name = "${var.resource_group_name}"
    dns_prefix          = "${var.dns_prefix}"

    /*linux_profile {
        admin_username = "ubuntu"

        ssh_key {
            key_data = file(var.ssh_public_key)
        }
    }*/

    default_node_pool {
        name            = "default"
        node_count      = "${var.vm_count}"
        vm_size         = var.vm_size
    }

    service_principal {
        client_id     = var.client_id
        client_secret = var.client_secret
    }

    addon_profile {
        oms_agent {
        enabled                    = true
        log_analytics_workspace_id ="${azurerm_log_analytics_workspace.analytics_workspace.id}"
        }
    }

    network_profile {
        load_balancer_sku = "Standard"
        network_plugin = "kubenet"
    }

    /*tags = {
        Environment = "Development"
    }*/
}