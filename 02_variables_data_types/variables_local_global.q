#!/usr/bin/env qore

%new-style
%strict-args
%require-types
%enable-all-warnings

# this is a global variable
our int a = 1;

sub function(){
    # this is a local variable, assigning a value to it will not affect
    # the global variable which will keep its original value
    int a = 2;

    # this will print "local a = 2"
    printf("local a = %d\n", a);
}

function();

# this will print "global a = 1"
printf("global a = %d\n", a);
