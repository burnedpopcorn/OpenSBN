if (instance_exists(obj_optionNew))
    exit;

draw_set_font(global.bigfont);
draw_set_color(c_white);

if (state != menuselected.bofallingcutscene)
{
    draw_text_scribble(obj_gameFrame.defaultwidth - 128, obj_gameFrame.defaultheight - 40, string("[spr_transfopromptfont][fa_center][fa_middle]{0} ERASE", get_control_sprite("taunt")));
    draw_text_scribble(43, obj_gameFrame.defaultheight - 164, string("[spr_transfopromptfont][fa_center][fa_middle]{0}", get_control_sprite("start")));
    draw_sprite_ext(spr_mainmenu_option, 0, 8, obj_gameFrame.defaultheight - 160, 1, 1, 0, c_white, image_alpha);
    draw_text_scribble(128, 80, string("[spr_transfopromptfont][fa_center][fa_middle]{0}", get_control_sprite("slap")));
    draw_sprite_ext(spr_mainmenu_quit, 0, 16, 16, 1, 1, 0, c_white, image_alpha);
    draw_sprite_ext(spr_mainmenu_statusbox, 0, obj_gameFrame.defaultwidth - 256, obj_gameFrame.defaultheight - 256, 1, 1, 0, c_white, image_alpha);
    draw_set_font(global.menuperfont);
    draw_set_halign(fa_right);
    draw_set_valign(fa_top);
    draw_text(obj_gameFrame.defaultwidth - 84, obj_gameFrame.defaultheight - 180, displayPer);
    draw_set_font(global.bigfont);
}

if (state == menuselected.deletesave)
{
    draw_set_alpha(0.6);
    draw_rectangle_color(-100, -100, obj_gameFrame.defaultwidth + 100, obj_gameFrame.defaultheight + 100, c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1);
    draw_sprite(spr_mainmenu_deleteconfirm, altDisplayIndex, (obj_gameFrame.defaultwidth / 2) + 64, obj_gameFrame.defaultheight / 2);
    draw_text_scribble(obj_gameFrame.defaultwidth / 2, (obj_gameFrame.defaultheight / 2) - 96, string("[spr_transfopromptfont][fa_center][fa_middle]DELETING SAVE FILE {0}!", selected));
    var displayNum = ceil(deleteBuffer / 60);
    var dots = ".";
    
    repeat (3 - displayNum)
        dots += ".";
    
    var c = make_color_hsv(0, 255 * (1 - (displayNum / 4)), 255);
    draw_set_color(c);
    draw_text_scribble(obj_gameFrame.defaultwidth / 2, obj_gameFrame.defaultheight / 2, string("[spr_transfopromptfont][fa_center][fa_middle]{0}{1}", displayNum, dots));
    draw_set_color(c_white);
    draw_text_scribble(obj_gameFrame.defaultwidth / 2, (obj_gameFrame.defaultheight / 2) + 96, "[spr_transfopromptfont][fa_center][fa_middle]ARE YOU SURE?");
}

if (state == menuselected.endgame)
{
    draw_set_alpha(0.6);
    draw_rectangle_color(-100, -100, obj_gameFrame.defaultwidth + 100, obj_gameFrame.defaultheight + 100, c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1);
    draw_sprite(spr_mainmenu_exitconfirm, altDisplayIndex, obj_gameFrame.defaultwidth / 2, (obj_gameFrame.defaultheight / 2) - 75);
    draw_text_scribble(obj_gameFrame.defaultwidth / 2, obj_gameFrame.defaultheight / 2, "[spr_transfopromptfont][fa_center][shake][fa_middle]LEAVING BO SOON?");
    draw_set_color(select2 ? c_gray : c_white);
    draw_text_scribble((obj_gameFrame.defaultwidth / 2) - 64, (obj_gameFrame.defaultheight / 2) + 96, "[spr_transfopromptfont][fa_right][fa_middle]BYE");
    draw_set_color(select2 ? c_white : c_gray);
    draw_text_scribble((obj_gameFrame.defaultwidth / 2) + 64, (obj_gameFrame.defaultheight / 2) + 96, "[spr_transfopromptfont][fa_left][fa_middle]NO");
    draw_set_color(c_white);
}

if (endFadeAlpha > 0)
{
    draw_set_alpha(endFadeAlpha);
    draw_rectangle_color(-100, -100, obj_gameFrame.defaultwidth + 100, obj_gameFrame.defaultheight + 100, c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1);
}
