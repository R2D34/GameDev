if (instance_exists(oPlayer) && instance_exists(oSign))
{
	if(!point_in_circle(oPlayer.x,oPlayer.y,x,y,150)) instance_destroy();	
}