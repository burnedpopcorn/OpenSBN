if (!showMail)
    exit;

if (!surface_exists(mailSurf))
    mailSurf = surface_create(sWidth, sHeight);

surface_set_target(mailSurf);
draw_clear_alpha(c_black, 0);
draw_sprite_tiled(bg, 0, bg_pos.x, bg_pos.y);
var letter_exists = false;

for (var i = 0; i < array_length(obtainedMail); i++)
{
    var letter = obtainedMail[i];
    var ii = letter.read ? 1 : 0;
    var xs = 1;
    var ys = 1;
    
    if (selected == i)
    {
        letter_exists = true;
        ii = 2;
        xs = envelope_xscale;
        ys = envelope_yscale;
    }
    
    draw_sprite_ext(letter.envelopespr, ii, 6 + sprite_get_xoffset(letter.envelopespr), (messagePadY + sprite_get_yoffset(letter.envelopespr) + (i * 70)) - scrollY, xs, ys, 0, image_blend, image_alpha);
}

if (letter_exists)
{
    var current_letter = obtainedMail[selected];
    draw_sprite(current_letter.paperspr, 1, letter_pos.x + 8, letter_pos.y + 8);
    draw_sprite(current_letter.paperspr, 0, letter_pos.x, letter_pos.y);
    letter_pos.x = ceil(lerp(letter_pos.x, letter_pos.xstart, 0.2));
    letter_pos.y = ceil(lerp(letter_pos.y, letter_pos.ystart, 0.2));
    draw_set_font(font);
    draw_set_color(c_black);
    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    var yy = 32 + letter_pos.y;
    var textArr = string_split(current_message, "\n");
    
    if (array_length(textArr) > 0)
    {
        var lastline = min(11, array_length(textArr) - 1);
        
        for (var i = 0; i < lastline; i++)
        {
            if (i == 0)
                draw_text(ceil(16 + letter_pos.x), ceil(16 + letter_pos.y), textArr[i]);
            else
                draw_text(ceil(letter_pos.x - 16), ceil(yy + (32 * i)), textArr[i]);
        }
        
        draw_set_halign(fa_right);
        draw_set_valign(fa_bottom);
        draw_text(ceil((letter_pos.x + 432) - 32), ceil((letter_pos.y + 432) - 32), textArr[lastline]);
    }
}

surface_reset_target();
var sx = gui_pos.x;
var sy = gui_pos.y;
draw_surface(mailSurf, sx, sy);
draw_sprite_ext(spr_mailbox_hud, 0, sx - 8, sy - 8, (sWidth + 16) / 96, (sHeight + 16) / 96, 0, image_blend, image_alpha);
