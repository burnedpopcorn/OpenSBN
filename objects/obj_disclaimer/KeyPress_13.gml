with (obj_player1)
{
    global.leveltosave = "midway";
    global.leveltorestart = midway_1;
    state = states.comingoutdoor;
    movespeed = 0;
    hsp = 0;
    vsp = 0;
    targetRoom = midway_1;
    targetDoor = "A";
    instance_create(x, y, obj_fadeout);
}
