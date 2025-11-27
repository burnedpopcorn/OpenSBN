if (instance_number(object_index) > 1)
{
    instance_destroy();
    exit;
}

state = states.normal;
trapid = noone;
image_speed = 0.35;
