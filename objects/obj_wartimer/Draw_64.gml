if (addseconds <= 0)
    draw_set_font(global.bigfont);
else
    draw_set_font(global.bigfont);

var xx = 480;
var yy = obj_gameFrame.defaultheight;

if (obj_player1.y > (room_height - 139))
    draw_set_alpha(0.3);
else
    draw_set_alpha(1);

draw_sprite(spr_null, addseconds > 0, xx, yy);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var t = string(minutes);

if (string_length(t) < 2)
    t = concat("0", minutes);

var q = string(seconds);

if (string_length(q) < 2)
    q = concat("0", seconds);

var x2 = xx - 75;
var y2 = yy - 90;

for (var i = 0; i < string_length(t); i++)
    draw_text(x2 + (i * 43), y2, string_char_at(t, i + 1));

x2 = xx + 65;

for (var i = 0; i < string_length(q); i++)
    draw_text(x2 + (i * 43), y2, string_char_at(q, i + 1));

draw_set_alpha(1);
