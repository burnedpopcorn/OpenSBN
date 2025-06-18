if (instance_number(object_index) > 1)
{
    instance_destroy();
    exit;
}

global.player_input_device = -2;
active = true;
device_found = false;
device_selected[states.controller1] = false;
device_selected[states.controller2] = false;
disconnected_device = -2;
showtext = false;
textflash = 0;
textalpha = 1;
textflashacc = 0.002;
vibration1 = 0;
vibrationDecay1 = 0;

if (!variable_global_exists("input_map"))
    global.input_map = ds_map_create();

if (!variable_global_exists("deadzones"))
    global.deadzones = [];

if (!variable_global_exists("keyname_map"))
    global.keyname_map = ds_map_create();

if (!variable_global_exists("input_icons"))
{
    global.input_icons = ds_map_create();
    scr_input_icon_define();
}

for (var i = 0; i < 8; i++)
{
    if (gamepad_is_connected(i))
    {
        device_selected[states.controller1] = true;
        global.player_input_device = i;
        device_found = true;
    }
}

scr_initinput();
