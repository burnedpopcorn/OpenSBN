if (place_meeting(x, y - 16, obj_player1))
{
    with (obj_player1)
    {
        if (place_meeting(x, y + 16, other.id) && !place_meeting_collision(x + xscale, y, Exclude.SLOPES) && bbox_bottom <= other.bbox_top && xscale == sign(other.image_xscale))
        {
            if (state == states.mach2 || state == states.ratmounttumble || state == states.trashroll || state == states.tumble || state == states.mach3 || state == states.trickjump)
            {
                vsp = -12;
                movespeed = 14;
                sprite_index = spr_player_rampjump;
                image_index = 0;
                
                if (isgustavo)
                {
                    sprite_index = spr_player_ratmountwalljump;
                    state = states.ratmounttrickjump;
                }
                else
                {
                    state = states.trickjump;
                }
                
                if (!other.used)
                {
                    ramp = 1;
                    other.used = 1;
                }
                
                ramp_buffer = 16;
                did_ramp = false;
                trace("trickjump");
            }
        }
    }
}
