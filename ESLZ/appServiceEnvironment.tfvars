AppServiceEnvironment = {
  test = {
    resource_group = "Project"
    subnet         = "OZ2"

    # Optional: Uncomment to set any of those values from the defaults
    # allow_new_private_endpoint_connections = false
    # internal_load_balancing_mode           = "Web, Publishing"
    # dedicated_host_count                   = 2
    # remote_debugging_enabled               = false
    # zone_redundant                         = false

    # Optional: Uncomment these to set cluster settings. If you do, then the FrontEndSSLCipherSuiteOrder is required
    # cluster_setting = [
    #   {
    #     name  = "FrontEndSSLCipherSuiteOrder"
    #     value = "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256"
    #   },
    #   {
    #     name  = "DisableTls1.0"
    #     value = "1"
    #   }
    # ]

    # Optional: Uncomment if you want to set the DNS records in a specific DNS zone. 
    # dns_zone = {
    #   name = ""
    #   resource_group = ""
    #   ttl = 60
    # }
  }
}
