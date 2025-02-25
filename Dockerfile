# https://docs.github.com/en/actions/creating-actions/dockerfile-support-for-github-actions

# https://github.com/rocker-org/rocker-versioned2/wiki/geospatial_e06f866673fa
FROM rocker/geospatial:4.2.2

ENV TZ=Etc/UTC

# And set ENV for R! It doesn't read from the environment...
RUN echo "TZ=${TZ}" >> /usr/local/lib/R/etc/Renviron.site
RUN echo "PATH=${PATH}" >> /usr/local/lib/R/etc/Renviron.site

# Add PATH to /etc/profile so it gets picked up by the terminal
RUN echo "PATH=${PATH}" >> /etc/profile
RUN echo "export PATH" >> /etc/profile

RUN apt-get update && \
    apt-get install --yes \
        rsync \
        libcurl4-openssl-dev \
        texlive-xetex \
        texlive-latex-extra \
        texlive-fonts-recommended \
        texlive-fonts-extra \
        texlive-plain-generic \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY set-libs.r /tmp/set-libs.r

COPY bray-base.r /tmp/r-packages/
RUN r /tmp/r-packages/bray-base.r
