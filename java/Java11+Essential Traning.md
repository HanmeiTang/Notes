# Java11+ Essential Training

## What is Java
1. All code is defined in classes
2. Defined in source code files with `.java` extension
3. The `javac` command compiles Java code into bytecode
4. The `java` command runs compiled bytecode files


### A simple class

```java
// package declaration
// a tool to organize the code
package com.example;

// class declaration
// access modifier: public
// class keyword
public class Main {

// Main method
// access modifier: public
// void —> doesn’t return anything
public static void main(String[] args)  {
	System.out.println(“Hello from Java!”);
	}
}
```

### Testing Code in `JShell`
1. Java 9 added the JShell command
2. Testing environment for brief code snippets
3. Doesn’t require the class wrapper
4. Code snippets can be saved to files


### Standard format

1. Case Sensitivity. 
    1. Java is case-sensitive
    2. All identifiers must be unique within their scopes
    3. There are different identifiers due to case: `firstname`, `FIRSTNAME`, `firstName`
2. White space. 
    1. White space doesn’t affect interpretation of code
    2. spaces , tab and line feeds are collapsed by compiler
    3. All statements must end with a semicolon  `System.out.println(“Hello from Java!”);`
    4. The semicolon isn’t needed in `JShell`
3. Identifiers and keywords
    1. Class, method, field and other names are identifiers
    2. Identifiers must start with an alpha character or underscore
    3. Keywords cannot be used as identifiers
    4. [Keywords through Java 8](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/_keywords.html)
4. Identifier conventions
    1. Classes start with an upppercase character 
    public class MyClass
    2. Methods and variables start with a lowercase character
    void doSomething(String withThis) { }
    3. Constants are all uppercase
    public static final String FIRSTNAME = “David”;
5. Code blocks
    1. Code blocks are defined by pairs of braces `{a code block}`
    2. Method implementations `void doSomething(String withThis) {a code block}`
    3. Loops `for (int i=0; i<10; i++) {a code block}`

### Memory management and garbage collection
1. Memory for objects is allocated automatically
2. Local variables and function calls are stored in stack
3. Objects and member variables are stored in heap
4. Objects are retained in memory until dereferenced
5. Object is eligible for collection when all references expire

### Tips for managing memory
1. Minimize the number of objects you create
2. System methods that report memory usage `Runtime.maxMemory()` or `Runtime.totalMemory()`

### Choose an IDE
1. Any text editor will do!
    1. Windows: TextPad, JCreator
    2. MacOS: BBEdit, TextWrangler
    3. Visual Studio Code
2. Educational Tools
    1. BlueJ
    2. DrJava
3. Production-Worthy IDEs
    1. NetBeans
    2. Eclipse with Java Development Tools
    3. IntelliJ IDEA

================🎉🎉=🎉🎉====🎉🎉========

## Declare and Manage Variables

### Work with primitive variables

#### What is primitive data types?
1. Numbers, characters, and booleans
2. Primitive types are values, not objects
3. Primitive type names are all lowercase: `int`, `char`, `short`, `long`, `double`, `float`, `boolean` 
4. `String` is an object and is NOT a primitive type in Java.

#### Declaring primitive variables
1. Explicit type declarations 
```java
// 'int' is data type
// 'myVar' is idnetifier
// '=' is assignment
// '5' is the value assigning
int myVar = 5;
```

2. Type inference is available since Java 10, in which type is derived from the assigned value
```java
// 'var' is the keyword
// this gives the inferred type int for 'myVar'
// equals to 'int myVar = 5;'
var myVar = 5;
```

3. Types can be set in numeric literals with alpha notation

```java
var myInt = 5;
var myFloat = 5f;
var myDouble = 5d;

// For long type the upper case is the convention, since lower cases L looks similar to '1'
var myLong = 5L; 
```

4. Numeric Primitive data types









