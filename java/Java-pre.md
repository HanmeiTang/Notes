# Download and Installation
## 1. Download Java Development Kit (JDK)
* JDK = Java Runtime Environment (JRE) + Java Virtual Machine (JVM)
* IDE = Integrated Development Environment

Go to [Oracle](https://www.oracle.com/technetwork/java/javase/downloads/index.html) and click "Download" button.

## 2. Installation
Go through regular installation process using the downloaded .dmg file. Go to terminal to make sure the right version of Java is installed. To list all Java being installed:

```bash
$ /usr/libexec/java_home -V
Matching Java Virtual Machines (1):
    13.0.2, x86_64:	"Java SE 13.0.2"	/Library/Java/JavaVirtualMachines/jdk-13.0.2.jdk/Contents/Home

/Library/Java/JavaVirtualMachines/jdk-13.0.2.jdk/Contents/Home
```

To check the version I am currently using:
```bash
$ java --version
java 13.0.2 2020-01-14
Java(TM) SE Runtime Environment (build 13.0.2+8)
Java HotSpot(TM) 64-Bit Server VM (build 13.0.2+8, mixed mode, sharing)
```

If you want to change the version of Java that you are using:
```bash
$ export JAVA_HOME=`/usr/libexec/java_home -v 13.0.2`
```

And double check using `java --version` before you go.

# JShell
```bash
$ jshell
|  Welcome to JShell -- Version 13.0.2
|  For an introduction type: /help intro

jshell>
```

1. type `\help` in JShell to learn more about the program
2. Basics of the JShell
```bash
jshell> int x = 8
x ==> 8

jshell> int y = x + x
y ==> 16

jshell> x * 3
$3 ==> 24

jshell> x * 4
$4 ==> 32

jshell> $3 * 3
$5 ==> 72

jshell> /exit
|  Goodbye
```
3. Save a script to current directory
```bash
$ jshell
|  Welcome to JShell -- Version 13.0.2
|  For an introduction type: /help intro

jshell> var i1 = 5;
i1 ==> 5

jshell> var i2 = 10
i2 ==> 10

jshell> var result = i1 + i2
result ==> 15

jshell> result
result ==> 15

jshell> /list

   1 : var i1 = 5;
   2 : var i2 = 10;
   3 : var result = i1 + i2;
   4 : result

jshell> /save myCommands.java
```

4. load local java file from current directory
```bash
jshell> /open myCommands.java

jshell> /reset
|  Resetting state.

jshell> /open myCommands.java

jshell> /list

   1 : var i1 = 5;
   2 : var i2 = 10;
   3 : var result = i1 + i2;
   4 : result
```
# Unified Modeling Language (UML, 统一建模语言)

# Basic libraries in JAVA
## 1. **java.lang** Fundamental to the core Java language (math, boolean, byte)
```java
import java.lang.Math;

public class Main {
    public static void main(String[] args) {
        double power = Math.pow(5, 3);
        
        double sqrt = Math.sqrt(64);
        System.out.println(sqrt);
    }
}
```
## 2. **java.util** Generic utilities (scanning, formatting strings, data manipulation)
```JAVA
import java.util.Random;

public class Main {
    public static void main(String[] args) {
        Random rand = new Random();
        int randNum = rand.nextInt();
        int randNumWithBound = rand.nextInt(10);
        System.out.println(randNum);
        System.out.println(randNumWithBound);
    }
}
```
## 3. **java.net** Infrastructure for networking
```JAVA
// To be added.
```

# IntellJ IDEA

## Shortcuts
1. Show API docs within IntellJ: `Ctrl + J`
2. Set up shortcut to online documentations
* Google "java api 13 docs" and the 
* Go to the first result [Oracle Documentations](https://docs.oracle.com/en/java/javase/13/docs/api/index.html) and copy the url
* Go to IntellJ IDEA `Files > Project Structures... > Platform Settings > SDKs > 13 > Documentations Paths` and add online path `https://docs.oracle.com/en/java/javase/13/docs/api`
* Put cursor at any variable and press `Shift + F1` to access online documentation


# Enjoy~
