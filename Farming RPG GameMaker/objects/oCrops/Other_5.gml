/// @description Insert description here
// You can write your code in this editor
if(room == rm_farm)
{
	var inst_number = instance_number(oCrop);
	if(inst_number == 0)
	{
		ds_grid_clear(ds_crops_data, -1);
	}
	else
	{
		ds_grid_resize(ds_crops_data, ds_grid_width(ds_crops_data), inst_number);
		
		//Loop thorugh the instance grid
		var gw = ds_grid_width(ds_crops_instances);
		var gh = ds_grid_height(ds_crops_instances);
		var slot = 0;
		
		var xx = 0;
		repeat(gw)
		{
			var yy = 0;
			repeat(gh)
			{
				var inst = ds_crops_instances[# xx, yy];
				
				//If there is an instance in the cell, save data;
				if(inst != 0)
				{
					ds_crops_data[# 0, slot] = xx;
					ds_crops_data[# 1, slot] = yy;
					ds_crops_data[# 2, slot] = inst.cropType;
					ds_crops_data[# 3, slot] = inst.daysOld;
					slot += 1;
				} 
				yy += 1;
			}
			xx += 1;
		}		
	}	
	ds_grid_destroy(ds_crops_instances);
}