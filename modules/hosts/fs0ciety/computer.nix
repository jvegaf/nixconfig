{
  den.aspects.fs0ciety-computer = {
    nixos =
      {
        pkgs,
        config,
        ...
      }:
      {
        imports = [
          ./_hardware.nix
        ];

        boot.kernelPackages = pkgs.linuxPackages_latest;

        boot.loader = {
          efi.canTouchEfiVariables = true;
          systemd-boot.enable = true;
          timeout = 5;

          grub = {
            enable = false;
            device = "nodev";
            efiSupport = true;
            efiInstallAsRemovable = false;
            useOSProber = true;
            fontSize = 24;
            font = "${pkgs.nerd-fonts.jetbrains-mono}/share/fonts/truetype/NerdFonts/JetBrainsMono/JetBrainsMonoNerdFont-Regular.ttf";
            gfxmodeEfi = "2560x1440";
            extraEntries = ''
              menuentry "Enter BIOS Setup" {
                fwsetup
              }
            '';
          };
        };

        hardware = {
          enableRedistributableFirmware = true;
          nvidia = {
            open = true;
            nvidiaPersistenced = true;
            package = config.boot.kernelPackages.nvidiaPackages.latest;
            powerManagement.enable = true;
            modesetting.enable = true;
            nvidiaSettings = true;
            prime = {
              offload.enable = false;
              sync.enable = true;
              intelBusId = "PCI:0:2:0";
              nvidiaBusId = "PCI:1:0:0";
            };
          };
          graphics = {
            enable = true;
            enable32Bit = true;
            extraPackages = with pkgs; [
              # Vulkan support
              # vulkan-validation-layers dropped: debug-only layer, broken build on
              # nixpkgs 1.4.350.0 (update_deps.py git-clones in the sandbox).
              vulkan-loader
              vulkan-tools

              # Video acceleration
              libva-vdpau-driver
              nvidia-vaapi-driver

              # Intel iGPU video decode (Optimus: the Intel chip drives the panel and
              # should do video, leaving the dGPU idle). Without this there is NO
              # Intel VA-API driver in the closure at all — /run/opengl-driver/lib/dri
              # had neither iHD nor i965 — so browsers and players fell back to
              # software decode and burned battery.
              #
              # Deliberately NOT paired with LIBVA_DRIVER_NAME=nvidia: forcing VA-API
              # at the dGPU on a hybrid laptop defeats exactly this. Leave the driver
              # unset so libva picks per-device.
              intel-media-driver

              # # CUDA support
              # cudaPackages.cudatoolkit
              # cudaPackages.cudnn
            ];
          };
        };

        zramSwap.enable = true;
      };
  };
}
