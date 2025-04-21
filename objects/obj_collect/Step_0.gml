if (room == rm_blank)
    exit;

if (global.collectsound < 10)
    global.collectsound += 1;

if (global.timeattack == 1)
    instance_destroy();

if (place_meeting(x, y, obj_destructibles))
    depth = 115;
else
    depth = 2;

if (abs(distance_to_object(obj_player1)) < 25 && !place_meeting(x, y, obj_destructibles) && !place_meeting(x, y, obj_iceblock))
{
    if (!gotowardsplayer)
        scr_ghostcollectible();
    
    gotowardsplayer = 1;
}

if (gotowardsplayer == 1)
{
    move_towards_point(obj_player1.x, obj_player1.y, movespeed);
    movespeed++;
}
