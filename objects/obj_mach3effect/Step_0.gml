if (!playerid.state == UnknownEnum.Value_123 && !playerid.state == UnknownEnum.Value_106)
    instance_destroy();

visible = playerid.visible;

if (playerid.state == states.mach2)
    image_alpha = playerid.movespeed / 16;
