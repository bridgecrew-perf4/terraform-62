# Installation

## Install aws-cli
{
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
    aws --version
}

## export profile
{
    echo 'export AWS_ACCESS_KEY_ID=<PASTE HERE>' >> ~/.bashrc
    echo 'export AWS_SECRET_ACCESS_KEY=<PASTE HERE>'  >> ~/.bashrc
    echo 'export AWS_DEFAULT_REGION=us-west-2' >> ~/.bashrc
    source ~/.bashrc
}

## Install aws ekstl
{
    curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
    sudo mv /tmp/eksctl /usr/local/bin
    eksctl version
}

## Install Hashicorp terraform
{
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    sudo apt install terraform
}
