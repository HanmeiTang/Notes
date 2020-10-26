# System Design

* Step 1: Use cases and constraints
* Step 2: Abstract/Basic Design
* Step 3: Understanding bottlenecks
* Step 4: Scaling your abstract design

## Common questions: Please design a feed product.

### Way of thinking: what is a feed product? ("请设计一个twitter")
  1. 结合具体use case把它具体化！！！ like a Twitter 找到一个生活中你用过的产品，迅速找一下概念上的感觉
  2. 抓住核心功能，达成共识，"我们可以解构一下，它的核心功能是feed，这45分钟我们讨论下feed功能实现"
    1. 看到好友的feed
    2. 有一些ranking
### Design
  * Step 1: Use cases and constraints: Number of active users --> higher QPS & data
    * QPS --> Average & Peak QPS 淘宝双十一头十分钟 vs. 小型购物网站
    * 所以对大型项目就不用考虑一个机器，直接distributed system
  * Step 2: Abstract/Basic Design
  * Step 3: Understanding bottlenecks
  * Step 4: Scaling your abstract design

### Implementation details: Two models
1. push model - 适合主动push，非常积极发信息，每个user存的是这个user能看的post
  * what being pushed (define user schema): user, story
  * u2.getStories()
    * locate the user
    * get post
  * u2.postStories() // this is slow when followers are a lot
    * get followers
    * update all followers data

```text
         [  Aggregator  ]
         /      ｜       \
 [server1]   [server2]  [server3]
```

2. pull model - 放着不管什么也不会发生任何事，一顿query之后才会看到区别, 每个user存的是这个user发布的post
* post很快，直接update，get会从各个server得到top-ranked posts，然后在aggregator处进行一个merge sort
* get会比较慢一点，post很快

### Finally, possible improvement, where are the possible bottlenecks

## Design a URL Shorten Service

### Step 1: Use cases and constraints
* Read/Write pattern: 
  * Read: use the short url to access ther long url
  * Write: convert long url to the short url
* Use case/contraints
  * Read >> Write
  * support update? (if the data is final, we don't need to worry about data update)
  * data size
    * 1 million access user, 1% write 99% read
    * 1 billion MAU (monthly active users), 10% of those people use it to write, which produces 
      * 100M URLs * 12 month = 1.28 Billion URL
      * 2kb * 1.28B = 2TB
      * This means disk storage is not a problem
    * Traffic - if everything is stoerd on disk
      * latency and speed of common media (memory, network, disk)
      * 50k/s QPS is okay but may not handle peak load at large scale

  * computational cost
    * MD5/SHA hashing algorithm complexity (this is low)
    * compared to Machine Learning, blockchain
  * network bandwidth
    * not a big issue
    * 10 Gb/s?

### Step 2: Abstract/Basic Design
* request/response (input/output)
* storage format
  * Map<shortURL, longURL>
  * getLongURL(String shorURL)
  * getShortURL(String longURL)
* Key function `convert`
  * Hash function
    * [md5](https://en.wikipedia.org/wiki/MD5) 通常也用来验证完整性, output is a 128-bit data
    * optimization --> convert byte array to a hex
    * long url string -> `byte[] hash(String url)` (md5) -> byte[] -> [`Base64 encoding`](https://en.wikipedia.org/wiki/Base64) -> short url string -> truncate --> ss (--> collision ss')
  * Randomize
    * if the output string is not long, we must deal with collision
    * long : short instead of short : long to speed up the check process
  * Counter
    * 0..9 A ... z
    * concurrency --> different treads occupy different counter range

### Step 3: Understanding bottlenecks
Identify the bottleneck
* Data size
  * It is okay to store a few TB data
  * When QPS is high
    * 50 MB/sec continuously -- memory
    * <10 MB/sec random access -- disk
    * assume we need 100 byte * 1e6 qps = 100 Mb/sec, then a single machine is not enough
    * Memory + disk read is slow, may consider using more machine or even a distributed system
  
### Step 4: Scaling your abstract design
1. Ways to spread your data onto multiple machines
  * sharding = to split your data into partitions/shards, and each machine takes one or more partitions
    * 2TB data split into 40 boxes and each machine handle 50GB, which can be sotred in memory
    * We don't want a db because the data structure is super simple, kind of overkill
  * replication
    * Need to maintain replica consistency in practice
    * 2TB data replicated onto 10 boxes, each machine keeps 2TB data, but handle 1/10 traffic
  * sharding + replication
2. need a rule to shard data to 10 partitions
3. need a dispartcher to route the request to a storage box
4. A more efficient solution? Cache on dispatcher node.
