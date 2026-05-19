{
    packageOverrides = pkgs: with pkgs; {
        myPackages = pkgs.buildEnv {
            name = "my-tools";
            paths = [
                neovim
                nodejs_22
                delta
                fd
                ripgrep
                fzf
                lazygit
                zsh
                oh-my-zsh
                zsh-powerlevel10k
            ];
        };
    };
}