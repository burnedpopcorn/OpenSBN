sprite_index = spr_turnipGrassCave;

onPick = function()
{
    var inst = instance_create(x, y, obj_twoliterdog);
    inst.state = enemystates.grabbed;
    
    with (obj_player1)
    {
        inst.grabbedby = id;
        grabbingenemy = true;
        baddiegrabbedID = inst;
        state = states.grab;
        sprite_index = spr_haulingidle;
    }
};
