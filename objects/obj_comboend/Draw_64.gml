if (!global.option_hud)
    exit;

var xx = x;
var yy = y;
draw_sprite(spr_comboend, 0, xx, yy);
title = floor(combo / 5);

if (beyond)
    draw_sprite(spr_combobeyond, 0, xx - 65, yy - 6);

draw_sprite(spr_comboend_title1, (title * 2) + title_index, xx, yy + 30);
draw_set_font(global.timerfont);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text(xx, yy + 60, comboscoreMax);
