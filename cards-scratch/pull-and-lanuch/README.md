# Pull and launch

## Code

script for http://scratchblocks.github.io

```
when flag clicked
set (x) to (0)
set (y) to (-140)
go to x: (x) y: (y)
go to front
switch costume to [costume1 v]
show
forever
wait until <mouse down?>
switch costume to [costume2 v]
wait until <not <mouse down?>>
hide
go to x: (x) y: (y)
broadcast [launch v]

when I receive [ next v]
switch costume to [costume1 v]
show

when flag clicked
hide
set (x) to (0)
set (y) to (-140)
go to x: (x) y: (y)

when I receive [launch v]
point towards [mouse-pointer v]
create clone of [myself v]

when I start as a clone
show
repeat (100)
move (10) steps
if on edge, bounce
end
broadcast [next v]
delete this clone
```
