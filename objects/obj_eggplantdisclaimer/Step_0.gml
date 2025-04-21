var accel = 0.015;

if (!fadeout)
{
    fade = approach(fade, 0, accel);
    
    if (fade <= 0)
    {
        fadeout = 1;
        alarm[0] = 240;
    }
}
else if (changeroom)
{
    fade = approach(fade, 1, accel);
    
    if (fade >= 1 && !instance_exists(obj_fadeout))
    {
        with (obj_player1)
        {
            targetRoom = hub_entrancehall;
            targetDoor = "A";
        }
        
        instance_create(0, 0, obj_fadeout);
    }
}
