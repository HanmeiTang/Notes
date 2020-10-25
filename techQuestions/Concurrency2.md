# Synchronization

## A hashtable implementation of map
 * public operations
     * size()
     * isEmpty()
     * get(K key)
     * put(K key, V val)
     * remove(key)
     * containsKey(K key)
     * containsValue(V value)
 * private methods
     * rehash
     * hash
 * Write operation:
    1. put(), remove(), related data: size()
    2. But read operation may occur during write operation --> which may also trigger data race, so lock all read operation (public)
    3. Do we need to lock constructor? --> No, constructor is initialize a memory space, which won't conflict with other operations
    4. Finally, do we need to lock private methods? --> No, private methods are called by public methods. Synchronization will decrease the performance
    
 * `Node` class is a public nested class in HashMap
    1. Do we need to lock getKey()? --> No, field key is a final field, never be updated after initialization
    2. public methods in Node --> best practice: don't sacrifice performance for "possible useful" operation, refer to Stack and Vector
 
 ### Conclusion:
 1. lock all public methods in HashMap except constructor
 2. don't lock methods in Node
 
 ### One step more
  1. read >> write, 给read lock加counter  --> use `ReadWriteLock`
  2. synchronized hash map vs. concurrent hash map
    - 在一个linked list上读和在另一个linked list上写其实互不影响
    - java的优化：给一个hashmap分段.
        - HashTable (一把大锁)
        - ConcurrentHashMap
            - 带分段锁
            - JAVA8之后优化成每个linked list 一个锁，为了保证size正确性，求size时加全局锁)
        - java之后继续把linked list 优化成红黑树
 
 * 指导思想: Minimize critical section, 比如一些昂贵的操作io，不要放进critical section
 
### Deadlock "死锁"  互相等待
 1. mutual exclusion (不会消灭这个条件)
 2. hold and wait or resource holding --> avoid nesting critical sections! --> lock {lock {}} or lock1 {lock2 {}} should be avoided
 3. no preemption 禁止抢占，可以考虑设计自动放弃机制，比如timeout
 4. circular wait 按编号分配资源，但是实现很难，一般这么操作也是被逼到墙角了...
 
### Livelock 活锁


 
### Atomicity 计算机中描述一种不可分割的元素，要不全成功，要不全失败 --> 全或无
 - 如果失败，会回滚，不会发生用户给钱，商家没有收到钱的情况
 - keyword: `volatile`
 - 只能保证单一的读写，`a++`是一种复合读写操作，不能保证结果正确
 - 不需要了解为什么下面这段代码原本会出错，这是compiler一系列优化之后的结果，结果就是output和预期非常不同

```java
public class VolatileTest {
    // volatile effect:
    // lock - write - lock
    // lock - read - lock

    // public static boolean flag = false;  // UNCOMMENT THIS LINE TO SEE DIFFERENCE
    public volatile static boolean flag = false;

    public static class MyRunnable implements Runnable {
        @Override
        public void run() {
            while (!flag) {
                //System.out.println("The thread is running");
            }
            System.out.println("The thread is finished!");
        }
    }

    public static void main(String[] args) throws InterruptedException {
        Thread newThread = new Thread(new MyRunnable());
        newThread.start();
        Thread.sleep(1000);
        flag = true;
        System.out.println("Main thread is finished...");
    }
}
```

## Condition Synchronization
所有人都在1号房，3号房是被撵走的
* `notify()`
* `notifyAll()`

## Producer consumer problem
* As a consumer: if queue is full, wait
* As a producer: if queue is empty, then notify all

### One step more
悲观锁，乐观锁，数据量，读写锁
