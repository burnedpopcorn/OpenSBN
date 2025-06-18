function cutscene_set_player_normal()
{
    with (obj_player1)
    {
        if (check_player_coop())
            state = states.normal;
    }
    
    cutscene_end_action();
}
