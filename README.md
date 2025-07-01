# Anzu
Custom Arch Linux ISO

## Support
- Intel processor
- x86_64 architecture
- Disk encryption
- Systemd-boot
- Sway
- Catppuccin theme

## Requirements
The following packages need to be installed to be able to create an image with
the included scripts:
- awk
- dosfstools
- e2fsprogs
- erofs-utils (optional)
- findutils
- gzip
- libarchive
- libisoburn
- mtools
- openssl
- pacman
- sed
- squashfs-tools

For running the images in a virtualized test environment the following 
packages are required:
- edk2-ovmf
- qemu


## Build
### Anzu ISO
```sh
   sudo mkarchiso -v -w . -o out/ .
```

### Anzu ISO with log
```sh
   sudo mkarchiso -v -w . -o out/ . 2>&1 | tee "anzu-iso_$(date -u +'%Y.%m.%d-%H:%M').log"
```

## Testing
The convenience script `run_archiso` is provided to boot into the medium 
using qemu. It is advised to consult its help output:

```sh
   run_archiso -h
```

Run the following to boot the iso using BIOS:
```sh
    run_archiso -i path/to/an/anzu.iso
```

Run the following to boot the iso using UEFI:
```sh
   run_archiso -u -i path/to/an/anzu.iso
```

# Contribute
Development of Anzu takes place [on Codeberg](https://codeberg.org/09CrisGui01/anzu-iso).

Please read the [Code of Conduct](./CODE_OF_CONDUCT.md) before contributing, 
to understand what actions will and will not be tolerated.

Read the [Contributing Guide](./CONTRIBUTING.md) to learn more about how to provide
fixes or improvements for the code base.

All past and present authors of Anzu are listed in [Authors](./AUTHORS.md).

# License
Anzu is licensed under the terms of the [GPL-3.0-or-later](./LICENSE.md).
