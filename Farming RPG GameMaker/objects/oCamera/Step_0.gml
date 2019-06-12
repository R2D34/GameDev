/// @desc Camera
// You can write your code in this editor

moveCam = keyboard_check(ord("C"));


if(moveCam)
{
 var input_left = keyboard_check(ord("A"));
 var input_right = keyboard_check(ord("D"));
 var input_up = keyboard_check(ord("W"));
 var input_down = keyboard_check(ord("S"));
 x += (input_right - input_left)*cam_spd;
 y += (input_down - input_up)*cam_spd;
}
else
{
x = clamp(x, following.x-h_border, following.x+h_border);
y = clamp(y, following.y-v_border, following.y+v_border);
}