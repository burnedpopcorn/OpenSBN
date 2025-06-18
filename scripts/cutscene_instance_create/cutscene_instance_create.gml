function cutscene_instance_create(_obj, xx, yy, _xscale)
{
    with (instance_create(xx, yy, _obj))
    {
        depth = other.depth;
        image_xscale = _xscale;
        xscale = _xscale;
    }
    
    cutscene_end_action();
}
