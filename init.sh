#!/bin/bash
readonly THIS_DIR="$( cd "$(dirname "$0")" ; pwd -P )"

function git_clone() {
  # $1 repo path
  # $2 to dir
  echo "====== $1 ======"
  if [[ ! -d $2 ]]; then
    git clone $1
  else
    pushd $2 > /dev/null
      git pull
    popd > /dev/null
  fi
}

pushd $THIS_DIR > /dev/null

git_clone git@github.com:focus-creative-games/huatuo.git huatuo
git_clone git@github.com:focus-creative-games/huatuo_trial.git huatuo_trial
git_clone git@github.com:pirunxi/il2cpp_huatuo.git il2cpp_huatuo

if [[ ! -L $THIS_DIR/il2cpp_huatuo/libil2cpp/huatuo ]]; then
  pushd $THIS_DIR/il2cpp_huatuo/libil2cpp
    ln -s ../../huatuo/huatuo
  popd > /dev/null
else
  echo "libil2cpp/huatuo link exist"
fi
