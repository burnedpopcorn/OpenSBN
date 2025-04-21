var can_chase = global.redcoin;

if (global.collectsound < 10)
    global.collectsound += 1;

if (global.timeattack == 1)
    instance_destroy();

if (place_meeting(x, y, obj_destructibles))
    depth = 102;
else
    depth = 2;

if (can_chase)
{
    if (!active)
    {
        active = true;
        x = xstart;
        y = ystart;
        instance_create(xstart, ystart, obj_genericpoofeffect);
    }
    
    if (abs(distance_to_object(obj_player1)) < 25)
        gotowardsplayer = true;
    
    if (gotowardsplayer)
    {
        move_towards_point(obj_player1.x, obj_player1.y, movespeed);
        movespeed++;
    }
}
else
{
    x = -200;
    y = -200;
    
    if (active)
    {
        active = false;
        instance_create(xstart, ystart, obj_genericpoofeffect);
    }
    
    gotowardsplayer = false;
    movespeed = 6;
    speed = 0;
}
