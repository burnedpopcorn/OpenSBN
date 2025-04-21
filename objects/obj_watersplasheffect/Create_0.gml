depth = 151;
image_speed = 1;
var try4 = 0;

while (place_meeting(x, y + 1, obj_water))
{
    y--;
    try4++;
    
    if (try4 > 32)
    {
        instance_destroy();
        break;
    }
}

try4 = 0;

while (!place_meeting(x, y, obj_water))
{
    y++;
    try4++;
    
    if (try4 > 32)
    {
        instance_destroy();
        break;
    }
}

with (obj_secretportal)
{
    if (secret)
    {
        other.secret = true;
        other.image_blend = #0043FF;
    }
}
