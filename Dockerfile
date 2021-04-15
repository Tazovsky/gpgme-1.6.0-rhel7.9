FROM wglacier/rhel7.9

RUN cd /tmp && \
    yum update -y && \
    yum install -y bzip2

RUN cd /tmp && \
    wget https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.24.tar.bz2 && \
    tar xf libgpg-error-1.24.tar.bz2 && \
    cd libgpg-error-1.24 && \
    ./configure && \
    make && \
    make check && \
    sudo make install

RUN cd /tmp && \
    wget https://www.gnupg.org/ftp/gcrypt/libassuan/libassuan-2.4.3.tar.bz2 && \
    tar xf libassuan-2.4.3.tar.bz2 && \
    cd libassuan-2.4.3 && \
    ./configure && \
    make && \
    sudo make install

RUN cd /tmp && \
    wget ftp://ftp.gnupg.org/gcrypt/gpgme/gpgme-1.6.0.tar.bz2 && \
    tar xf gpgme-1.6.0.tar.bz2 && \
    cd gpgme-1.6.0 && \
    ./configure --prefix=/usr \
                --disable-fd-passing \
                --disable-gpgsm-test && \
   sudo make install

RUN rm -rf /tmp/*


