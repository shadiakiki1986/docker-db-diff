FROM shadiakiki1986/docker-node-git-rest-api
RUN npm i -g git://github.com/shadiakiki1986/deep-diff-yml-cli.git \
  && git config --global diff.yml_diff.command "deep-diff-yml" \
  && mkdir -p ~/.config/git \
  && echo -e '*.yml diff=yml_diff' >> ~/.config/git/attributes

# for git pager
RUN apk --update add less vim

# http://stackoverflow.com/a/7950092/4126114
ENV TERM=cygwin
