with (obj_player1)
{
    if (place_meeting(x + 1, y, other) || place_meeting(x - 1, y, other) || place_meeting(x, y + 1, other) || place_meeting(x, y - 1, other))
    {
        with (other)
        {
            if (other.state != states.barrel)
            {
                scr_hurtplayer(other);
                
                if (fake)
                    instance_destroy();
            }
            else
            {
                with (other)
                {
                    state = states.bump;
                    sprite_index = spr_bump;
                    image_index = 0;
                    hsp = -6 * xscale;
                    vsp = -4;
                    
                    repeat (3)
                        create_debris(x, y, spr_null);
                }
            }
        }
    }
}
