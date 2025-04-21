x = playerid.x;
y = playerid.y + yoff;

if (playerid.state != states.superslam && playerid.state != states.freefall)
    instance_destroy();

visible = !(room == rank_room);
