# Throwing and gravity

![](images/trajectory-en.svg)

```
set [v v] to ((distance to (start v)) / (3)
set [dx v] to ([v v] * ([sin v] of (dire​ction))
set [dy v] to ([v v] * ([cos v] of (dire​ction))
repeat until <touching (target v)>
  change x by (dx)
  change y by (dy)
  change (dy) by (-0.1)
end
```

Warning: I've put a zero-width space in the reference to the the `direction` variable, otherwise i get the blue `direction" property.
