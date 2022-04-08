# aws is annoying
function reset_aws() {
  unset AWS_SECRET_ACCESS_KEY
  unset AWS_ACCESS_KEY_ID
  unset AWS_SESSION_TOKEN
}

# in case you wanted to print the 256 color scheme
function print_colors() {
    for code in {0..255}; do echo -e "\e[38;05;${code}m $code: Test"; done
}

# this is great when DNS is setup properly
function resolve() {
  host $1 | awk '{ print $4  }' | grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn} -v 'in' | xargs -I {} dig +short -x {}
}

function szsh() {
  exec zsh
}

function dockerpsrm() {
  docker rm -f $(docker ps -a |awk '/Exit/ { print $1 }')
}

function dockerimagerm() {
  docker rmi $(docker images -f "dangling=true" -q)
}

function imagerm() {
  docker image prune
}
