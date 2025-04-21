if (state == UnknownEnum.Value_154)
    exit;

if (ds_queue_size(followqueue) < LAG_STEPS)
    exit;

with (obj_player1)
{
    targetRoom = other.targetRoom;
    lastroom = room;
    targetDoor = other.targetDoor;
    visible = false;
    
    if (state != states.gotoplayer)
        state = UnknownEnum.Value_154;
    
    cutscene = 1;
    hsp = 0;
    vsp = 0;
}

grav = 0;
state = UnknownEnum.Value_154;
hsp = 10;
image_xscale = 1;
vsp = 0;
