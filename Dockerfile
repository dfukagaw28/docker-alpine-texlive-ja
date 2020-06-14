# Copyright (c) 2016 Kaito Udagawa
# Copyright (c) 2016-2019 3846masa
# Copyright (c) 2020 dfukagaw28
# Released under the MIT license
# https://opensource.org/licenses/MIT

FROM frolvlad/alpine-glibc:latest

ENV PATH /usr/local/texlive/2020/bin/x86_64-linuxmusl:$PATH

RUN set -ex \
  && apk add --no-cache curl perl fontconfig-dev freetype-dev \
  && apk add --no-cache --virtual .fetch-deps xz tar \
  && mkdir /tmp/install-tl-unx \
  && curl -sSLR http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz | \
      tar -xz -C /tmp/install-tl-unx --strip-components=1 \
  && printf "%s\n" \
      "selected_scheme scheme-basic" \
      "tlpdbopt_install_docfiles 0" \
      "tlpdbopt_install_srcfiles 0" \
      > /tmp/install-tl-unx/texlive.profile \
  && /tmp/install-tl-unx/install-tl \
      --profile=/tmp/install-tl-unx/texlive.profile \
      --repository=http://texlive.texjp.org/2020/tlnet \
  #&& tlmgr option repository ctan \
  && tlmgr option repository http://texlive.texjp.org/2020/tlnet \
  && tlmgr install \
      collection-latexextra \
      collection-fontsrecommended \
      collection-langjapanese \
      latexmk \
  && rm -fr /tmp/install-tl-unx \
  && apk del .fetch-deps

WORKDIR /workdir

CMD ["sh"]
