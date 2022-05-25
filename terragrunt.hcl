terraform {
    extra_arguments "volterra" {
        commands = ["apply","plan","destroy"]
        arguments = []
        env_vars = {
            VOLT_API_URL     = "https://playground.staging.volterra.us/api"
            VOLT_API_P12_FILE = "/workspace/f5-xc-lb-nginx/.secrets/playground.staging.api-creds.p12"
            VOLT_API_CA_CERT  = "/workspace/f5-xc-lb-nginx/.secrets/public_server_ca.crt"
        }
    }

    # after_hook "experiment" {
    #     commands = ["apply","plan","destroy"]
    #     execute  = ["echo","-----------------!!!!!!!!!!!!!!!!! SUPER DONE !!!!!!!!!!!!!!!!!-----------------"]
    # }

}

inputs = {
    projectPrefix          = "mwlb"
    namespace              = "mwlb"
}
