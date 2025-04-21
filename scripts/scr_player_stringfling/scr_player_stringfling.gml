function state_player_stringfling()
{
    sprite_index = spr_player_mrpinch;
    hsp = move * movespeed;
    movespeed = 2;
    vsp = 2;
    move = input_check("right") - input_check("left");
    
    if (move != 0)
        xscale = move;
    
    exit;
}
