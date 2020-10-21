# Concurrency
## Definitions
Both concepts are multitasking. If parallalization occurs, there must exist concurrency.
* **Concurrency**: multiple tasks run *simultaneously*. (no one knows the order, if time freezes, there is only one task running)
* **Parallel**: multiple task **physically** run simultaneously. (if time freezes, there are multiple tasks running)

## When did we see concurrency in the past?

```Java
// There are two tasks running simultaneously
// This throws ConcurrentModificationException

for (int i : myList) {
  myList.remove(i);
}
```

## Ways to implement parallel (more than one core)
* Multiprocess (one JVM takes care of one process): an independent execution of instructions with independent memory space (heap).
  * | process 1 \[Heap 1\] |
  * | process 2 \[Heap 2\] |
  * | process 3 \[Heap 3\] |
* Multi-thread: an independent execution of instructions with shared memory space
Example
```java
class Thread {
  public static void main(String[] args) {
    Thread t = new Thread() {
      @Override
      public void run() {
        System.out.println(Hello1);
      }
    }
    
    // The statements below are in the main thread
    // main thread -- new trhead -- hello2 --- join hello3 -- exit
    //                   |________ hello1 ________|
    t.start(); // start a new thread
    System.out.println("Hello2");
    t.join(); // join is waiting here until thread t ends
    System.out.println("Hello3");
  }
}

```

* When the JVM will exit? -- when there are no alive non daemon threads. 所有用户线程结束时，JVM就退出了，并且带走所有守护线程。A common daemon thread is GC.
```java
// daemon threads setup
// should before thread.start()
t.setDaemon(true);
```
* A thread life cycle
`start()`: mark a thread as "ready to run"
```java
// static methods
Tread.yield(); // return to the tread pool and wait for next call, but it is rarely used
Tread.sleep(1000); removed from the ready-to-run queue, and move it to the sleeping thread pool
```



为什么变成了damon不一定执行？
* communication is good in multi-thread, not good in multi-process????

## Memory
**physical momory**: e.g. 16 GB, 32 GB or whatever on your labtop  OS手里的$6,500
**memory space/virtual memory**: 给每个process许诺的$15,000，万一不够向hard disk借，但是速度会慢非常多

## Common interview quesitons
* Difficulty in multi-threading: information communication --> **data race** 数据竞争，会造成运行结果不确定性
* When will data race occur?
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
* How to avoid data race?
lock == mutual exclusion by creating a critical section 
问题解决了吗？并没有，消除了不确定性，还有随机性
  ```java
  // this is pseudo code
  int a = 10;
  lock l = new Lock();
  Thread 1:
    l.lock();
    a++;
    l.unlock();
  Thread 2:
    l.lock();
    a--;
    l.unlock
  ```
