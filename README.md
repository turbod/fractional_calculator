# Fractional calculator

## How to use


Make executable the `fractional_calculator.rb`

```sh
chmod +x bin/fractional_calculator.rb
```

Now you can run the script by this command:

```sh
./bin/fractional_calculator.rb
```
## The Problem

Write a command-line program that takes operations on fractions as input and produces a fractional
result.
- The command-line program shall repeatedly prompt the user for input and display the result
until user types "exit".
- Legal operators shall be *, /, +, - (multiply, divide, add, subtract).
- Operands and operators shall be separated by one or more spaces.
- Mixed numbers shall be represented by whole&numerator/denominator; for example "3&1/4", "-1&7/8".
- Improper fractions, whole numbers, and negative numbers are allowed as operands.

Example runs (where '?' represents the command prompt):

? 1/2 * 3&3/4

= 1&7/8

? 2&3/8 + 9/8

= 3&1/2

? 1&3/4 - 2

= -1/4