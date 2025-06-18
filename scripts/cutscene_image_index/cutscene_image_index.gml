function cutscene_image_index(_obj, _index)
{
    with (_obj)
        image_index = _index;
    
    cutscene_end_action();
}
