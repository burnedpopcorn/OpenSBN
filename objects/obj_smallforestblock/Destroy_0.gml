if (ds_list_find_index(global.saveroom, id) == -1)
{
    repeat (2)
    {
        with (create_debris(x + random_range(0, sprite_width), y + random_range(0, sprite_height), spr_null, 0))
        {
            hsp = random_range(-5, 5);
            vsp = random_range(-10, 10);
            image_speed = 0;
        }
    }
    
    scr_sleep(5);
    event_play_oneshot("event:/SFX/misc/breakblock", x, y);
    ds_list_add(global.saveroom, id);
}
