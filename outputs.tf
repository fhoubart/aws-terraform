output "website1_address" {
    value = "http://${module.webserver1.website_address}"
}

output "website2_address" {
    value = "http://${module.webserver2.website_address}"
}