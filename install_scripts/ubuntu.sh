refresh_repo () {
    echo "Refreshing repo..."
    sudo apt update
}

install_fish() {
    refresh_repo
    echo "Installing fish..."
    sudo apt install fish -y
    echo "Success"
    read -p "Install oh-my-fish ? (y/n) [n] " ok
    case $ok in
        [yY]*)
            curl -L https://get.oh-my.fish | fish
            echo "Success"
            ;;
        *)
            echo "No modification"
            ;;
    esac
    read -p "Set to default shell ? (y/n) [n] " ok
    case $ok in
        [yY]*)
            FISH_BIN=`which fish`
            chsh -s "$FISH_BIN" "$USER"
            echo "Success"
            ;;
        *)
            echo "No modification"
            ;;
    esac
    read -p "Install agnoster theme ? (y/n) [n] " ok
    case $ok in
        [yY]*)
            fish -c "omf install agnoster"
            echo "Success"
            ;;
        *)
            echo "No modification"
            ;;
    esac
}

install_zsh() {
    refresh_repo
    echo "Installing zsh..."
    sudo apt install zsh -y
    echo "Success"
    read -p "Install oh-my-zsh ? (y/n) [n] " ok
    case $ok in
        [yY]*)
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
            echo "Success"
            ;;
        *)
            echo "No modification"
            ;;
    esac
    read -p "Set to default shell ? (y/n) [n] " ok
    case $ok in
        [yY]*)
            ZSH_BIN=`which zsh`
            chsh -s "$ZSH_BIN" "$USER"
            echo "Success"
            ;;
        *)
            echo "No modification"
            ;;
    esac
}

install_neovim () {
    sudo add-apt-repository ppa:neovim-ppa/unstable -y
    refresh_repo
    sudo apt-get install neovim -y
    echo "Success"
    read -p "Install custom config (Warning : Erase old conf) ? (y/n) [n] " ok
    case $ok in
        [yY]*)
            rm -rf ~/.config/nvim
            mkdir -p ~/.config/nvim
            cp -r ./configs/nvim/* ~/.config/nvim
            refresh_repo
            sudo apt install ripgrep -y
            ;;
        *)
            echo "No modification"
            ;;
    esac
}


start () {
    read -p "Select you shell. (0 - current, 1 - fish, 2 - zsh) [0] " shell
    case $shell in
        "1")
            install_fish
            ;;
        "2")
            install_zsh
            ;;
        *)
            echo "No modification"
            ;;
    esac
    read -p "Install nvim 0.5 ? (y/n) [n] " ok
    case $ok in
        [yY]*)
            install_neovim
            ;;
        *)
            echo "No modification"
            ;;
    esac
}
