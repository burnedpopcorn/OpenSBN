x += hsp;

with (instance_place(x + hsp, y, obj_grape))
{
    mail_trigger(mailtriggers.makecherrykillgrape);
    instance_destroy();
}

if (baddieID != -4 && !instance_exists(baddieID) && !player)
{
    instance_create(x, y, obj_genericpoofeffect);
    instance_destroy();
}

if (place_meeting_collision(x + hsp, y))
    instance_destroy();

if (_afterimage > 0)
{
    _afterimage--;
}
else
{
    _afterimage = 5;
    create_red_afterimage(x, y, sprite_index, image_index - 1, image_xscale);
}
