if (room == hub_soundtest || room == hub_world1)
    soundtest = true;

with (obj_player1)
{
    if (object_index != obj_player2 || global.coop)
    {
        if (targetDoor == "S" && secretportalID == other.id)
        {
            x = other.x;
            y = other.y;
            roomstartx = x;
            roomstarty = y;
            
            with (obj_followcharacter)
            {
                x = other.x;
                y = other.y;
            }
            
            with (obj_garpo)
            {
                x = other.x;
                y = other.y;
            }
            
            other.sprite_index = spr_secretportal_close;
            other.image_index = 0;
            instance_destroy(other);
            instance_create(x, y, obj_secretportalstart);
        }
    }
}

if (ds_list_find_index(global.saveroom, id) != -1)
{
    active = 0;
    sprite_index = spr_secretportal_close;
    image_index = 0;
    trace("portal active: false");
}
