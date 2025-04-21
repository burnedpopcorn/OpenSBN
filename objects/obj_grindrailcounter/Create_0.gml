event_inherited();
visible = false;
flags.do_once_per_save = true;

condition = function()
{
    var p = instance_place(x, y, obj_player1);
    
    if (p != -4)
        return p.state == states.grind;
    
    return false;
};

output = function()
{
    global.grinds++;
    trace("Grindcount: ", global.grinds);
    
    if (global.grinds >= 36)
        mail_trigger(UnknownEnum.Value_6);
};
