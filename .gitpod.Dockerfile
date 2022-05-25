FROM gitpod/workspace-base

RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - \
      && sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
      && sudo apt-get update && sudo apt-get install terraform \
      && curl -LO "https://vesio.azureedge.net/releases/vesctl/$(curl -s https://downloads.volterra.io/releases/vesctl/latest.txt)/vesctl.linux-amd66.gz" \
      && curl -LO "https://vesio.azureedge.net/releases/vesctl/$(curl -s https://downloads.volterra.io/releases/vesctl/latest.txt)/vesctl.linux-amd64.gz"
      && gzip -d  vesctl.linux-amd64.gz \
      && chmod +x vesctl.linux-amd64 \
      && sudo mv  vesctl.linux-amd64 /usr/local/bin/vesctl
