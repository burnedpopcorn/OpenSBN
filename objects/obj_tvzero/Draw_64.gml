if (global.shithud && global.option_hud)
{
    draw_sprite(spr_subcount, 0, 0, 0);
    draw_sprite_ext(supergamingpizzelle_mild, -1, _face_x, _face_y, 1, 1, 1, c_white, alpha);
    draw_sprite_ext(supergamingpizzelle_mild, -1, _face_x2, _face_y, -1, 1, 1, c_white, alpha);
    
    if (obj_player1.movespeed < 2.4)
        draw_sprite_ext(spr_null, 0, _face_x, _spd_y, 1, 1, 1, c_white, alpha);
    else if (obj_player1.movespeed >= 2.4)
        draw_sprite_ext(spr_null, 1, _face_x, _spd_y, 1, 1, 1, c_white, alpha);
    else if (obj_player1.movespeed >= 4.8)
        draw_sprite_ext(spr_null, 2, _face_x, _spd_y, 1, 1, 1, c_white, alpha);
    else if (obj_player1.movespeed >= 7.2)
        draw_sprite_ext(spr_null, 3, _face_x, _spd_y, 1, 1, 1, c_white, alpha);
    else if (obj_player1.movespeed >= 9.6)
        draw_sprite_ext(spr_null, 4, _face_x, _spd_y, 1, 1, 1, c_white, alpha);
    else if (obj_player1.movespeed >= 12)
        draw_sprite_ext(spr_null, -1, _face_x, _spd_y, 1, 1, 1, c_white, alpha);
    
    draw_text(45, 58, (global.stylethreshold + 1) * global.style);
}
