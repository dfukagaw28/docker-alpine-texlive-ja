# docker-alpine-texlive-ja

> Minimal TeX Live image for Japanese based on alpine

Forked from [paperist/docker-alpine-texlive-ja] \(under the MIT License\).

[paperist/docker-alpine-texlive-ja]: https://github.com/paperist/docker-alpine-texlive-ja

## Table of Contents

- [Install](#install)
- [Usage](#usage)
- [Contribute](#contribute)
- [License](#license)

## Install

```bash
docker pull dfukagaw28/docker-alpine-texlive-ja
```

## Usage

```bash
$ docker build . -t alpine-texlive-ja
$ docker run --rm -it -v $PWD:/workdir alpine-texlive-ja
$ latexmk -C main.tex && latexmk main.tex && latexmk -c main.tex
```

## Contribute

PRs accepted.

## License

MIT (C) dfukagaw28



