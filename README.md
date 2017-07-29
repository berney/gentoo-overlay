# gentoo-overlay
Berne's Custom ebuilds


## Requirements

- Gentoo Linux

## Installation

### Using [standard method](https://wiki.gentoo.org/wiki//etc/portage/repos.conf)

You can setup this overlay by running this one-liner:

    curl -sL https://raw.githubusercontent.com/berney/gentoo-overlay/master/berne.conf | sudo tee -a /etc/portage/repos.conf/berne.conf
    

### Using layman

Ensure you have [Layman](http://layman.sourceforge.net/) installed or install it using:

    emerge -v app-portage/layman

Add this overlay this:

    layman -o https://raw.githubusercontent.com/berney/gentoo-overlay/master/overlay.xml -f -a berne
