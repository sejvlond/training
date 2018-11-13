# Data structures

## Lists

List is an advanced data type Qore uses for storing multiple values with a defined order.

```
list empty = ();
list words = ("lorem", "ipsum", "dolor", "sit", "amet");
list numbers = (42, 3.14, "seven", (1, 2, 3));
```

As you can see in the last example items in a list doesn't necessarily need to be of the same type and lists can even
contain other lists. Qore programming language supports also typed lists however, as you can see below.

### List operators

Elements in a list can be accessed using square brackets operator (`[]`) like this:
```
printf("Second word: %s\n", words[1]);     # indices start with zero
```

Other useful list operators are these:

- `elements` returns the number of elements in a list
    ```
    list numbers = (42, 3.14, "seven", (1, 2, 3));

    # prints "There are 4 elements in the list."
    printf("There are %d elements in the list.\n", elements numbers);
    ```
- `push` or `=+` add an element to the end of the list
    ```
    list words = ("lorem", "ipsum", "dolor");
    push words, "sit";
    words += "amet";

    # words now contains ("lorem", "ipsum", "dolor", "sit", "amet")
    ```
- `pop` removes and returns the last element of the list
    ```
    list words = ("lorem", "ipsum", "dolor");

    string a = pop words;

    # a now contains "dolor"
    # words now contains ("lorem", "ipsum")
    ```

- `+` concatenates lists
    ```
    list words = ("lorem", "ipsum");
    list numbers = (42, 3.14, "seven");

    list together = words + numbers;

    # together now contains ("lorem", "ipsum", 42, 3.14, "seven")
    ```

More operators are described in
the [documentation](https://docs.qore.org/current/lang/html/container_data_types.html#list).

### List functions

There are also useful functions for working with lists such as these:

- `inlist()`, `inlist_hard()` check whether a value is in a list using *soft* or *hard* comparison respectively
  (which means with or without type conversions - more on *soft* or *hard* comparisons will be explained in the
  [next chapter](04_flow_control))
    ```
    if (inlist(42, some_list)) {
        printf("The list contains 42.\n");
    }

    ```

- `min()`, `max()` return the minimum/maximum value in the list
    ```
    list numbers = (1, 12, 42, 7, 12);
    printf("The maximum value is %d.\n", max(numbers));
    ```

- `range` returns a list containing an arithmetic progression of integers
    ```
    list numbers = range(6, 15, 2);
    # numbers now contains (6, 8, 10, 12, 14)

    # or
    numbers = range(1,5);
    # numbers now contains (1, 2, 3, 4, 5)

    # or
    numbers = range(3);
    # numbers now contains (0, 1, 2, 3)
    ```

- `reverse` creates a new list with the same elements in reverse order
    ```
    list numbers = (1, 2, 3);
    list reversed = reverse(numbers);
    # reversed now contains (3, 2, 1)
    ```

- `sort` sorts the list in ascending order and returns a new list
    ```
    list numbers = (1, 12, 42, 7, 12);
    list sorted = sort(numbers);
    # sorted now contains (1, 7, 12, 12, 42)
    ```

More functions are described in
the [documentation](https://docs.qore.org/current/lang/html/group__list__functions.html).

### List with declared value type

The list type supports one type argument in angle brackets to specify the value type. This results in a list where
the elements must always be of the declared type.

```
list<int> numbers = (1, 12, 42, 7, 12);

numbers += 2018;        # this is OK, we can add more integers
numbers += 3.14;        # this is not OK, we can't add a float, it will throw an error
numbers += "5";         # this is not OK, we can't add a string, it will throw an error
numbers += int("5");    # this is OK, as we're using an explicit conversion
```

### `softlist`

Similarly as e.g. `softint` or `softstring` (explained in [chapter 02](../02_variables_data_types)) there is also
`softlist`, a data type that will accept lists or types that can be converted to a list.

- if a list is assigned to a softlist, it's unchanged
    ```
    softlist a = (1, 2, 3);

    # a now contains (1, 2, 3)
    ```

- if `NOTHING` is assigned to a softlist, an empty list is created
    ```
    softlist a = NOTHING;

    # a now contains ()
    ```

- a value of any other type will create a new list with that value as its first element
    ```
    softlist a = 42;

    # a now contains (42,)
    ```

Softlists can also have value type declared - for example:
```
softlist<int> numbers;
```

### `*list`

Similarly as e.g. `*int` or `*string` (explained in [chapter 02](../02_variables_data_types)) there is also `*list`,
a data type that will accept a list or `NOTHING`.

A `*list` can also have value type declared - for example:
```
*list<int> numbers;
```

## Hashes

Hashes are containers (associative arrays similar to Maps in Java or dictionaries in Python) that assigns values to
a string key and also preserve key order for consistent data serialization/deserialization (so they are actually more
like ordered dictionaries in Python).



<!-- TODO: mention *hash-->