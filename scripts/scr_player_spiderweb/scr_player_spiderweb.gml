function state_player_spiderweb()
{
    hsp = 0;
    vsp = 0;
    movespeed = 0;
    move = input_check("right") - input_check("left");
    sprite_index = spr_fall;
    image_speed = 0.35;
    
    if (move != 0)
        xscale = move;
    
    if (instance_exists(webID))
    {
        x = webID.x;
        y = webID.y;
    }
    
    if (input_check_pressed("jump"))
    {
        if (instance_exists(webID))
        {
            with (webID)
                event_user(0);
        }
        
        state = states.jump;
        vsp = -11;
        jumpstop = 0;
        sprite_index = spr_jump;
        image_index = 0;
        jumpAnim = 1;
        event_play_oneshot("event:/SFX/bo/jump", x, y);
    }
    
    exit;
}
