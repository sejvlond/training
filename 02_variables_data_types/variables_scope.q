#!/usr/bin/env qore

%new-style
%strict-args
%require-types
%enable-all-warnings

sub function(){
    # these are function-local variables
    int a = 1;
    int b = 3;

    {
        # this is a block which defines a different lexical scope than
        # the function itself -> this is a (different) block-local variable
        int a = 2;

        # this will print "block-local a = 2"
        printf("block-local a = %d\n", a);

        # this will print "b = 3" because there is no block-local variable b
        printf("b = %d\n", b);

        int c = 4;
    }

    # this will print "function-local a = 1"
    printf("function-local a = %d\n", a);

    # this would throw an error because there is no variable c in this scope
    # printf("c = %d\n", c);
}

function();
