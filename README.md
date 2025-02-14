## my nixos configuration

### Disclaimer

You may find complex nixos configurations on the Internet.
I try to keep mine simple for 2 reasons:

- I still do not know what I am doing with nix :stuck_out_tongue_winking_eye:
- My use case is simple: I want to be able to setup a new machine as quick as possible on hardware crash.

### Strategy

[home-manager](https://github.com/nix-community/home-manager) is of course used to deal with user dot files.
However, as it also enables to install software on a per-user basis, I found this approach useful for me: I can add a user for a family member or friend with a controlled list of apps.
For example, my sons do not care (yet) about programming. Why then exposing them a useless code editor?

### Implementation

- Modules located in `./modules/home` are home-manager ones.
- Modules located in `./modules/system` are system-wide nixos ones.
- Modules located in `./hardware/scanned` are a verbatim copy of hardware scan during nixos installation.
- Modules located in `./hardware` are the ones configuring the hardware (bootloader, audio, etc...)
