depth = -400;

if (instance_number(object_index) > 1)
{
    instance_destroy();
    exit;
}

showicon = 0;
icon_alpha = 0;
ini_str = "";
state = UnknownEnum.Value_0;
icon_index = 0;
icon_max = sprite_get_number(spr_pizzaslice);
ini_open("saveData.ini");
ini_str_options = ini_close();
