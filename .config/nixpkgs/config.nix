{
    packageOverrides = pkgs: with pkgs; {
        myPackages = pkgs.buildEnv {
            name = "my-tools";
            paths = [    
                zsh
                oh-my-zsh
                zsh-powerlevel10k
                git
                python3
                nodejs_22
                delta
                fd
                ripgrep
                fzf
                neovim
                luajit
                luarocks
                tree-sitter
                lazygit
            ];
        };
    };
}
