if (global.laps > 0)
    instance_destroy();

if (global.panic)
{
    image_alpha = 1;
    
    if (sprite_index == spr_pizzaportal)
    {
        playerid = -4;
        
        with (obj_player1)
        {
            if (other.playerid == -4 && place_meeting(x, y, other))
            {
                event_play_oneshot("event:/SFX/misc/lapenter", x, y);
                state = states.actor;
                visible = false;
                other.sprite_index = spr_pizzaportalend;
                other.image_speed = 0.45;
                other.image_index = 0;
                other.playerid = id;
                var val = 3000;
                global.combotime = 60;
                global.collect += val;
                
                with (instance_create(x, y, obj_smallnumber))
                    number = string(val);
            }
        }
    }
    else if (sprite_index == spr_pizzaportalend)
    {
        global.combotime = 60;
        
        with (playerid)
        {
            hsp = 0;
            vsp = 0;
            visible = false;
        }
        
        if (floor(image_index) == (image_number - 1))
        {
            image_index = image_number - 1;
            image_speed = 0;
            
            if (!instance_exists(obj_fadeout))
            {
                with (obj_player1)
                {
                    targetDoor = "LAP";
                    targetRoom = other.targetRoom;
                }
                
                for (var i = 0; i < ds_list_size(global.escaperoom); i++)
                {
                    var b = ds_list_find_value(global.escaperoom, i);
                    var q = ds_list_find_index(global.baddieroom, b);
                    var t = 0;
                    
                    if (q == -1)
                    {
                        q = ds_list_find_index(global.saveroom, b);
                        t = 1;
                    }
                    
                    if (q != -1)
                    {
                        if (!t)
                            ds_list_delete(global.baddieroom, q);
                        else
                            ds_list_delete(global.saveroom, q);
                    }
                }
                
                global.laps++;
                global.lap = true;
                instance_create(0, 0, obj_fadeout);
            }
        }
    }
}
else
{
    image_alpha = 0.5;
}
