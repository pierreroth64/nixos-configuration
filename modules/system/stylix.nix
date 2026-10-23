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
    override = {
      base08 = "d35c5c";
    };
    image = ../../assets/sanchese.jpg;
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    opacity.terminal = 1.0;
  };
}
