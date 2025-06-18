function cutscene_set_sprite(_obj, _spr, _spd, _xscale)
{
    with (_obj)
    {
        sprite_index = _spr;
        image_speed = _spd;
        image_xscale = _xscale;
        image_index = 0;
        xscale = _xscale;
    }
    
    cutscene_end_action();
}
