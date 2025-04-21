function state_player_debugstate()
{
    visible = true;
    image_blend = c_white;
    var _spd = 6;
    
    if (input_check("attack"))
        _spd = 10;
    
    hsp = (input_check("right") - input_check("left")) * _spd;
    vsp = -(input_check("up") - input_check("down")) * _spd;
    image_speed = 1;
    sprite_index = spr_player_debugstate;
    
    if (input_check_pressed("jump") || input_check_pressed("slap"))
    {
        image_speed = 0.35;
        state = states.normal;
    }
    
    exit;
}
