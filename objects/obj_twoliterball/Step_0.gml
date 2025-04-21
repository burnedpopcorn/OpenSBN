hsp = image_xscale * movespeed;
movespeed = approach(movespeed, 14, 0.5);

with (instance_place(x + hsp, y, obj_baddie))
{
    if (object_index == obj_twoliterdog)
        image_xscale = -image_xscale;
    
    instance_destroy();
}

var _allow_collisions = true;
var _destructibleArr = [obj_destructibles, obj_ratblock, obj_metalblock];
var _hsp = sign(hsp);

for (var i = 0; i < array_length(_destructibleArr); i++)
{
    var _ob = _destructibleArr[i];
    
    with (instance_place(x + _hsp, y, _ob))
    {
        instance_destroy();
        _allow_collisions = false;
    }
}

if (collide_buffer > 0)
{
    collide_buffer--;
    _allow_collisions = false;
}

instance_destroy(instance_place(x + hsp, y, obj_destructibles));
instance_destroy(instance_place(x + hsp, y, obj_metalblock));
instance_destroy(instance_place(x + hsp, y, obj_ratblock));

if (place_meeting_collision(x + _hsp, y, UnknownEnum.Value_1) && _allow_collisions)
    instance_destroy();

scr_collision();
blur_effect--;

if (blur_effect <= 0)
{
    create_blur_afterimage(x, y, sprite_index, image_index, image_xscale, image_yscale, image_angle);
    blur_effect = 2;
}
