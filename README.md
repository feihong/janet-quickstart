# Feihong's Janet quickstart

## Installation

```
curl -L https://github.com/janet-lang/janet/tarball/master | tar xz
cd janet-lang-janet-*
# Change PREFIX to $HOME/.local
make
make test
make install
cd ..
rm -rf janet-lang-janet-*

git clone --depth 1 https://github.com/janet-lang/jpm
cd jpm
PREFIX=$HOME/.local janet bootstrap.janet
cd ..
rm -rf jpm
```

Install joy

    jpm install joy

## Commands

Start server

    janet server.janet

List all packages available in jpm

    janet list-packages.janet
