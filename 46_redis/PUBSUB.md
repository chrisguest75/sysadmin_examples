# PUBSUB

Publisher Subscriber.

NOTES:

* It seems channels do not list if they are pattern subscribed. There are no channels for patterns  

## Connect

```sh
# connect to client cli container
just start-tmux

# open cli
redis-cli -h redisdb -p 6379
```

## Start PubSub

```sh
# terminal 1+2
subscribe myevents

# terminal 3
pubsub channels * 
publish myevents "this is an event"
```

## Pattern

Subscribe to a pattern

```sh
# terminal 1
psubscribe things:*

# terminal 2
subscribe things:toeat

# terminal 3
publish things:todo "goto shops"
publish things:toeat "bananas"
publish things:toeat "apples"

publish nothings:toeat "bananas"

# does not show any channels
pubsub channels * 
```

## Resources

* https://medium.com/@joudwawad/redis-pub-sub-in-depth-d2c6f4334826
* Pub/Sub Defined [here](https://redis.io/glossary/pub-sub/)