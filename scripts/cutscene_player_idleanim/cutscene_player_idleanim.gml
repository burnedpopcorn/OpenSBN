function cutscene_player_idleanim()
{
    with (obj_player1)
    {
        sprite_index = spr_idle;
        image_speed = 0.35;
    }
    
    cutscene_end_action();
}
