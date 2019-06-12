/// @description Insert description here
// You can write your code in this editor



//------COLLISION CHECKS
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

//APPLY MOVEMENT

x += moveX;
y += moveY;