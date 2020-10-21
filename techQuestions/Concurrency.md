# Concurrency
#### Keywords: concurrency, parallel, process, thread, synchronization, data race

## Definitions

### Concurrency & Parallel
Both concepts are multitasking. If parallalization occurs, there must exist concurrency. Concurrency is in the program, parallelism is in the actual execution (physically launch multiple executors).
* **Concurrency**: multiple tasks run *simultaneously*. (no one knows the order, if time freezes, there is only one task running)
* **Parallel**: multiple task **physically** run simultaneously. (if time freezes, there are multiple tasks running)

### Memory
所有的virtual memory总和远大于physical memor，许诺(virtual memory)透支之后选择调用家里的矿(hard disk)。
* **physical momory**: e.g. 16 GB, 32 GB or whatever on your labtop // OS手里的$6,500
* **memory space/virtual memory**: 给每个process许诺的memory // $15,000，万一不够向hard disk借，但是速度会慢非常多

### Process & thread
Semantically, the fundamental difference between a "process" and a "thread" is if they have independent memory space. Communication is better in multi-thread implementations than multi-process implementations.
* **process**: an independent execution of instructions with independent memory space (heap, stack or OS resource).
* **thread**: an independent execution of instructions with shared memory space. 

### When did we see concurrency in the past?
```Java
// There are two tasks running simultaneously
// This throws ConcurrentModificationException

for (int i : myList) {
    myList.remove(i);
}
```

## Ways to implement parallel (more than one core)
Java by defalut runs only one process. Within a java application, you can set several threads to acheive parallel processing or asynchronous behavior.
```java
class Thread {
    public void run() {}  // something the thread need to do
    public void start() {
    // prearing
    run();
    // cleanup
    }
    
    public static void main(String[] args) {
        Thread t = new Thread() {
            @Override
            public void run() {
                System.out.println(Hello1);
            }
        };

        // The statements below are in the main thread
        // main thread -- new trhead -- hello2 --- join hello3 -- exit
        //                   |_________ hello1 _____|
        t.start(); // start a new thread
        System.out.println("Hello2");
        t.join(); // join is waiting here until thread t ends 到这里thread一定死了
        System.out.println("Hello3");
    }
}
```

### When the JVM will exit?
when there are no alive **non-daemon threads**. A common daemon thread is GC.
所有用户线程结束时，JVM就退出了，并且带走所有守护线程。所以上面的t如果是守护线程，就不一定会被执行。
```java
// daemon threads setup
// should before thread.start()
t.setDaemon(true);
```

### Ways of creating threads
1. extends `Thread`
  ```java
  class HelloThread extends Thread {
    @Ocerride
    public void run() {
      System.out.println("HelloThread");
    }
    
    public static void main(String[] args) {
      Thread t = new HelloThread();
      t.start();
    }
  }
  ```
2. implements `Runnable`
  ```java
  class HelloRunnable extends Client implements Runnable {
    @Override
    public void run() {
      System.out.println("HelloRunnable");
    }
    
    public static void main(String[] args) {
      Thread t = new Thread(new HelloRunnable());
      t.start();
    }
  }
  
  ```

### A thread life cycle
A thread is a list of instructions to be executed. `start()` marks a thread as "ready to run" status; then the thread is put to run queue and wait for running; end of quota or status changed by different event:
* `static yield()`: doesn't change the run status, but move it to a later quota
* `static sleep(int milisec)`: move it from ready-to-run thread pool to sleeping thread pool
finally all the instructions are finished and the thread is dead and cleaned up.


## Synchronization
If two or more conflicting operations are in different threads and are not properly synchronized, the will triger **data race** 数据竞争，造成运行结果不确定性

### When does data race occur?
  1. more than one operation work on the same momory location
  2. at least one operation is write to the same memory location
  3. at least two of those operations are concurrent
  
  ```java
  // This is pseudo code of a data race example
  // the value of b is not randomized, it is uncertain.
  int a = 10
  Thread 1:
    a = 8;
  Thread 2:
    int b = a + 1; 
  ```
### How to avoid data race?
By **synchronization** (lock)
1. The first method to implement synchromization is lock == **mutual exclusion** by creating a **critical section** (不可以被多个线程/进程同时执行的部分). No two concurrent processes are in their critical section at the same time. 可是问题解决了吗？并没有，消除了不确定性，还有随机性。
2. 其他方法？？？

### What is the lock (mutual exclusion) exactly in Java?
* a lock has a two operations: lock and unlock.
  ```java
  // this is pseudo code
  int a = 10;
  lock l = new Lock();
  Thread 1:
    l.lock(); // 进入隔间并挂锁
    a++;
    l.unlock();  // 开放隔间，标记为无人使用
  Thread 2:
    l.lock();
    a--;
    l.unlock
  ```
* non static: `synchronized(this)`
  ```java
  class Counter {
    private static int value = 0;
    public void increment() {
      // NOTE!! This is a critical section
      synchronized(this) {
        value++;
      }
    }
    
    public synchromized void decrease() {
      value--;
    }
    
    public int getCount() {
      synchronized(this) {
        return value;
      }
    }
  }
  ```
* static `synchronized(Counter.class)`
  ```java
  class Counter {
    private static int value = 0;
    public static void increment() {
      // NOTE!!
      synchronized(Counter.class) {
        value++;
      }
    }
    
    public static synchromized void decrease() {
      value--;
    }
    
    public static int getCount() {
      synchronized(Counter.class) {
        return value;
      }
    }
  }
  ```
