with (other)
{
    if (state == states.firemouth && sprite_index == spr_firemouth)
    {
        sprite_index = spr_firemouthend;
        image_index = 0;
        other.sprite_index = spr_null;
        other.image_index = 0;
    }
}

if (sprite_index == spr_null && floor(image_index) == (image_number - 1))
    sprite_index = spr_null;
