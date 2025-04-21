if (ds_list_find_index(global.saveroom, id) == -1)
{
    repeat (8)
    {
        with (create_debris(x + random_range(0, 64), y + random_range(0, 64), spr_null, 0))
        {
            hsp = random_range(-5, 5);
            vsp = random_range(-10, 10);
            image_index = random_range(0, image_number - 1);
            image_speed = 0;
        }
    }
    
    scr_sleep(5);
    ds_list_add(global.saveroom, id);
}
