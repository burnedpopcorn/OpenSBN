var objArr = [obj_player1, obj_baddie];

for (var i = 0; i < array_length(objArr); i++)
{
    with (objArr[i])
    {
        if (x < other.wrapLeft)
            x = other.wrapRight - 1;
        else if (x > other.wrapRight)
            x = other.wrapLeft + 1;
        
        var p = object_get_parent(object_index);
        
        switch (p)
        {
            case obj_baddie:
                if (thrown)
                {
                    y += 4;
                    
                    if (grounded)
                        instance_destroy();
                }
                
                break;
        }
    }
}
