variable "env" {
  type = string
}

data "template_file" "conditional" {
    template = file("./vm/condi.json")
    vars = {
      "value" = var.env == "prod" ? "Producao" : "Qualidade"
    }
}

output "conditional" {
    value = data.template_file.conditional.*.rendered
}
}
