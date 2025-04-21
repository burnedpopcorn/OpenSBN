if (beginfall)
{
    fallspeed += 0.0005;
    slant_offset += (fallspeed / 2);
    image_yscale -= fallspeed;
}

if (image_yscale <= 0)
    instance_destroy();
