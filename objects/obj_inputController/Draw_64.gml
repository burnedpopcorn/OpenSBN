var _halign = draw_get_halign();
var _valign = draw_get_halign();
draw_set_halign(fa_center);
draw_set_halign(fa_center);
draw_set_color(c_red);
draw_set_font(global.bigfont);

if (showtext)
{
    var taprev = textalpha;
    textalpha = abs(sin(textflashacc * current_time)) + 0.05;
    
    if (textalpha >= 1 && taprev < 1)
    {
        textflash--;
        
        if (textflash <= 0)
            showtext = false;
    }
    
    draw_set_alpha(1 - textalpha);
    
    if (device_found && device_selected[UnknownEnum.Value_0] == false)
        draw_text(obj_gameFrame.defaultwidth / 2, obj_gameFrame.defaultheight - 64, "Controller found - press Start to connect.");
    else if (!device_found)
        draw_text(obj_gameFrame.defaultwidth / 2, obj_gameFrame.defaultheight - 64, "Controller disconnected!");
}

draw_set_alpha(1);
draw_set_halign(_halign);
draw_set_valign(_valign);
draw_set_color(c_white);
