content = [obj_collect];

onPick = function()
{
    with (instance_create(x, y, obj_objspawner))
    {
        content_arr = other.content;
        
        func = function()
        {
            x = obj_player1.x;
            y = obj_player1.y;
        };
    }
};
