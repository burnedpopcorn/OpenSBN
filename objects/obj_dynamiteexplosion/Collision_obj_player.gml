with (other)
{
    if (other.hurtplayer == 0)
    {
        if (input_check_pressed("jump"))
        {
            vsp = -20;
            
            if (state == states.normal || state == states.jump || hsp == 0)
            {
                sprite_index = spr_null;
                state = states.jump;
            }
            
            image_index = 0;
            jumpAnim = 1;
            jumpstop = 1;
            other.hurtplayer = 1;
        }
    }
}
