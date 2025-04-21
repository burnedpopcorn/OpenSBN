var s = playerid.sprite_index;
var xoff = 0;
var yoff = 0;
var show = false;

switch (s)
{
    case spr_playerN_crazyrun:
    case spr_playerN_mach3:
        show = true;
        break;
    
    case spr_playerN_mach3jump:
        show = true;
        yoff = -12;
        break;
}

visible = show;
x = playerid.x + xoff;
y = playerid.y + yoff;
image_xscale = playerid.xscale;

if (abs(playerid.hsp) <= 0 || playerid.movespeed < 12 || playerid.state == states.comingoutdoor || playerid.state == states.door || room == timesuproom)
    instance_destroy();

if (room == timesuproom)
    instance_destroy();
