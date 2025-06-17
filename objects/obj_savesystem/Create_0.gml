depth = -400;

if (instance_number(object_index) > 1)
{
    instance_destroy();
    exit;
}

enum savestate
{
	idle = 0,
	saving = 1,
	loading = 2
}

showicon = false;
icon_alpha = 0;
ini_str = "";
state = savestate.idle;
icon_index = 0;
icon_max = sprite_get_number(spr_pizzaslice);
ini_open("saveData.ini");
ini_str_options = ini_close();
