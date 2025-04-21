if (explodeInstant >= 2)
{
    with (instance_create(x, y, obj_canonexplosion))
        rat = true;
}
else
{
    instance_create(x, y, obj_twoliterexplosion);
}

event_play_oneshot("event:/SFX/enemies/2literexplode", x, y);
