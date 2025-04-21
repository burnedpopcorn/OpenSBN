image_xscale = playerid.xscale;
x = playerid.x;
y = playerid.y;

if (playerid.state != states.Parry && playerid.state != states.finishingblow)
    instance_destroy();
