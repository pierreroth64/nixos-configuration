{
  config,
  pkgs,
  inputs,
  ...
}:

{
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    image = ../../assets/sanchese.jpg;
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    #TODO: restore desired (disabled these lines when upgrading to 25.05)
    # fonts.packages = with pkgs; [
    #   nerd-fonts.fira-code
    # ];
    opacity.terminal = 1.0;
  };
}
