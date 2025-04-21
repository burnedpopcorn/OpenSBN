if (!place_meeting(x, y, obj_water))
{
    instance_destroy();
    exit;
}

var _y = y;

if (instance_exists(fromCurrent) && place_meeting(x, y, fromCurrent))
{
    x += lengthdir_x(currentMovespeed, currentDirection);
    _y += lengthdir_y(currentMovespeed, currentDirection);
    xOffset = 0;
}
else
{
    fromCurrent = -4;
    currentMovespeed = approach(currentMovespeed, 0, 0.5);
    x += (xOffset + lengthdir_x(currentMovespeed, currentDirection));
    _y += (vsp + lengthdir_y(currentMovespeed, currentDirection));
    xOffset = approach(xOffset, Wave(-strength, strength, time, 0), strength);
}

var _vsp = _y - y;
y = _y;

if (_vsp < 0 && !place_meeting(x, y - 16, obj_water))
    instance_destroy();
