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

![](images/trajectory-de.svg)

```
setze [v v] auf ((Entfernung von (Start v)) / (3))
setze [dx v] auf ((v) * ([sin v] of (Richtung :: variables)))
setze [dy v] auf ((v) * ([cos v] of (Richtung :: variables)))
wiederhole bis <wird (Ziel v) berührt?> 
  ändere x um (dx)
  ändere y um (dy)
  ändere [dy v] um (-0.1)
end
```

Warning: I've put a zero-width space in the reference to the the `direction` variable, otherwise i get the blue `direction" property.
