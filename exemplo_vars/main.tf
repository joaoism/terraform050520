### Strings, Listas, maps e Objetos

##- **Strings**

variable "var_string" {
  type = string
}

##- **Listas**

variable "zonas_disponiveis" {
  type    = list(string)
  default = ["us-central1-a","us-central1-b","us-central1-c"]
}

##- **Map**

variable "planos" {
  type = map
  default = {
    "small"  = "1xCPU-1GB"
    "medium" = "1xCPU-2GB"
    "large" = "2xCPU-4GB"
  }
}

## **Object**

variable "docker_ports" {
  type = list(object({
    internal = number
    external = number
    protocol = string
  }))
  default = [
    {
      internal = 8100
      external = 8300
      protocol = "tcp"
    }
  ]
}

## Acessando variáveis

output "var_string" {
  value = var.var_string
}

output "var_zonas" {
  value = var.zonas_disponiveis[1]
}

output "var_planos" {
  value = var.planos["medium"]
}

output "var_docker_ports" {
  value = var.docker_ports[0]["internal"]
}
