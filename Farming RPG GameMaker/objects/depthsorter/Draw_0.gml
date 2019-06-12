/// @description Insert description here
// You can write your code in this editor
var inst_num = instance_number(par_depthobject);
var dgrid = ds_depthgrid;

ds_grid_resize(dgrid, 2, inst_num);

var yy = 0;
with(par_depthobject)
{

	dgrid[# 0, yy] = id;
	dgrid[# 1, yy] = y;
	yy += 1;
}

ds_grid_sort(dgrid, 1, true);

//Loop through the grid and draw all the instances
yy = 0; var inst;
repeat(inst_num)
{
	inst = dgrid[# 0, yy];
	
	with(inst)
	{
		event_perform(ev_draw, 0);
	}
	
	yy += 1;
		
}