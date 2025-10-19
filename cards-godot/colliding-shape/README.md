# Creating a colliding shape

- Create a new scene
- Create a new node of type _Area2D_ and name it using the same name as for the scene.
- Save the scene.
- Add to the Ground node a node of type _Sprite2D_
  - Drag the `ground.png` image from the assets into _Inspector > Sprite2D_'s _Texture_ property.
- Add to the Ground node a node of type _CollisionShape2D_
  - In _Inspector > CollisionShape2D_ set the _Shape_ property to _New RectangularShape2D_.
  - In the 2D view, cover the sprite's image with the collision shape.
- Create a script for the scene, using the _Object: Empty_ template:
  - let it emit the `hit` signal when something enteres it:  
    ```py
extends Area2D

signal hit

func _on_body_entered(body):
    hit.emit()
```
- Switch to the _Main_ scene and instantiate it with the _Chain_ tool at the top of the _Scene_ left panel.
