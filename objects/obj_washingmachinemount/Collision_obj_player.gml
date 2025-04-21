if (other.y < y && visible == true)
{
    other.image_index = 0;
    other.sprite_index = spr_null;
    other.state = states.hookshot;
    visible = false;
}
