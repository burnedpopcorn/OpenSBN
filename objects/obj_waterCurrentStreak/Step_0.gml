if (!place_meeting(x, y, obj_water) || (image_alpha <= 0 && vanishing))
{
    instance_destroy();
    exit;
}

if (vanishing)
    image_alpha -= 0.15;
else if (image_alpha < 1)
    image_alpha += 0.15;

var _y = y;

if (!(instance_exists(fromCurrent) && place_meeting(x, y, fromCurrent)))
    vanishing = true;

x += lengthdir_x(currentMovespeed, currentDirection);
_y += lengthdir_y(currentMovespeed, currentDirection);
image_angle = currentDirection;
var _vsp = _y - y;
y = _y;

if (_vsp < 0 && !place_meeting(x, y - 32, obj_water))
    instance_destroy();
