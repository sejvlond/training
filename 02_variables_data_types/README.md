# Data types

There are several basic data types supported by Qore programming language and these are probably the most frequently
used ones:

- **Boolean** [[docs]](https://docs.qore.org/current/lang/html/basic_data_types.html#boolean)
    - declared as `bool`
    - `True` or `False` values
    - by default initialized to `False`
- **Integer** [[docs]](https://docs.qore.org/current/lang/html/basic_data_types.html#integer)
    - declared as `int`
    - a 64-bit signed integer
    - by default initialized to `0`
- **Float** [[docs]](https://docs.qore.org/current/lang/html/basic_data_types.html#float)
    - declared as `float`
    - a double precision floating-point number
    - by default initialized to `0.0`
- **String** [[docs]](https://docs.qore.org/current/lang/html/basic_data_types.html#string)
    - declared as `string`
    - a sequence of characters
    - characters encoding depends on a special `QORE_CHARSET` environment variable if set or locale (`LANG`
      environment variable); default is `UTF-8` (if neither variable is set)
    - by default initialized to `""` (empty string)
- **NOTHING** [[docs]](https://docs.qore.org/current/lang/html/basic_data_types.html#nothing)
    - declared as `NOTHING`
    - represents no value
    - by default initialized to `NOTHING`

There are also a few others mentioned here just for the sake of completness:
- **Number** - an arbitrary precision number
- **Date** - an absolute or relative date/time value
- **Binary** - a binary object
- **NULL** - corresponds to `NULL` in a database (not equivalent to `NOTHING`)

## Conversions

Boolean, integer, float and string (number and date as well actually) can be converted one type to another. Data loss is
possible depending on the conversion (e.g. when converting float to integer, the decimal part will be lost).

A few examples:

- integer to float
    ```
    int a = 42;
    float b = float(a);        # b contains 42.0 now
    ```

- float to integer
    ```
    float a = 3.14;
    int b = int(a);            # b containst 3 now (decimal part lost)
    ```

- integer to string
    ```
    int a = 42;
    string b = string(a);      # b contains "42" now
    ```

- string to float
    ```
    string a = "3.14";
    float b = float(a);        # b contains 3.14 now
    ```

There are some catches though, be aware of them:

- String to a number type (any of float, integer or number) conversion will only read and convert numbers until
  the first non-number character is found.
    ```
    string a;
    int b;

    a = "123a456";
    b = int(a);            # b contains 123 now

    a = "3.14";
    b = int(a);            # b contains 3 now

    a = "3.14.78";
    float c = float(a);    # c contains 3.14 now
    ```

- When a certain data type is required in an expression and the provided data type can't be converted to the requested
  one, it won't produce an error and the default value for the desired data type will be used instead.
    ```
    string a;
    int b;

    a = "a word";
    b = int(a);     # no error, b contains 0 now

    a = "R2D2";
    b = int(a);     # no error, b contains 0 because even though the string contains numbers, it doesn't start with them
    ```

- `NOTHING` and `NULL` are not equivalent and can't generally be converted one to the other

## "Soft" types

## "Star" types


More information about basic data types can be found in
the [documentation](https://docs.qore.org/current/lang/html/basic_data_types.html).

# Variables

## Local variables

## Global variables

## Special variables



