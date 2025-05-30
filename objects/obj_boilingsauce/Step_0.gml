if (room == rm_blank)
    exit;

var playerid = instance_place(x, y - 1, obj_player1);

with (playerid)
{
    if (character == "V")
    {
        scr_hurtplayer(id);
    }
    else if (state != states.boots && state != states.gameover && state != states.rideweenie && state != states.gotoplayer)
    {
        var _pindex = (object_index == obj_player1) ? 0 : 1;
        GamepadSetVibration(_pindex, 1, 1, 0.85);
        
        if (state != states.fireass)
            tv_push_prompt_once(tv_create_prompt("This is the fireass transformation text", tv_prompttypes.normal, spr_null, 3), "fireass");
        
        state = states.fireass;
        vsp = -20;
        sprite_index = spr_fireass;
        image_index = 0;
        movespeed = hsp;
    }
}
