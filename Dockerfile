FROM library/gcc:8.1

RUN apt-get update && \
  apt-get install -yq libboost-all-dev


RUN apt-get install -yq \
  git \
  pgp \
  rsync \
  ssh \
  tmux \
  valgrind \
  vim-nox
RUN apt-get install -yq $(apt search cmake|grep '\/stable'|grep -E '(^|\-)cmake'|cut -d '/' -f1|tr '\n' ' ')

RUN sed 's/^deb\(.*\)$/deb\-src\1/' < /etc/apt/sources.list > /etc/apt/sources.list.d/debsrc.list
RUN apt-get update

RUN apt-get -yq build-dep $(apt-cache search linux-image|grep '^linux-image'|awk 'NR==1{print $1}')

RUN apt-get install -yq \
  codeblocks \
  codeblocks-common \
  codeblocks-contrib 

# RUN apt-get install -yq bison flex libelf-dev bc

# this hides the annoying missing username warning
COPY USAGE /
COPY entrypoint.sh /
COPY vimrc.local /etc/vim/vimrc.local
ENTRYPOINT ["/entrypoint.sh"]
ENV PROMPT_COMMAND "export PS1='user@container \w $ '"
