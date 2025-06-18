function cutscene_customer_create(xx, yy, _idle, _happy, _xscale)
{
    with (instance_create(xx, yy, obj_customeractor))
    {
        image_xscale = _xscale;
        depth = other.depth - 1;
        sprite_index = _idle;
        spr_idle = _idle;
        spr_happy = _happy;
    }
    
    cutscene_end_action();
}
