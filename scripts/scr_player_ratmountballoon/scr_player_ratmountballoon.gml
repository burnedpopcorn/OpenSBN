function state_player_ratmountballoon()
{
    sprite_index = spr_player_ratmountballoon;
    hsp = movespeed;
    move = input_check("right") - input_check("left");
    
    if (vsp < 2)
        vsp += 0.1;
    else
        vsp = 2;
    
    if (move != 0)
        movespeed = approach(movespeed, move * 8, 0.5);
    else
        movespeed = approach(movespeed, 0, 0.5);
    
    var _jump = 0;
    
    if (balloonbuffer > 0)
        balloonbuffer--;
    else
        _jump = 1;
    
    if (input_check_pressed("jump"))
        _jump = 1;
    
    if (_jump)
    {
        create_particle(x, y, particle.ratmountballooncloud, 0);
        state = states.ratmountjump;
        sprite_index = spr_player_ratmountballoonend1;
        image_index = 0;
        jumpAnim = 1;
        vsp = -20;
        jumpstop = 1;
    }
    
    exit;
}
