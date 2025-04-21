var _actor = 0;

with (obj_player1)
{
    if (state == states.actor)
        _actor = 1;
}

if (_actor)
    exit;

with (other)
{
    if (input_check("up") && grounded && !instance_exists(obj_option) && (state == states.normal || state == states.mach1 || state == states.mach2 || state == states.pogo || state == states.mach3 || state == states.Sjumpprep))
    {
        instance_create(x, y, obj_option);
        state = states.actor;
    }
}
