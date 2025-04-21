if (useGUI && global.option_hud)
{
    draw_set_font(global.smallnumber_fnt);
    draw_set_halign(fa_center);
    var c = negative ? global.smallnumber_color2 : global.smallnumber_color1;
    
    if (color != undefined)
        c = color;
    
    if (flash)
        gpu_set_fog(true, c_white, 0, 1);
    
    draw_text_color(x, y + obj_camera.hud_posY, number, c, c, c, c, 1);
    gpu_set_fog(false, c_black, 0, 0);
}
