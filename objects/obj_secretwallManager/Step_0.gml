var _badtouch = false;

for (var i = 0; i < array_length(collision_arr); i++)
{
    var me = collision_arr[i];
    var my_cond = true;
    
    if (instance_exists(me))
    {
        with (me)
        {
            if (object_is_ancestor(object_index, obj_baddie))
                my_cond = state != enemystates.grabbed && object_index != obj_grandpa;
            
            if (place_meeting(x, y, obj_secrettile) && my_cond)
                _badtouch = true;
        }
    }
}

var current_hider = obj_player1.secret_array;

if (_badtouch)
    depth = -8;
else
    depth = -8;

if (array_length(global.secret_layers) > 0)
{
    for (var i = 0; i < array_length(global.secret_layers); i++)
        global.secret_layers[i].alpha = approach(global.secret_layers[i].alpha, array_contains(current_hider, global.secret_layers[i].nm) ? 0 : 1, 0.05);
}
