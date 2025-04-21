if (!(visible && global.option_hud && showGUI))
    exit;

var nameArr = [["movespeed", "Agility"], ["jump", "Jumping"], ["attack", "Attack"], ["defense", "Defense"], ["swimming", "Swimming"], ["groundpound", "Weight"]];
draw_set_color(c_white);
draw_set_font(global.transfopromptfont);
draw_set_valign(fa_bottom);
var yy = -16;
var xx = 64;
var w = string_width("Swimming    ");
var h = 8;
var i = array_length(nameArr) - 1;

while (i > -1)
{
    var s = nameArr[i];
    var st = struct_get(playerStats, s[0]);
    var lv = st.level;
    var last = (lv == 1) ? 0 : st.exp_curve[lv - 2];
    var per = (st.xp - last) / (st.exp_curve[lv - 1] - last);
    per = clamp(per, 0, 1);
    var c = 65280;
    
    if (lv == 100)
    {
        per = 1;
        c = 65535;
    }
    
    draw_rectangle_color(16, y + yy + 4, 16 + w, y + yy + 4 + h, c_black, c_black, c_black, c_black, false);
    draw_rectangle_color(16, y + yy + 4, 16 + floor(w * per), y + yy + 4 + h, c, c, c, c, false);
    draw_set_halign(fa_left);
    draw_text(32, y + yy, s[1]);
    draw_set_halign(fa_right);
    draw_text(32 + w, y + yy, string(lv));
    yy -= (2 * string_height("A"));
    i--;
}
