#!/bin/bash

set -eu

SBT_SCALAFMT_VERSION=2.2.1

CURL="curl"
CONF_URL="https://raw.githubusercontent.com/septeni-original/scalafmt-config/master/.scalafmt.conf"

CONF=".scalafmt.conf"
PLUGIN_SBT="project/plugins.sbt"

error() {
  msg="$1"
  echo >&2 "$msg"
  echo >&2 "Aborting."
  exit 1
}

if [ -e "$PLUGIN_SBT" ]; then
  if grep -q "scalafmt" "$PLUGIN_SBT"; then
    error "scalafmt already used in $PLUGIN_SBT."
  fi

  if grep -q "scalariform" "$PLUGIN_SBT"; then
    error "scalariform is found in $PLUGIN_SBT."
  fi
fi

if [ -e "$CONF" ]; then
  error "$CONF already exists"
fi

if [ ! -e "build.sbt" ]; then
  error "There is no ./build.sbt. Not a scala project?"
fi

"$CURL" -sL "$CONF_URL" -o "$CONF"

mkdir -p project

cat <<EOS>> "$PLUGIN_SBT"

addSbtPlugin("org.scalameta" % "sbt-scalafmt" % "$SBT_SCALAFMT_VERSION")
EOS
