var _actor = 0;

with (obj_player1)
{
    if (state == states.actor)
        _actor = 1;
}

if (_actor)
    exit;

if (global.horse)
    exit;

if (!place_meeting(x, y, obj_doorblocked))
{
    with (other)
    {
        if (input_check("up") && !instance_exists(obj_jumpscare) && other.sprite_index == spr_doorvisited && grounded && (state == states.normal || state == states.mach1 || state == states.mach2 || state == states.pogo || state == states.mach3 || state == states.Sjumpprep) && ((character != "M" && y == (other.y + 50)) || (character == "M" && y == (other.y + 55))) && !instance_exists(obj_noisesatellite) && !instance_exists(obj_fadeout) && state != states.door && state != states.comingoutdoor)
        {
            obj_player1.lastroom = room;
            obj_player2.lastroom = room;
            event_play_oneshot("event:/SFX/misc/door");
            obj_camera.chargecamera = 0;
            ds_list_add(global.saveroom, id);
            
            if (object_index == obj_player1)
                obj_player1.sprite_index = obj_player1.spr_lookdoor;
            
            if (object_index == obj_player2)
                obj_player2.sprite_index = obj_player2.spr_lookdoor;
            
            obj_player1.targetDoor = other.targetDoor;
            obj_player1.targetRoom = other.targetRoom;
            obj_player2.targetDoor = other.targetDoor;
            obj_player2.targetRoom = other.targetRoom;
            obj_player1.image_index = 0;
            obj_player1.state = states.door;
            obj_player1.mach2 = 0;
            
            if (instance_exists(obj_player2) && global.coop == true)
            {
                if (object_index == obj_player2)
                {
                    obj_player1.x = obj_player2.x;
                    obj_player1.y = obj_player2.y;
                }
                
                if (object_index == obj_player1)
                {
                    obj_player2.x = obj_player1.x;
                    obj_player2.y = obj_player1.y;
                }
            }
            
            other.visited = 1;
            instance_create(x, y, obj_fadeout);
        }
    }
}
