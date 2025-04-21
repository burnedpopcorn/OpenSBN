if (text_pos >= array_length(text))
{
    alarm[0] = 150;
}
else
{
    with (obj_camera)
    {
        shake_mag = 2;
        shake_mag_acc = 3 / room_speed;
    }
    
    event_play_oneshot("event:/SFX/enemies/killingblow", room_width / 2, room_height / 2);
    text[text_pos][0] = 1;
    text_pos++;
    alarm[3] = 40;
}
