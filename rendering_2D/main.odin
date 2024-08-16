package main


import "core:fmt"
import "core:math/rand"
import "core:time"
import rl "vendor:raylib"

Color :: rl.Color

MY_GREEN :: Color{100, 196, 166, 255}
MY_PURPLE :: Color{161, 100, 196, 255}
MY_BEIGE :: Color{247, 239, 229, 255}


main :: proc() {
	randPosX: i32
	randPosY: i32

	maxX: i32 = 1680
	maxY: i32 = 1050

	rl.SetConfigFlags({.WINDOW_RESIZABLE})
	rl.SetTargetFPS(60)
	rl.InitWindow(maxX, maxY, "test")

	for !rl.WindowShouldClose() {
		time.sleep(time.Second / 60)
		maxX = rl.GetRenderWidth() / 2
		maxY = rl.GetRenderHeight() / 2

		rl.BeginDrawing()
		rl.ClearBackground(rl.BLACK)

		for i in 0 ..< 1750 {
			randPosX = rand.int31_max(maxX - 100 + 1)
			randPosY = rand.int31_max(maxY - 100 + 1)

			switch i % 3 {
			case 0:
				rl.DrawRectangle(randPosX, randPosY, 100, 100, MY_GREEN)
			case 1:
				rl.DrawRectangle(randPosX, randPosY, 100, 100, MY_BEIGE)
			case 2:
				rl.DrawRectangle(randPosX, randPosY, 100, 100, MY_PURPLE)
			}
		}
		rl.EndDrawing()
	}
	rl.CloseWindow()
}
