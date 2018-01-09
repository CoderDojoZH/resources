# jumping

~~~
when green flag clicked
set (y-speed) to [0]
set (jumping) to [0]
go to x: [0] y: [0]
forever
   change x by (y-speed)


when green flag clicked
forever
    if <color [#ff0000] is touching [#00ff00]?> then
        if <key [space v] pressed> then
            set (y speed) to [10]
            set (jumping) to [1]
        else
            set (jumping) to [0]
        end
    end
    if <(jumping) = [1]> then
        if <(y-speed) > [-10]> then
            change (y-speed) by (-0.5)

(y-speed)
(jumping)
~~~
