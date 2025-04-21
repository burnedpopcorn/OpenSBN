if (text_state == states.titlescreen && text_y <= -(text_sprite_height * text_yscale))
    exit;

var xx = 16 + text_wave_x + text_xpad;
var yy = text_y + text_wave_y;
tex_x -= 0.5;
scr_draw_granny_texture(xx, yy, text_xscale, text_yscale, tex_x, tex_x, spr_grannyputerbg1, spr_grannyputerbg2, spr_grannyputerbubble);
draw_sprite_ext(spr_grannyputerbubble, 1, xx, yy, text_xscale, text_yscale, 0, c_white, 1);
xx += (level_xpad / 2);
var y1 = 0;

for (var i = 0; i < array_length(levelarray); i++)
{
    var b = levelarray[i];
    y1 = yy + 36;
    xx = round(xx);
    var x2 = (sprite_get_width(spr_list_f1) + sprite_get_width(spr_list_rank)) / 2;
    draw_sprite(spr_list_f1, b.icon, ((xx - x2) + (sprite_get_width(spr_list_f1) / 2)) - 8, y1);
    y1 += 6;
    
    if (b.rank)
    {
        var n = 0;
        
        switch (b.gotrank)
        {
            case "p":
                n = 6;
                break;
            
            case "s":
                n = 5;
                break;
            
            case "a":
                n = 4;
                break;
            
            case "b":
                n = 3;
                break;
            
            case "c":
                n = 2;
                break;
            
            case "d":
                n = 1;
                break;
        }
        
        draw_sprite(spr_list_rank, n, (xx + x2) - (sprite_get_width(spr_list_rank) / 2) - 8, y1);
        y1 += 50;
    }
    
    if (b.toppins)
    {
        var toppinseen = false;
        var w = sprite_get_width(spr_list_star);
        x2 = (array_length(b.toppinarr) * w) / 2;
        x2 *= -1;
        x2 += (w / 2);
        
        for (var j = 0; j < array_length(b.toppinarr); j++)
        {
            draw_sprite(spr_list_star, b.toppinarr[j] ? 1 : 0, xx + x2, y1);
            
            if (b.toppinarr[j])
                toppinseen = true;
            
            x2 += w;
        }
        
        draw_sprite(spr_list_bracket, toppinseen, ((xx + x2) - (6 * w)) + 15, y1);
        draw_sprite(spr_list_bracket, toppinseen + 2, (xx + x2) - 15, y1);
        y1 += 32;
    }
    
    if (b.secrets)
    {
        var secretseen = b.secretcount > 0;
        var w = sprite_get_width(spr_list_bubble);
        x2 = (3 * w) / 2;
        x2 *= -1;
        x2 += (w / 2);
        
        for (var j = 0; j < 3; j++)
        {
            draw_sprite(spr_list_bubble, ((j + 1) <= b.secretcount) ? 1 : 0, xx + x2, y1);
            x2 += w;
        }
        
        draw_sprite(spr_list_bracket, secretseen, ((xx + x2) - (4 * w)) + 15, y1);
        draw_sprite(spr_list_bracket, secretseen + 2, (xx + x2) - 15, y1);
        y1 += 32;
    }
    
    var xs = 0;
    
    if (b.toppinsecret)
    {
        draw_sprite(spr_list_extra, 0, xx - 16, y1);
        xs += 16;
    }
    
    if (b.treasure)
        draw_sprite(spr_list_treasure, b.gottreasure ? 1 : 0, xx + xs, y1);
    
    xx += level_xpad;
}
