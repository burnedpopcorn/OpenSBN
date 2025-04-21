if (!global.option_hud || is_bossroom() || room == rm_blank || room == rm_mainmenu)
    exit;

if (obj_player1.state != states.gameover)
{
    if (obj_player1.x < 250 && obj_player1.y < 169)
        hud_posY = approach(hud_posY, -300, 15);
    else
        hud_posY = approach(hud_posY, 0, 15);
    
    pizzascore_index += 0.35;
    
    if (pizzascore_index > (pizzascore_number - 1))
        pizzascore_index = 0 + frac(pizzascore_index);
    
    var hud_xx = 121 + irandom_range(-collect_shake, collect_shake);
    var hud_yy = 90 + irandom_range(-collect_shake, collect_shake) + hud_posY;
    draw_sprite_ext(spr_pizzascore, pizzascore_index, hud_xx, hud_yy, 1, 1, 0, c_white, alpha);
    var _score = global.collect;
    
    if (global.coop)
        _score += global.collectN;
    
    var rx = hud_xx + 142;
    var ry = hud_yy - 22;
    var rank_ix = 0;
    
    if (_score >= global.srank && scr_is_p_rank())
        rank_ix = 5;
    else if (_score >= global.srank)
        rank_ix = 4;
    else if (_score >= global.arank)
        rank_ix = 3;
    else if (_score >= global.brank)
        rank_ix = 2;
    else if (_score >= global.crank)
        rank_ix = 1;
    
    if (previousrank != rank_ix)
    {
        var _snd = global.snd_rankup;
        previousrank = rank_ix;
        
        if (rank_ix < previousrank)
            _snd = global.snd_rankdown;
        
        fmod_event_play(_snd);
        fmod_event_setParameter(_snd, "state", rank_ix - 1, true);
        rank_scale = 3;
    }
    
    rank_scale = approach(rank_scale, 1, 0.2);
    draw_sprite_ext(spr_ranks_hud, rank_ix, rx, ry, rank_scale, rank_scale, 0, c_white, 1);
    var spr_w = sprite_get_width(spr_ranks_hudfill);
    var spr_h = sprite_get_height(spr_ranks_hudfill);
    var spr_xo = sprite_get_xoffset(spr_ranks_hudfill);
    var spr_yo = sprite_get_yoffset(spr_ranks_hudfill);
    var perc = 0;
    
    switch (rank_ix)
    {
        case 4:
            perc = 1;
            break;
        
        case 3:
            perc = (_score - global.arank) / (global.srank - global.arank);
            break;
        
        case 2:
            perc = (_score - global.brank) / (global.arank - global.brank);
            break;
        
        case 1:
            perc = (_score - global.crank) / (global.brank - global.crank);
            break;
        
        default:
            perc = _score / global.crank;
    }
    
    var t = spr_h * perc;
    var top = spr_h - t;
    draw_sprite_part(spr_ranks_hudfill, rank_ix, 0, top, spr_w, spr_h - top, rx - spr_xo, (ry - spr_yo) + top);
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);
    draw_set_font(global.collectfont);
    var text_y = 0;
    var cs = 0;
    
    with (obj_comboend)
        cs += comboscore;
    
    with (obj_particlesystem)
    {
        for (var i = 0; i < ds_list_size(global.collect_list); i++)
            cs += ds_list_find_value(global.collect_list, i).value;
    }
    
    var sc = _score - global.comboscore - cs;
    var str = string(sc);
    var num = string_length(str);
    var w = string_width(str);
    var xx = hud_xx - (w / 2);
    
    if (lastcollect != sc)
    {
        color_array = array_create(num, 0);
        
        for (var i = 0; i < array_length(color_array); i++)
            color_array[i] = choose(irandom(3));
        
        lastcollect = sc;
    }
    
    shader_set(global.Pal_Shader);
    draw_set_alpha(alpha);
    
    for (var i = 0; i < num; i++)
    {
        var yy = (((i + 1) % 2) == 0) ? -5 : 0;
        var c = color_array[i];
        pal_swap_set(spr_null, c, 0);
        draw_text(xx, (hud_yy - 56) + text_y + yy, string_char_at(str, i + 1));
        xx += (w / num);
    }
    
    draw_set_alpha(1);
    shader_reset();
    draw_set_font(global.bigfont);
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    
    if (obj_player1.character == "V")
        draw_text(200 + healthshake, 125 + healthshake, global.playerhealth);
}
