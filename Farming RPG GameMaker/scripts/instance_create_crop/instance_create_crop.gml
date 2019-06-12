///@desc instance_create_crop
///@arg x
///@arg y
///@arg crop_type

//Create the instance
var cs = oCrops.cellSize;
var gx = argument0 div cs;
var gy = argument1 div cs;
var i_grid = oCrops.ds_crops_instances;

var xx = gx*cs;
var yy = gy*cs;

//Check for Soil
var lay_id = layer_get_id("tiles_soil");
var map_id = layer_tilemap_get_id(lay_id);
var data = tilemap_get_at_pixel(map_id, argument0, argument1);
var cell = i_grid[# gx, gy];

if(cell == 0)
{
	if(data == 0)
	{
		 show_debug_message("There is no soil here.");
		 return false;
	}
	else 
	{
		show_debug_message("There is soil here!");
	}
	//Create the instance
	var inst = instance_create_layer((xx+1/2*cs), (yy+1/2*cs), "Instances", oCrop);
	i_grid[# gx, gy] = inst;



	with(inst)
	{
		cropType = argument2;
		growthStageDuration = oCrops.ds_crops_types[# 0, cropType];
	
	}

	return inst;
}
else
{
	show_debug_message("There is already something there");
	show_debug_message("gx = " + string(gx));
	show_debug_message("gy = " + string(gy));
	return false;
}