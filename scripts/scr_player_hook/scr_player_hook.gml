function state_player_hook()
{
    if (input_check_pressed("jump"))
    {
        state = states.jump;
        sprite_index = spr_jump;
        image_index = 0;
        vsp = -11;
        jumpstop = 0;
    }
    
    exit;
}
