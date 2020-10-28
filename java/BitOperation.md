# Bitwise operations

## 二进制
* 二进制表示：**`0b`** `b7 b6 b5 b4 b3 b2 b1 b0`
* 十六进制表示：**`0x`** `b7 b6 b5 b4 b3 b2 b1 b0`


## 负数表示: two’s complements 补码
* **sign bit** of a positive number = 0
* sign bit of a negative number = 1
* 变负数： + 1 取反（除了符号位）adding one and inversion
* range: -(2N-1) ~ (2N-1 - 1) when using N bits

## Bit Operation
* `&`: bitwise AND (ampersand)
    * **`x & 1 = x`**
    * **`x & 0 = 0`**
* `|`: bitwise OR (pipe)
    * **`x | 1 = 1`**
    * **`x | 0 = x`**
* `~`: NOT
    * `~0 = 1`
    * `~1 = 0`
    * **`-a = (~a) + 1 // when a >= 0`**
* `^`: XOR: exclusive OR
    * `0 XOR 0 = 0`
    * `1 XOR 1 = 0`
    * `0 XOR 1 = 1`
    * `1 XOR 0 = 1`
    * **`x ^ 0 = x`**
    * **`x ^ 1 = ~x`**
* `<<`: left shift, add **ZEROs** to the right
  * `byte a = 0b0100 0001`
  * `byte b = a << 1; // b = 0b1000 0010`

* `>>`: right shift (signed shift, arithmetical shift), add **signed integers** will be filled
    * positive numbers fills 0s
    * negative numbers fill 1s
* `>>>`: right shift (unsigned shift/logic shift), add **ZEROs** to the left // Note there is NO unsigned number in Java

## Building blocks
* bit tester: given a number x, test whether x’s kth bite is one
    * `x & (1 << k)` // not recommended, 比如8會返回8 而不是1
    * **`(x >> k) & 1`** // recommended
* bit setter 1: given a number x, how to set x’s kth bit to 1
    * **`x |= (1 << k)`**
* bit setter 2: given a number x, how to set x’s kth bit to 0
    * **`x &= ~(1 << k)`**

## 3 principles for integer type conversion
1. when the source operand has the same bit-width as the return value, then return value will have exactly the same representation.
2. when the return value is wider, 
    1. source is **unsigned**, fill 0 to the left
    2. source is **singed**, fill the sign bit the left
3. truncate higher bit if narrower

## Problems
1. Question 1: Determine whether a number x is a power of 2 (x = 2^n, n >= 0)
    1. return **(x > 0 && (x & (x - 1)))** // 可能会溢出，但是没关系
2. Question 2: How to determine the number of bits that are different between two positive integers?
3. Question 3: Assign a char from a negative number
4. Question 4: determine whether a string contains unique characters (no duplication)
    1. int[] bitVector = new bitVector[8]; // conventional

## Appendix
* Range
    * byte = [-128, 127] signed 8-bit
    * boolean 1 bit
    * char = [0, **65535**] unsigned 16-bit
    * short = [-32768, 32767] signed 16-bit
    * int = [-(2^31 - 1), 2^31 - 1] signed 32-bit
    * long = [-(2^63 - 1), 2^63 - 1] signed 64-bit

* Special number
    * 2^8 = 256
    * 2^16 = 65536
    * ~~2^32 = 4,294,967,296~~
    * ASCII: 0-255
    * ‘a’ = 97; ‘A’ = 65
    * ‘0’ = 48; ‘1’ = 49
    * null = 0
    * 32-126 ARE PRINTABLE
