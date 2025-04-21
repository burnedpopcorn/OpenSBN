image_index = playerid.image_index;
image_xscale = playerid.xscale;
x = playerid.x;
y = playerid.y;
visible = playerid.visible;

if (playerid.sprite_index == spr_null)
    sprite_index = spr_null;

if (playerid.sprite_index == spr_null)
    sprite_index = spr_null;

if (playerid.state != states.trashroll && playerid.state != states.chainsaw)
    instance_destroy();
