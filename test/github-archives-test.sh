#!/bin/bash

describe "GitHub archives handling (git, tar.gz, zip)"

before() {
    rm -rf build
}

after() {
    rm -rf build
}

it_github_same_name_id() {
    ../bin/getrepos install repos-github-same-name-id.json
    test -f build/repos/nginx-push-stream-module-b2056f63c27117952afc82d7a295acf0054edc28/config
}

it_github_same_name_id_tar_gz() {
    ../bin/getrepos install repos-github-same-name-id-tar-gz.json
    test -f build/repos/nginx-push-stream-module-b2056f63c27117952afc82d7a295acf0054edc28/config
}

it_github_same_name_id_zip() {
    ../bin/getrepos install repos-github-same-name-id-zip.json
    test -f build/repos/nginx-push-stream-module-b2056f63c27117952afc82d7a295acf0054edc28/config
}

it_github_same_name_tag() {
    ../bin/getrepos install repos-github-same-name-tag.json
    test -f build/repos/nginx-push-stream-module-0.5.1/config
}

it_github_same_name_tag_tar_gz() {
    ../bin/getrepos install repos-github-same-name-tag-tar-gz.json
    test -f build/repos/nginx-push-stream-module-0.5.1/config
}

it_github_same_name_tag_zip() {
    ../bin/getrepos install repos-github-same-name-tag-zip.json
    test -f build/repos/nginx-push-stream-module-0.5.1/config
}

it_github_other_name_id() {
    ../bin/getrepos install repos-github-other-name-id.json
    test -f build/repos/nginx-push-stream-b2056f63c27117952afc82d7a295acf0054edc28/config
}

it_github_other_name_id_tar_gz() {
    ../bin/getrepos install repos-github-other-name-id-tar-gz.json
    test -f build/repos/nginx-push-stream-b2056f63c27117952afc82d7a295acf0054edc28/config
}

it_github_other_name_id_zip() {
    ../bin/getrepos install repos-github-other-name-id-zip.json
    test -f build/repos/nginx-push-stream-b2056f63c27117952afc82d7a295acf0054edc28/config
}

it_github_other_name_tag() {
    ../bin/getrepos install repos-github-other-name-tag.json
    test -f build/repos/nginx-push-stream-0.5.1/config
}

it_github_other_name_tag_tar_gz() {
    ../bin/getrepos install repos-github-other-name-tag-tar-gz.json
    test -f build/repos/nginx-push-stream-0.5.1/config
}

it_github_other_name_tag_zip() {
    ../bin/getrepos install repos-github-other-name-tag-zip.json
    test -f build/repos/nginx-push-stream-0.5.1/config
}

it_github_hiredis_git() {
    ../bin/getrepos install repos-github-hiredis-git.json
    test -f build/repos/hiredis-v0.13.3/Makefile
}

it_github_hiredis_tar_gz() {
    ../bin/getrepos install repos-github-hiredis-tar-gz.json
    test -f build/repos/hiredis-0.13.3/Makefile
}

it_github_hiredis_zip() {
    ../bin/getrepos install repos-github-hiredis-zip.json
    test -f build/repos/hiredis-0.13.3/Makefile
}

it_github_libmaxminddb_git() {
    ../bin/getrepos install repos-github-libmaxminddb-git.json
    test -f build/repos/libmaxminddb-1.1.4/Makefile.am
}

it_github_libmaxminddb_tar_gz() {
    ../bin/getrepos install repos-github-libmaxminddb-tar-gz.json
    test -f build/repos/libmaxminddb-1.1.4/Makefile.am
}

it_github_libmaxminddb_zip() {
    ../bin/getrepos install repos-github-libmaxminddb-zip.json
    test -f build/repos/libmaxminddb-1.1.4/Makefile.am
}

it_github_libmaxminddb_release_tar_gz() {
    ../bin/getrepos install repos-github-libmaxminddb-release-tar-gz.json
    test -f build/repos/libmaxminddb-1.1.4/configure
}

# EOF
