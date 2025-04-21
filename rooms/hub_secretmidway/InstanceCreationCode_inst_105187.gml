visible = false;
flags.do_once_per_save = true;

condition = function()
{
    return place_meeting(x, y, obj_player1) && input_check("up");
};

output = function()
{
    mail_trigger(UnknownEnum.Value_22);
};
