#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance,Force
CoordMode, Pixel, Screen
CoordMode, Mouse, screen


MouseGetPos, ogx, ogy

bound1X := ogx-50
bound1Y := ogy-50
bound2X := ogx+2000
bound2Y := ogy+50
variation = 5
comp := variation*.8

;;;;;CYAN POINT;;;;;
PixelSearch, cyanX, anchorY, bound1X, bound1Y, bound2X, bound2Y, 0x00ffff, variation, Fast RGB

if ErrorLevel
{
	PixelSearch, cyanX2, anchorY2, bound1X, bound1Y, bound2X, bound2Y, 0x00c0c0, variation, Fast RGB
	MouseClick,, cyanX2, anchorY2
	if ErrorLevel
		Msgbox, Cyan pixel not found.
} else MouseClick,, cyanX+comp, anchorY

sleep 10

;;;;;BLUE POINT;;;;;
PixelSearch, blueX, blueY, bound1X, bound1Y, bound2X, bound2Y, 0x0000ff, variation, Fast RGB

if ErrorLevel
{
	PixelSearch, blueX2, blueY2, bound1X, bound1Y, bound2X, bound2Y, 0x0003c0, variation, Fast RGB
	MouseClick,, blueX2+comp, anchorY2
	if ErrorLevel
		Msgbox, Blue pixel not found.
} else MouseClick,, blueX+comp, anchorY

sleep 10

;;;;;MAGENTA POINT;;;;;
PixelSearch, magentaX, magentaY, bound1X, bound1Y, bound2X, bound2Y, 0xff00ff, variation, Fast RGB

if ErrorLevel
{
	PixelSearch, magentaX2, magentaY2, bound1X, bound1Y, bound2X, bound2Y, 0xc000c0, variation, Fast RGB
	MouseClick,, magentaX2+comp, anchorY2
	if ErrorLevel
		Msgbox, Magenta pixel not found.
} else MouseClick,, magentaX+comp, anchorY

sleep 10

;;;;;RED POINT;;;;;
PixelSearch, redX, redY, bound1X, bound1Y, bound2X, bound2Y, 0xff0000, variation, Fast RGB

if ErrorLevel
{
	PixelSearch, redX2, redY2, bound1X, bound1Y, bound2X, bound2Y, 0xc00000, variation, Fast RGB
	MouseClick,, redX2+comp, anchorY2
	if ErrorLevel
		Msgbox, Red pixel not found.
} else MouseClick,, redX+comp, anchorY

sleep 10

;;;;;YELLOW POINT;;;;;
PixelSearch, yellowX, yellowY, bound1X, bound1Y, bound2X, bound2Y, 0xffff00, variation, Fast RGB

if ErrorLevel
{
	PixelSearch, yellowX2, yellowY2, bound1X, bound1Y, bound2X, bound2Y, 0xc0c000, variation, Fast RGB
	MouseClick,, yellowX2+comp, anchorY2
	if ErrorLevel
		Msgbox, Yellow pixel not found.
} else MouseClick,, yellowX+comp, anchorY

sleep 10

;;;;;GREEN POINT;;;;;
PixelSearch, greenX, greenY, bound1X, bound1Y, bound2X, bound2Y, 0x00ff00, variation, Fast RGB

if ErrorLevel
{
	PixelSearch, greenX2, greenY2, bound1X, bound1Y, bound2X, bound2Y, 0x00c000, variation, Fast RGB
	MouseClick,, greenX2+comp, anchorY2
	if ErrorLevel
		Msgbox, Green pixel not found.
} else MouseClick,, greenX+comp, anchorY