# TODO
### Install git
  * Configure git globals
  * Configure git-credentials cache

### Install Brew

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew install git grip wget

### Install Vim Pathogen

    mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

### Install vim-markdown-preview

    cd ~/.vim/bundle/
    git clone https://github.com/JamshedVesuna/vim-markdown-preview
    
### Install .vimrc

    cp ./.vimrc ~/

### Install Anaconda

    wget https://repo.anaconda.com/archive/Anaconda3-2020.11-MacOSX-x86_64.sh
    bash Anaconda3-2020.11-MacOSX-x86_64.sh

### Install .bash_profile customizations

    cat ./.bash_profile >> ~/.bash_profile
    . ~/.bash_profile
    touch ~/.bash_sessions_disable
    rm -rf ~/.bash_sessions

### Install Conda Forge

    conda config --add channels conda-forge
    conda config --set channel_priority strict

### Install default Conda environment

    conda create -n dev38 python=3.8 pandas scipy numpy dask requests boto3 awscli matplotlib notebook flake8 black isort

### Install Terraform

