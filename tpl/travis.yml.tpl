#####################################
# THIS FILE IS AUTOGENERATED!       #
# Edit ./tpl/travis.yml.ypl instead #
#####################################

language: c

compiler:
- gcc
- clang

addons:
  apt:
    packages:
    - build-essential
    - cmake
    - rpm
    - git
    - gdb
    - valgrind
    - python-dev
    - libcap-dev
    - python-pip
    - python-virtualenv
    - hardening-includes
    - gnupg
    - vim-common

env:
  global:
    - SIGN_BINARIES=1
    - secure: "RKF9Z9gLxp6k/xITqn7ma1E9HfpYcDXuJFf4862WeH9EMnK9lDq+TWnGsQfkIlqh8h9goe7U+BvRiTibj9MiD5u7eluLo3dlwsLxPpYtyswYeLeC1wKKdT5LPGAXbRKomvBalRYMI+dDnGIM4w96mHgGGvx2zZXGkiAQhm6fJ3k="

before_install:
  - openssl aes-256-cbc -K $encrypted_2893fd5649e7_key -iv $encrypted_2893fd5649e7_iv -in sign.key.enc -out sign.key -d || echo "Encrypted signing key unavailable"

script: ./ci/run_build.sh

sudo: false

deploy:
  provider: releases
  api_key:
    secure: Yk90ANpSPv1iJy8QDXCPwfaSmEr/WIJ3bzhQ6X8JvZjfrwTosbh0HrUzQyeac3nyvNwj7YJRssolOFc21IBKPpCFTZqYxSkuLPU6ysG4HGHgN6YJhOMm4mG4KKJ6741q3DJendhZpalBhCEi+NcZK/PCSD97Vl4OqRjBUged0fs=
  file:
    - "./dist/tini"
    - "./dist/tini.asc"
    - "./dist/tini-static"
    - "./dist/tini-static.asc"
    - "./dist/tini_@tini_VERSION_MAJOR@.@tini_VERSION_MINOR@.@tini_VERSION_PATCH@.deb"
    - "./dist/tini_@tini_VERSION_MAJOR@.@tini_VERSION_MINOR@.@tini_VERSION_PATCH@.rpm"
  on:
    repo: krallin/tini
    tags: true
    condition: "$CC = gcc"
