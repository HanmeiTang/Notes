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

### Additional information: Two models
1. push model - 适合主动push，非常积极发信息，每个user存的是这个user能看的post
  1.1 what being pushed (define user schema): user, story
  1.2 u2.getStories()
    1.2.1 locate the user
    1.2.2 get post
  1.3 u2.postStories() // this is slow when followers are a lot
    1.3.1 get followers
    1.3.2 update all followers data

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

