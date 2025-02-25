extends Node2D

'''
▶ 공식 문서 링크(아래)
  https://docs.godotengine.org/en/stable/tutorials/inputs/custom_mouse_cursor.html

▶ 최적화를 위해서 마우스 커서 이미지 크기는 최대 128 * 128 이내로 맞출 것을 권장

▶ Input.set_custom_mouse_cursor(image, shape, hotspot)
  - image: 마우스 커서 이미지
  - shape: 변경할 커서 모양의 타입을 지정하는 상수 (기본 화살표인지, 손가락 모양인지 등)
  - hotspot: 클릭 좌표 핫스팟 (마우스 클릭 시 이미지와 실제 클릭 지점 이격 거리)
'''

##################################################
var arrow_1: Texture2D = load("res://scenes/main/cursor.png")
var arrow_2: Texture2D = load("res://scenes/main/cursor_2.png")
# 마우스 커서 이미지 불러오기

var cursor_value: bool = false
# 마우스 커서 상태 변수 (나중에 마우스 이미지를 바꾸는데 사용)

##################################################
func _ready() -> void:
	#Input.set_custom_mouse_cursor(arrow_1, Input.CURSOR_ARROW, Vector2(500, 500))
	# 마우스 커서 이미지 변경 및 핫스팟 (500, 500)으로 설정
	pass

##################################################
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
	# 스페이스 키를 누르면
		if cursor_value:
			cursor_value = false
			Input.set_custom_mouse_cursor(arrow_1)
		else:
			cursor_value = true
			Input.set_custom_mouse_cursor(arrow_2)
		# 상태에 따라 마우스 커서 이미지 변경

##################################################
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
	# 마우스 버튼을 클릭했을 때
		show_click_indicator(event.position)
		# 화면에 클릭 지점 표시

##################################################
func show_click_indicator(position) -> void:
# 화면에 클릭 지점 표시 함수
	var indicator: Sprite2D = Sprite2D.new()
	# Sprite2D를 설정
	indicator.texture = load("res://scenes/main/indicator.png")
	# 마우스 커서 이미지 로드 및 설정
	indicator.position = position
	# position 좌표를 indicator.position에 설정
	add_child(indicator)
	# 자식 노드에 추가
