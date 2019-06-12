/// @description Insert description here
// You can write your code in this editor


InputLeft = keyboard_check(vk_left);
InputRight = keyboard_check(vk_right);
InputUp = keyboard_check(vk_up);
InputDown = keyboard_check(vk_down);
InputWalk= keyboard_check(vk_control);
InputRun = keyboard_check(vk_lshift);
//-------RESET MOVE VARIABLES
moveX = 0;
moveY = 0;



//-------ALTERNATE SPEED 
if(InputWalk || InputRun) 
{
	spd = abs(InputWalk * w_spd - InputRun * r_spd);
}
else spd = n_spd;



//-------INTENDED MOVEMENT
moveX = (InputRight - InputLeft) * spd;
if (moveX == 0) { moveY = (InputDown - InputUp) * spd; }

if(moveX != 0)
{
	switch(sign(moveX))
	{
	case 1 : facing = dir.right; break;
	case -1 : facing = dir.left; break;
	}
}
else if(moveY != 0)
{
		switch(sign(moveY))
	{
	case 1 : facing = dir.down; break;
	case -1 : facing = dir.up; break;
	}
}
else
{
	facing = -1;	
}

//------COLLISION CHECKS

//Horizontal
if(moveX != 0)
{
	var collisionH = instance_place(x+moveX, y, oCollision);
	if(collisionH != noone and collisionH.collideable)
	{
		repeat(abs(moveX))
		{
			if(!place_meeting(x+sign(moveX), y, oCollision))
			{
			x += sign(moveX)	
			}
			else 
			{
				break;	
			}
		}
		moveX = 0;
	}
}
//Objects
var inst = instance_place(x,y,oTransition);
if(inst != noone && facing == inst.PlayerFacingBefore)
{
	with(oGame)
	{
		if(!doTransition)
		{
		spawnRoom = inst.TargetRoom;
		spawnX = inst.TargetX;
		spawnY = inst.TargetY;
		spawnPlayerFacing = inst.PlayerFacingAfter;
		doTransition = true;
		}
	}
}
//Vertical
if(moveY != 0)
{
	var collisionV = instance_place(x,y+moveY,oCollision)
	if(collisionV != noone and collisionV.collideable)
	{
		repeat(abs(moveY))
		{
			if(!place_meeting(x, y+sign(moveY), oCollision))
			{
			y += sign(moveY)	
			}
			else 
			{
				break;	
			}
		}
		moveY = 0;
	}
}

//------APPLY MOVEMENT
x += moveX;
y += moveY;


