with (instance_create(x, y, obj_baddieDead))
{
    event_play_oneshot("event:/SFX/enemies/kill", x, y);
    sprite_index = other.sprite_index;
    image_xscale = other.image_xscale;
}

instance_destroy();
