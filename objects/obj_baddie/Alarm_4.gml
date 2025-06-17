create_red_afterimage(x, y, sprite_index, image_index - 1, image_xscale);

if (grounded == true)
{
    with (instance_create(x, y, obj_dashcloud2))
        image_xscale = other.image_xscale;
}

if (state == states.rage)
    alarm[4] = 5;
