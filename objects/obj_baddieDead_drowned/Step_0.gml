scr_collision();

if (!place_meeting(x, y, obj_water))
    instance_destroy();

if (alarm[0] <= -1)
    vsp = approach(vsp, 0, 0.5);

if (vsp <= 0)
    scale = approach(scale, 0, 0.025);

if (scale <= 0)
    instance_destroy();
