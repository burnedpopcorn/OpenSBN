if (state != states.policetaxi)
    exit;

if (!instance_exists(obj_fadeout))
{
    with (instance_create(x, y, obj_fadeout))
        roomreset = 1;
}
