if (place_meeting(x, y - 1, obj_player1))
{
    obj_player1.state = states.fireass;
    obj_player1.image_index = 0;
    obj_player1.vsp = -25;
    obj_player1.sprite_index = spr_null;
}

if (global.panic == true)
    y -= 0.5;
