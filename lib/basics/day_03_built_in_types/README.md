# Day 03: Built-in Types

- The Dart language has special support for the following:

  - Number (`int`,`double`)
  - Strings (`String`)
  - Booleans (`bool`)
  - Records (`(value1, value2)`)
  - Functions (`Function`)
  - Lists (`List`, also known as arrays)
  - Sets (`Set`)
  - Maps (`Map`)
  - Runes (`Runes`; often replaced by `characters` API)
  - Symbols (`Symbol)
  - The value `null` (`Null`)

- Some other types also have special roles in the Dart language:
  - `Object`: The superclass of Dart classes expect `Null`.
  - `Enum`: The superclass of the enums.
  - `Future` and `Steam`: Used in **asynchronous programming**.
  - `Iterable`: Used in for-in loops and in synchronous generator functions.
  - `Never`: indicates that an expression can never successfully finish evaluating. Most often used for functions that always
    throw an exception.
  - `dynamic`: indicates that you want to disable static checking. Usually you should use Object or Object? instead.
  - `void`: indicates that a value is never used. Often used as a return type
- The `Object`, `Object?`, `Null` and `Never` classes have special roles in the class hierarchy (hệ thông phân lớp).

## 1. Numbers

- Dart numbers come in two flavors:

  - `int`: Integer values np longer than 64 bits, depending on the platforms. On native platforms, values can be form -2^63 to 2^63 - 1.
  - `double`: 64-bit (double-percision) floating-point numbers, as specified by the IEEE 754 standard.
  - `num`: the parent type of both `int` and `double`. Used when the variable can be an integer or floating-point numbers.
    - String -> Number: int.parse('10'), double.parse('10.5').
    - Number -> String: 10.toString(), 10.5.toStringAsFixed(2)

## 2. Strings

- A Dart string ( String object) holds a sequence of UTF-16 codes units. you can use either single(ngoặc đơn) or double quotes (ngoặc kép) to create a string.

  - ex:
    - var s1 = 'Single quotes work well for string literals.';
    - var s2 = "Double quotes work just as well.";

- You can put the value of an expression inside a string by using ` ${``expression``} `. If the expression is an identifier, you can skip the {}. To get the string corresponding(tương ứng) to an object, Dart calls the object's `toString()` method.
  ex:
  - var s = 'string interpolation';

  assert(
  'Dart has $s, which is very handy.' ==
      'Dart has string interpolation, '
          'which is very handy.',
  );
  assert(
    'That deserves all caps. '
          '${s.toUpperCase()} is very handy!' ==
  'That deserves all caps. '
  'STRING INTERPOLATION is very handy!',
  );

- You can concatenate(kết nối) strings using adjacent(liền kề) string literals(chuổi ký tự) or the operator:
  ex: var s1 =
          'String'
          'concatenation'
          " works even over line breaks."
      var s2 = 'The + operator ' ***+*** 'works, as well'

- To create a multi-line string, use a triple quote with either single or double quotation marks:
  ex: var s1 = '''
      You can create 
      multi-line strings like this one.
      ''';

- You can create a "raw" string by prefixing it with `r`"
  ex: var s = r'In a raw string, not even \n gets special treatment.';

## 3. Booleans

- Dart has a type named `bool`. Only two objects have type bool: the boolean literals (các hằng số boolean) `true` and `false`, which are both compile-time constants.
- Dart's type safety means that you can't use code like `if (nonbooleanValue)` or `assert (nonbooleanValue)`. Instead, explicitly(rõ ràng) check for values, like this: 
  if (name) {...} -> lỗi. Phải viết if (name.isNotEmpty) {...}
## ![explicitly check for values](../../../assets/excheckboolean.png)
