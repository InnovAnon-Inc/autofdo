FROM innovanon/doom-base as fdo
USER root
RUN sleep 91                                                              \
 && apt update \
 && apt install -y libtool autoconf automake git libelf-dev libssl-dev pkg-config \
 && git clone --depth=1 --recursive -b 0.19                               \
                                    https://github.com/google/autofdo.git \
 && cd                                                        autofdo     \
 && aclocal -I .                                                          \
 && autoheader                                                            \
 && autoconf                                                              \
 && automake --add-missing -c                                             \
 && ./configure                                                           \
 && make -j1                                                              \
 && make install                                                          \
 && cd ..                                                                 \
 && rm -rf                                                    autofdo

