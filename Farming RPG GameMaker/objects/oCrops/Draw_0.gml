/// @description Insert description here
// You can write your code in this editor
if(!planting) exit;


var cs = cellSize;
var gx = (mx div cs);
var gy = (my div cs);



var c = c_red;
var cell = ds_crops_instances[# gx, gy];
if(cell == 0)
{
	var lay_id = layer_get_id("tiles_soil");
	var map_id = layer_tilemap_get_id(lay_id);
	var data = tilemap_get_at_pixel(map_id, mx, my);
	if (data != 0)
	{
		c = c_lime;	
	}
}
var xx = gx*cs;
var yy = gy*cs;


//Draw a rectangel red or green
draw_rectangle_color(xx,yy,xx+cs,yy+cs,c,c,c,c,true);

//Draw crop to be planted
draw_sprite(s_crops_picked, selectCrop, (xx+1/2*cs), (yy+1/2*cs));