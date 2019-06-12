/// @description Insert description here
// You can write your code in this editor
depth = -1;
scale = 2;
cell_size = 32;
show_inventory = true;

inv_slots = 17;
inv_slots_width = 8;
inv_slots_height = 3;

x_buffer = 2;
y_buffer = 4;


gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

inv_UI_width = 288;
inv_UI_height = 192;

inv_UI_x = (gui_width * 0.5) - (inv_UI_width * 0.5 * scale);
inv_UI_y = (gui_height * 0.5) - (inv_UI_height * 0.5 * scale);

info_x = inv_UI_x + (9*scale);
info_y = inv_UI_y + (9*scale);

slots_x = info_x;
slots_y = inv_UI_y + (40 * scale);

spr_inv_UI = s_inventory_UI;
spr_inv_items = s_inventory_items;

spr_inv_items_columns = (sprite_get_width(spr_inv_items)/cell_size);
spr_inv_items_rows = (sprite_get_height(spr_inv_items)/cell_size);




//---Player information
//0 = GOLD
//1 = Silver
//2 = Bronze
//3 = Name

ds_player_info = ds_grid_create(2,4);
ds_player_info[# 0, 0] = "Gold";
ds_player_info[# 0, 1] = "Silver";
ds_player_info[# 0, 2] = "Bronze";
ds_player_info[# 0, 3] = "Name";

ds_player_info[# 1, 0] = irandom_range(0,99);
ds_player_info[# 1, 1] = irandom_range(0,99);
ds_player_info[# 1, 2] = irandom_range(0,99);
ds_player_info[# 1, 3] = "Player";


//Inventory
//0 - Item
//1 - Amount

ds_inventory = ds_grid_create(2, inv_slots);

//-----------Items
enum item
{
	none		= 0,
	tomato		= 1,
	potato		= 2,
	carrot		= 3,
	artichoke   = 4,
	chilli		= 5,
	gourd		= 6,
	corn		= 7,
	wood		= 8,
	stone		= 9,
	bucket		= 10,
	chair		= 11,
	picture		= 12,
	axe		    = 13,
	potion		= 14,
	starfish	= 15,
	mushroom	= 16,
	height		= 17,

}


ds_inventory[# 0, 0] = item.bucket;
ds_inventory[# 1, 0] = 1;


var yy = 0;
repeat(inv_slots)
{
	ds_inventory[# 0, yy] = irandom_range(1, item.height-1);
	ds_inventory[# 1, yy] = irandom_range(1, 10);
	yy +=1;
}