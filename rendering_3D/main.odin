package main


import "core:fmt"
import "core:math/rand"
import "core:time"
import rl "vendor:raylib"

Color :: rl.Color
Vector3 :: rl.Vector3

MY_GREEN :: Color{100, 196, 166, 255}
MY_PURPLE :: Color{161, 100, 196, 255}
MY_BEIGE :: Color{247, 239, 229, 255}

main :: proc() {
	v1 := Vector3{f32(5), f32(0), f32(0)}
	v2 := Vector3{f32(0), f32(5), f32(0)}
	v3 := Vector3{f32(-2), f32(0), f32(5)}


	randPosX: i32
	randPosY: i32

	maxX: i32 = 1680
	maxY: i32 = 1050

	rl.SetConfigFlags(
		{.BORDERLESS_WINDOWED_MODE, .WINDOW_MAXIMIZED, .WINDOW_HIGHDPI, .WINDOW_RESIZABLE},
	)
	rl.SetTargetFPS(120)
	rl.InitWindow(maxX, maxY, "test")
	camera := rl.Camera3D {
		Vector3{10, 10, 10},
		Vector3{0, 0, 0},
		Vector3{0, 1, 0},
		100,
		.PERSPECTIVE,
	}

	cube := rl.LoadModel("./cube.obj")

	for !rl.WindowShouldClose() {
		maxX = rl.GetRenderWidth() / 2
		maxY = rl.GetRenderHeight() / 2

		rl.UpdateCamera(&camera, .FREE)
		rl.BeginDrawing()
		rl.ClearBackground(rl.BLACK)

		{ 	// 3D
			rl.BeginMode3D(camera)
			rl.DrawModel(cube, v1, 1, rl.WHITE)
			rl.DrawTriangle3D(v1, v2, v3, MY_GREEN)
			rl.DrawGrid(100, 10)
			rl.EndMode3D()
		}

		rl.EndDrawing()
	}
	rl.CloseWindow()
}
