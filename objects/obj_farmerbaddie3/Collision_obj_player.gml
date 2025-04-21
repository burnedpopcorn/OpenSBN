if (state == states.punch)
{
    with (other)
    {
        if (state != states.boots && state != states.gameover && state != states.rideweenie && state != states.gotoplayer)
        {
            gamepad_vibrate_constant(1, 0.85);
            
            if (state != states.fireass)
                tv_push_prompt_once(tv_create_prompt("This is the fireass transformation text", tv_prompttypes.normal, spr_null, 3), "fireass");
            
            state = states.fireass;
            vsp = -25;
            sprite_index = spr_fireass;
            image_index = 0;
            movespeed = hsp;
        }
    }
}
