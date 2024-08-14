# Solution

## TLDR

Following the way GCC converts a string into a 64 bit integer to store inside a register:

1. Identify the numbers and convert them to binary
    `8316293036411990115` -> `111001101101001011010000111010001111011011001000011000001100011`
2. Split the binary output by 8 bits starting from the right
3. Convert the 8 bits to ASCII character
   - ...
   - `01110100` -> `t`
   - `01111011` -> `{`
   - `01100100` -> `d`
   - `00110000` -> `0`
   - `01100011` -> `c`
4. Reverse the result: `...t{c0d` -> `c0d{...`
5. Combine the result of the remaining numbers and you'll get `c0d{this_is_a_solution}`

## Explanation:

GCC compiles a string by:

1. Splitting it into sub-strings of 4 or 8 characters each (32 bit / 64 bit)
2. The binary ASCII value of each character in the substring is concatenated with each other in the reverse order
3. The resulting binary is then converted to integer
4. Each of those sub-strings will be put into different registers (since a 32 bit memory cell can only store 4 characters)

## Example:

The C code (shortened):

```c
...
    flag = "c0d{this_is_a_solution}"
...
```

The output assembly (shortened):

```asm6502
...
    xorl    %eax, %eax
    movabsq    $8316293036411990115, %rax
    movabsq    $8030867432349591903, %rdx
    movl    %rax, -32(%rbp)
    movl    %rdx, -24(%rbp)
    movabsq    $35305796878497132, %rax
    movl    %rax, -16(%rbp)
...
```

Following the steps above:

1. `c0d{this_is_a_solution}` gets split into `c0d{this`, `_is_a_so`, and `lution}`
2. Each character in the sub-strings (`c0{this` for eg.) gets converted to binary:
   - `c` -> `01100011`
   - `0` -> `00110000`
   - `d` -> `01100100`
   - `{` -> `01111011`
   - `t` -> `01110100`
   - And so on...
3. Then the binary values are concatenated in reverse:
   
   ```
   Reversed: siht{d0c
   Binary: ... + '01110100' + '01111011' + '01100100' + '00110000' + '01100011'
   Result: '111001101101001011010000111010001111011011001000011000001100011'
   ```
4. The result is then converted to decimal -> `8316293036411990115`
5. The decimal number is stored in a register as seen in the Assembly code:
   
   ```asm
    movabsq    $8316293036411990115, %rax
   ```

Following the steps at under TLDR is just the reverse process of this.
