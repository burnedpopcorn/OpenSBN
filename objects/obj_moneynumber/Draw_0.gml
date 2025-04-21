draw_set_font(global.collectfont);
draw_set_halign(fa_center);
var c = 65280;
draw_set_color(c);

if (flash)
    shader_set(shd_hit);

draw_text(x, y, number);

if (flash)
    shader_reset();
