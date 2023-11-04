# resource tls_private_key main {
#   algorithm = "RSA"
#   rsa_bits  = 2048
# }



# resource local_file public_key {
#   content = tls_public_key.main.public_key_openssh
#   filename = "${path.module}/id_rsa.pub"
# }

# resource local_file private_key {
#   content = tls_private_key.main.private_key_openssh
#   filename = "${path.module}/id_rsa"
# }








# resource azurerm_key_vault_secret ssh_public_key {
#   key_vault_id = azurerm_key_vault.main.id
#   name         = "ssh-public"
#   value        = tls_private_key.main.public_key_openssh
# }

# resource azurerm_key_vault_secret ssh_private_key {
#   key_vault_id = azurerm_key_vault.main.id
#   name         = "ssh-private"
#   value        = tls_private_key.main.private_key_pem
# }













