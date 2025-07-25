{
  pkgs,
  inputs,
  config,
  ...
}:
{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  sops.defaultSopsFile = ../../secrets/secrets.json;
  sops.defaultSopsFormat = "yaml";
  sops.age.keyFile = "/home/peio/.config/sops/age/keys.txt";
  sops.secrets."users/peio/github/token" = {
    owner = config.users.users.peio.name;
    mode = "0440";
    group = config.users.users.peio.group;
  };
  sops.templates."nix.env" = {
    content = ''
      GITHUB_TOKEN=${config.sops.placeholder."users/peio/github/token"}
      NIX_NPM_TOKENS={"npm.pkg.github.com":"${config.sops.placeholder."users/peio/github/token"}"}
      SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
      NIX_SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
    '';
  };

  environment = {
    systemPackages = with pkgs; [
      sops
    ];
  };

  systemd.services.nix-daemon.serviceConfig = {
    EnvironmentFile = config.sops.templates."nix.env".path;
  };
}
