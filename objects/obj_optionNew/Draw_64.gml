draw_rectangle_color(0, 0, obj_gameFrame.defaultwidth, 540, c_black, c_black, c_black, c_black, false);

for (var i = 0; i < array_length(menuarr); i++)
{
    var mm = menuarr[i];
    draw_sprite_tiled_ext(mm.bgspr, 0, bg_x, bg_y, 1, 1, c_white, mm.alpha);
}

with (obj_option_keyconfig)
    event_perform(ev_draw, ev_gui);

if (instance_exists(obj_option_keyconfig))
    exit;

draw_set_font(global.bigfont);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
var sel = selected;
var m = menuarr[menu];
var options = m.options;
var len = array_length(options);
var size = (string_height("A") * len) + (len * m.ypad);
var xx = obj_gameFrame.defaultwidth / 2;
var yy = 270 - (size / 4);

if (m.align_center)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    var c = 16777215;
    
    for (var i = 0; i < len; i++)
    {
        var o = options[i];
        
        if (i == sel && variable_instance_exists(o, "drawIcon"))
            o.drawIcon(xx + (string_width(o.name) / 2) + 64, yy + (m.ypad * i));
        
        c = 8421504;
        
        if (i == sel)
            c = 16777215;
        
        draw_text_color(xx, yy + (m.ypad * i), o.name, c, c, c, c, 1);
    }
}
else
{
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    xx = m.xpad;
    var c = 16777215;
    
    for (var i = 0; i < len; i++)
    {
        draw_set_halign(fa_left);
        var o = options[i];
        c = 8421504;
        
        if (i == sel)
            c = 16777215;
        
        draw_text_color(xx, yy + (m.ypad * i), o.name, c, c, c, c, 1);
        draw_set_halign(fa_right);
        
        switch (o.type)
        {
            case UnknownEnum.Value_1:
            case UnknownEnum.Value_2:
                if (i == sel && variable_instance_exists(o, "drawIcon"))
                    o.drawIcon(xx + (string_width(o.name) / 2) + 64, yy + (m.ypad * i));
                
                break;
            
            case UnknownEnum.Value_3:
                draw_text_color(obj_gameFrame.defaultwidth - m.xpad, yy + (m.ypad * i), o.value ? "ON" : "OFF", c, c, c, c, 1);
                break;
            
            case UnknownEnum.Value_4:
                draw_text_color(obj_gameFrame.defaultwidth - m.xpad, yy + (m.ypad * i), o.dictionary[o.value], c, c, c, c, 1);
                break;
            
            case UnknownEnum.Value_5:
                var w = 208;
                var h = 16;
                var wper = w * (o.value / 100);
                var x1 = obj_gameFrame.defaultwidth - m.xpad - w;
                var y1 = yy + (m.ypad * i);
                var x2 = x1 + wper;
                var y2 = floor(y1 + h);
                var isAudio = !is_undefined(o.sound);
                var sliderspr = spr_optionSlideBar;
                var spr = isAudio ? spr_optionSlideAudioStart : spr_optionSlideControlStart;
                draw_sprite_ext(sliderspr, 0, x1, y2, 1, 1, 0, c, 1);
                var endIndex = (o.value >= 100) ? 1 : 0;
                draw_sprite_ext(spr_optionSlideBarEnd, endIndex, (obj_gameFrame.defaultwidth - m.xpad) + 16, y2, 1, 1, 0, c, 1);
                draw_sprite_part_ext(sliderspr, 1, 0, 0, wper, 96, x1, y2 - 48, 1, 1, c, 1);
                var eyeIndex = o.moving ? 1 : 2;
                var cursorindex = isAudio ? 1 : 2;
                
                if (o.value <= 0)
                {
                    eyeIndex = 0;
                    cursorindex = 0;
                }
                
                draw_sprite_ext(spr, eyeIndex, x1 - 32, y2, 1, 1, 0, c, 1);
                draw_sprite_ext(spr_optionSlideCursor, cursorindex, x2, y2, 1, 1, 0, c, 1);
                break;
        }
    }
}
