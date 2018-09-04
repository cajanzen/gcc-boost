FROM library/gcc:8.1

RUN apt-get update && \
  apt-get install -yq libboost-all-dev

#  codeblocks \
#  codeblocks-common \
#  codeblocks-contrib \

RUN apt-get install -yq \
  git \
  pgp \
  rsync \
  ssh \
  tmux \
  valgrind \
  vim-nox
RUN apt-get install -yq $(apt search cmake|grep '\/stable'|grep -E '(^|\-)cmake'|cut -d '/' -f1|tr '\n' ' ')
ENV PROMPT_COMMAND "export PS1='user@container \w $ '"
