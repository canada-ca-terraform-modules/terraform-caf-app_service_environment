locals {
  anti-pattern-regex = "/[//\"'\\[\\]:|<>+=;,?*@&]/"
  ase-name = replace("${var.env}-${var.group}-${var.project}-${var.userDefinedString}-ase", local.anti-pattern-regex, "")
}