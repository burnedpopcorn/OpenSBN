draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_set_font(global.bigfont);
var _levelinfo = level_array[selected_world][selected_level];
draw_text(480, 270, concat(world_array[selected_world], "\n", selected_level + 1, ". ", _levelinfo[0]));
var xx = 355;
var yy = 380;
var c = 16777215;
ini_open_from_string(obj_savesystem.ini_str);
draw_text(480, yy - 38, ini_read_real("Highscore", _levelinfo[2], 0));
var _rank = ini_read_string("Ranks", _levelinfo[2], "none");
var rank_ix = 6;

switch (_rank)
{
    case "p":
        rank_ix = 5;
        break;
    
    case "s":
        rank_ix = 4;
        break;
    
    case "a":
        rank_ix = 3;
        break;
    
    case "b":
        rank_ix = 2;
        break;
    
    case "c":
        rank_ix = 1;
        break;
    
    case "d":
        rank_ix = 0;
        break;
}

draw_sprite(spr_ranks_hud, rank_ix, 200, yy - 38);

for (var i = 0; i < array_length(toppin_info); i++)
{
    var b = toppin_info[i];
    var ix = b[0];
    
    if (!ini_read_real("Toppin", concat(_levelinfo[2], i + 1), 0))
    {
        c = 0;
        ix = 0;
    }
    else
    {
        c = 16777215;
    }
    
    draw_sprite_ext(b[1], ix, xx + (i * 47), yy, 1, 1, 0, c, 1);
}

if (_levelinfo[1] != rm_missing)
{
    if (!ini_read_real("Treasure", _levelinfo[2], 0))
        c = 0;
    else
        c = 16777215;
    
    draw_sprite_ext(spr_treasures, 0, 587, yy + 26, 1, 1, 0, c, 1);
}

draw_set_font(global.tutorialfont);
var sf = ini_read_real("Secret", _levelinfo[2], 0);

if (_levelinfo[1] != rm_missing)
    draw_text_color(480, yy + 88, concat(sf, " OUT OF 3 SECRETS"), c_white, c_white, c_white, c_white, 1);

ini_close();
draw_set_halign(fa_left);
draw_set_valign(fa_top);
