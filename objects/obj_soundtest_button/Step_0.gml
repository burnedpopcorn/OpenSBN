if (!instance_exists(obj_soundtest))
    exit;

if (pressBuffer > 0)
{
    image_index = 1;
    pressBuffer--;
}
else
{
    image_index = 0;
}

if (type == UnknownEnum.Value_1)
    image_index = obj_soundtest.active;
