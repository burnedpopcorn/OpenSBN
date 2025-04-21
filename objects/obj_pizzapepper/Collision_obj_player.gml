if (visible == true)
{
    visible = false;
    
    repeat (6)
        instance_create(x, y, obj_grapedebris);
    
    with (other)
    {
        vsp = -14;
        state = states.jetpackjump;
        sprite_index = spr_player_jetpackstart;
        doublejump = 0;
        
        with (instance_create(x, y, obj_highjumpcloud2))
            sprite_index = spr_null;
    }
    
    timetovisible = 100;
}
