FROM archlinux:base-devel

RUN pacman -Syyu --noconfirm opam git pdf2svg rustup

RUN rustup default stable
RUN cargo install --git https://github.com/usagrada/satysfi-formatter.git --branch main
RUN cargo install --git https://github.com/monaqa/satysfi-language-server
RUN echo 'export PATH="$PATH:/root/.cargo/bin"' >> ~/.bashrc

RUN opam init -y --comp 4.14.0 --disable-sandboxing \
    && eval $(opam env) 
    
RUN opam repository add --all-switches satysfi-external https://github.com/gfngfn/satysfi-external-repo.git \
    && opam repository add --all-switches satyrographos-repo https://github.com/na4zagin3/satyrographos-repo.git 

RUN opam update

# https://twitter.com/puripuri2100/status/1737857311866269876
RUN opam install -y camlimages.5.0.4

RUN opam install -y \
    satysfi \
    satysfi-dist \
    satyrographos \
    satysfi-fonts-theano \
    satysfi-class-jlreq \
    satysfi-fss \
    satysfi-enumitem \
    satysfi-class-slydifi \
    satysfi-easytable \
    satysfi-azmath
    
RUN echo 'eval $(opam env)' >> ~/.bashrc && source ~/.bashrc

# RUN satyrographos instal

WORKDIR /home
