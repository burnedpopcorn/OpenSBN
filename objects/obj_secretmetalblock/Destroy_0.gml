if (ds_list_find_index(global.saveroom, id) == -1)
{
    repeat (8)
    {
        with (create_debris(x + random_range(0, 64), y + random_range(0, 64), particlespr))
        {
            hsp = random_range(-5, 5);
            vsp = random_range(-10, 10);
            image_index = random_range(0, image_number - 1);
            image_speed = 0;
        }
    }
    
    repeat (3)
    {
        with (instance_create(x + random_range(0, 64), y + random_range(0, 64), obj_parryeffect))
        {
            scr_sleep(5);
            instance_create(x + 32, y + 32, obj_bangeffect);
        }
    }
    
    with (obj_camera)
    {
        shake_mag = 20;
        shake_mag_acc = 40 / room_speed;
    }
    
    event_play_oneshot("event:/SFX/misc/breakmetal", x, y);
    ds_list_add(global.saveroom, id);
    
    if (particlespr == spr_bottledebris)
        event_play_oneshot("event:/SFX/misc/bottledestroy", x, y);
    
    ds_list_add(global.saveroom, id);
}

scr_destroy_tiles(32, "Tiles_1");
scr_destroy_tiles(32, "Tiles_2");
scr_destroy_tiles(32, "Tiles_3");
scr_destroy_tiles(32, "Tiles_4");
scr_destroy_tiles(32, "Tiles_Foreground1");
scr_destroy_tiles(32, "Tiles_Foreground2");
scr_destroy_nearby_tiles();
