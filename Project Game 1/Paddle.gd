extends Area2D

enum PaddleLoaction {
	LEFT,
	RIGHT
}

export (PaddleLoaction) var paddle_loc = PaddleLoaction.LEFT

const SPEED = 200

var input_name = ""

func _ready():
	if paddle_loc == PaddleLoaction.LEFT:
		input_name = "Player1_"
	if paddle_loc == PaddleLoaction.RIGHT:
		input_name = "Player2_"

func _physics_process(delta):
	if Input.is_action_pressed(input_name + "move_up"):
		global_position.y -= SPEED * delta
	if Input.is_action_pressed(input_name + "move_down"):
		global_position.y += SPEED * delta
	
	global_position.y = clamp(global_position.y, 0, 400)


func _on_Paddle_area_entered(area):
	if area.name == "Ball":
		area.direction.x *= -1
		area.direction.y = (area.global_position.y - global_position.y) / 16.0
