# Common API



## Wrapper classes
* primitive types are always preferred to wrapper classes (extra overhead)
* wrapper class objects are IMMUTABLE

——————————————————
# Basic classes
## `Object[] array`
* int length;

## `ArrayList<E>`
// TODO

## `String`
* String(char[] value, int offset, int count);
* String(char[] value);
* String(StringBuilder builder)
* char[] toCharArray();
* int length();
* boolean isEmpty();
* char charAt(int index); // OOB Exception 
* int indexOf(String str);
* String valueOf(Integer i); // return “null” if input is null
* boolean endsWith(String suffix);
* boolean startsWith(String prefix);
* String trim(); // remove tailing and leading white spaces
* int compareTo(String another); // compare lexicographically, “abc”.compareTo(“abd”) // returns -1
* int compareToIgnoreCase(String another);
* String concat(String another); // this creates a new String object, O(n)
* String[] split(String, regex);
* String toLowerCase();
* String toUpperCase();
* boolean contains(charSequence seq);
* String replace(char oldChar, char newChar);
* String replace(CharSequence target, CharSequence replacement);
* String replaceAll(String regex, String replacement);
* String replaceFirst(String regex, String replacement);
* boolean deleteCharAt(int index); // may use O(n) or/and use O(n) extra space
* String subString(int start, int end); // may use O(n) or/and use O(n) extra space
* String subString(int start); // may use O(n) or/and use O(n) extra space


## `StringBuilder` // ~ `ArrayList<Character>`
Note: ~~`StringBuffer`~~ is deprecated! 同`Vector`, `Stack`有線程安全問題 non-thread safe
Internally, `StringBuilder` is very similar to `ArrayList` (a resizable array)
* StringBuilder(String s);
* StringBuilder(int capacity);
* StringBuilder append(char c);
* StringBuilder insert(int offset, char c);
* StringBuilder delete(char c);
* StringBuilder deleteCharAt(int index);
* char charAt(int index); // O(1), same
*  to ArrayList<Character>
* void setCharAt(int index, char c);
* int length();
* String toString();
* boolean deleteCharAt(int index); // may use O(n) or/and use O(n) extra space

## `[Set<E>]` Interface
* boolean add(Object e);
* boolean contains(Object e); // complexity = O(1)
* boolean isEmpty();
* int size();
* boolean remove(Object e);
* Object[] toArray();

## `HashSet<E>`
* boolean add(E e); // amortize O(1)
* boolean remove(Object o);  // amortize O(1)
* boolean contains(Object o);  // amortize O(1)
* void clear(); // O(n)
* int size();
* boolean isEmpty();

## `[Map<K,V>]` Interface
`HashTable`在Java 4及以前使用，有线程安全问题，且不允许null key
* boolean containsKey(Object Key);
* boolean containsValue(Object Value); // 複雜度 O(n)
* Set<Map.Entry<K,V>> entrySet();
* Set<K> keySet();
* V get(Object Key) // null if not an existing key
* boolean isEmpty();
* int size();
* V put(K key, V value); // add and replace
* V remove(K key); // null if not an existing key
* V getOrDefault(Object Key, V defaultValue) // recommended

## `HashMap`
~~`HashTable`~~ is deprecated, which doesn't allow `null` key. `HashTable` and `Vector` are shynchronized, which introduce a lot of performance penalty. `HashMap` allows one `null` key. 
* V get(K key);
* boolean put(K key, V val);
* boolean set(K key, V val);
* boolean remove(K key);


## `[Map.Entry<K,V>]` Interface
* K getKey();
* V getValue();
* V setValue();

## `Object`
The root class for any Java class. In Java, there is a contract betwwen `equals()` and `hashCode()`, the developers need to maintain
1. If one equals two, it is a must that one.hashCode() == two.hashCode()
2. If one.hashCode() == two.hashCode(), it is not necessary one.equals(two)
When you overrde equals(), definitely override hashCode() as well.

* `boolean equals(Object obj)` // default `return (this == obj)`, override it to compare value
* `int hashCode()` // default returns a unique hash value based on its memory address
  * The performance of HashMap solely depends on how good the hashCode() is.
  * Easy, fast and efficient
  * Minimize collision, as evenly distributed as possible

## `Integer`
* int intValue(); // get the value
* Integer valueOf(String s); // return integer of a string, e.g. “1”
* int parseInt(String s); // return integer of a string, e.g. “1”

## `Enum`
* static values()

# Built-in high-level APIs
```java
import java.util.Arrays;

// Sorting
int[] Arrays.sort(int[] list);
Integer[] Arrays.sort(numbers, Collections.reverseOrder());

// Binary search
static int binarySearch(int[] a, int key);
static int Arrays.binarySearch(int[] a, int leftInclusive, int rightExclusive, int key);
static int binarySearch(char[] a, char key);
static int binarySearch(Object[] a, Object key);

// Fill value
void Arrays.fill(Object[], null);

// Math
int Math.max(int a, int b)
int Math.abs(int num)


```
