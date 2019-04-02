import play

# https://github.com/replit/play/pull/10
import math as __math
def distance_to(self, x=None, y=None):
    assert(not x is None)

    try:
        # x can either by a number or a sprite. If it's a sprite:
        x = x.x
        y = x.y
    except AttributeError:
        pass

    dx = self.x - x
    dy = self.y - y

    return __math.sqrt(dx**2 + dy**2)
play.sprite.distance_to = distance_to

# https://github.com/replit/play/pull/11
def move(self, steps):
    self.x += int(steps * __math.cos(__math.radians(self.angle)))
    self.y += int(steps * __math.sin(__math.radians(self.angle)))
play.sprite.move = move

# https://stackoverflow.com/questions/306316/determine-if-two-rectangles-overlap-each-other
def is_touching(self, other):
    """
    True if two rectangular sprites intersect
    """
    return (self.x < (other.x + other.width) and
        (self.x + self.width) > other.x and
        self.y > (other.y + other.height) and
        (self.y + self.height) < other.y)
play.sprite.is_touching = is_touching

start = (-280, -10)
target = (150, 70)
player = play.new_sprite(image='player.png', x=-260, y=-150, angle=0, size=50)
ball = play.new_sprite(image='basketball.png', x=start[0], y=start[1], angle=0, size=50)
backboard = play.new_sprite(image='backboard.png', x=170, y=-10, angle=0, size=50)
circle = play.new_circle(x=target[0], y=target[1], radius=5, border_color="black", border_width=5)

score = play.new_text(words='0', x=-350, y=250, font_size=50)
score.score = 0

@play.when_program_starts
def green_flag():
    ball.go_to(*start)
    ball.power = 0
    ball.is_being_dragged = False
    ball.has_been_dragged = False
    ball.has_being_thrown = False

@play.when_key_released('r')
async def do(key):
   green_flag()

@ball.when_clicked
async def do():
    ball.is_being_dragged = True

@play.mouse.when_click_released
async def do():
    if ball.is_being_dragged:
        ball.has_been_dragged = True
        ball.is_being_dragged = False

@play.repeat_forever
async def do():
    if ball.is_being_dragged:
        ball.go_to(play.mouse)
    if ball.has_been_dragged:
        ball.point_towards(*start)
        ball.power = int(ball.distance_to(*start) / 3)
        ball.go_to(*start)
        ball.has_being_thrown = True
        ball.has_been_dragged = False
    if ball.has_being_thrown:
        ball.move(ball.power)
        if ball.distance_to(*target) < ball.width / 2:
            ball.angle = -90
            ball.power = 10
            ball.move(ball.width)
            score.score += 1
            score.words = str(score.score)
        if ball.y < -100:
            green_flag()
        if ball.angle > -90:
            ball.turn(-3)


play.start_program()
