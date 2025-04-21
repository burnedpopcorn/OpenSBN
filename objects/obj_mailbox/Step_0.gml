if (!place_meeting(x, y, obj_player1))
{
    gui_pos.x = ceil(lerp(gui_pos.x, gui_pos.xstart, 0.2));
    gui_pos.y = ceil(lerp(gui_pos.y, gui_pos.ystart, 0.2));
    sprite_index = idleSpr;
    image_speed = newmessage ? 0.35 : 0;
    
    if (!newmessage)
        image_index = 1;
    
    exit;
}
else
{
    bg_pos.x -= 0.5;
    bg_pos.y -= 0.5;
    gui_pos.x = ceil(lerp(gui_pos.x, (obj_gameFrame.defaultwidth - sWidth) / 2, 0.1));
    gui_pos.y = ceil(lerp(gui_pos.y, (obj_gameFrame.defaultheight - sHeight) / 2, 0.1));
    showMail = true;
    sprite_index = openSpr;
}

var has_unread = false;

for (var i = 0; i < array_length(obtainedMail); i++)
{
    var letter = obtainedMail[i];
    
    if (selected == i)
    {
        current_message = letter.content;
        letter.setRead();
    }
    
    if (!letter.read)
        has_unread = true;
}

newmessage = has_unread;
var move2 = input_check_pressed("down") - input_check_pressed("up");
var pos_old = selected;

if (move2 != 0)
{
    selected += move2;
    selected = clamp(selected, 0, array_length(obtainedMail) - 1);
    
    if (pos_old != selected)
    {
        letter_pos.x = messagePadX + random_range(-200, 200);
        letter_pos.y = sHeight + 32;
        envelope_xscale = 2;
        envelope_yscale = 2;
        event_play_oneshot("event:/SFX/ui/back");
    }
}

envelope_xscale = approach(envelope_xscale, 1, 0.1);
envelope_yscale = approach(envelope_yscale, 1, 0.1);

if (((((selected + 1) * 70) + 80) - scrollY) > sHeight)
    scrollY += 8;
else if (((selected * 70) - scrollY) < 0)
    scrollY -= 8;
