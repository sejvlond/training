#!/usr/bin/env qore

%new-style
%strict-args
%require-types
%enable-all-warnings

sub greet_world() {
    printf("Hello world!\n");
}

greet_world();