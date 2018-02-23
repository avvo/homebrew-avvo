# Homebrew Avvo

Avvo's Homebrew Tap.

## Installation

    brew tap avvo/avvo

Once that's done you should be able to install packages like

    brew install avvoenv

## Adding/Updating Formulae

After updating the `url` you should be able to get the value for `sha256` with:

    brew fetch ./rsh.rb --build-from-source

For building bottles see https://github.com/avvo/bottling_line
