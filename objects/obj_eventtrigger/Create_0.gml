inst_num = instance_number(obj_eventtrigger);
condition = noone;
output = noone;
reverse_output = noone;

default_condition = function()
{
    return place_meeting(x, y, obj_player1);
};

default_output = function()
{
    show_debug_message("Event Trigger:" + string(id) + " - Has missing Output");
};

flags = 
{
    do_once: true,
    do_save: true,
    do_once_per_save: false,
    saveroom: global.saveroom
};
activated = false;
condition = default_condition;
output = default_output;
reverse_output = noone;
