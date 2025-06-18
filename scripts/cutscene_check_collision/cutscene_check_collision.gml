function cutscene_check_collision(obj1, obj2)
{
    var finish = false;
    
    with (obj1)
    {
        if (place_meeting(x, y, obj2))
            finish = true;
    }
    
    if (finish)
        cutscene_end_action();
}
