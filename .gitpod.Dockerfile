FROM gitpod/workspace-base

RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - \
      && sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
      && sudo apt-get update && sudo apt-get install terraform \
      && wget --quiet -O terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/v0.37.1/terragrunt_linux_amd64 \
      && chmod +x terragrunt \
      && sudo mv terragrunt /usr/local/bin/ \
      && curl -sLO "https://vesio.azureedge.net/releases/vesctl/$(curl -s https://downloads.volterra.io/releases/vesctl/latest.txt)/vesctl.linux-amd64.gz" \
      && gzip -d  vesctl.linux-amd64.gz \
      && chmod +x vesctl.linux-amd64 \
      && sudo mv  vesctl.linux-amd64 /usr/local/bin/vesctl
