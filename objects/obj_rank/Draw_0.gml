if (brownfade < 1)
{
    shader_set(global.Pal_Shader);
    
    if (global.collect >= global.collectN)
        pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, 0);
    
    if (global.collectN > global.collect)
        pal_swap_set(obj_player2.spr_palette, obj_player2.paletteselect, 0);
    
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    shader_reset();
}

if (brown)
{
    draw_set_alpha(brownfade);
    shader_set(shd_rank);
    draw_rectangle_color(0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), c_white, c_white, c_white, c_white, 0);
    draw_self();
    shader_reset();
    draw_set_alpha(1);
}

var c = 16777215;
var xx = 523;
var cash_y = 0;
var sep = 89;

if (toppinvisible)
{
    var i = array_length(toppin) - 1;
    
    while (i >= 0)
    {
        if (toppin[i] == 0)
            c = 0;
        else
            c = 16777215;
        
        if (toppin[i] == 1)
        {
            switch (i)
            {
                case 0:
                    cash_y = -60;
                    break;
                
                case 1:
                    cash_y = -40;
                    break;
                
                case 2:
                    cash_y = -22;
                    break;
                
                case 3:
                    cash_y = -52;
                    break;
                
                case 4:
                    cash_y = -46;
                    break;
            }
            
            var _x = xx + (sep * i);
            var _y = toppin_y[i] + cash_y;
        }
        
        draw_sprite_ext(spr_ranktoppins, i, xx + (sep * i), toppin_y[i], 1, toppin_yscale[i], 0, c, 1);
        i--;
    }
    
    if (toppinsecret != 0 && toppin_index >= array_length(toppin))
    {
        var targetxPos = sprite_get_width(spr_toppinsecret_endrank) + 360;
        var p = toppinsecretpos;
        toppinsecretpos = approach(toppinsecretpos, targetxPos, 24);
        
        if (toppinsecretpos != p && toppinsecretpos == targetxPos)
            event_play_oneshot("event:/SFX/misc/toppingot", room_width / 2, room_height / 2);
        
        draw_sprite_ext(spr_toppinsecret_endrank, toppinsecret - 1, (camera_get_view_width(view_camera[0]) + 360) - toppinsecretpos, camera_get_view_height(view_camera[0]) / 2, 1, 1, 0, c_white, 1);
    }
}

draw_set_font(global.bigfont);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

for (var i = 0; i < array_length(text); i++)
{
    var b = text[i];
    
    if (b[0])
        draw_text_color(48, 48 + (32 * i), b[1], c_white, c_white, c_white, c_white, 1);
}
