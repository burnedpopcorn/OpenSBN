if (sprite_index == spr_pizzaportalend)
{
    with (obj_player1)
    {
        visible = true;
        sprite_index = spr_pizzaportalentrancestart;
        image_index = 0;
        room_goto(treasure_room);
        player_x = treasure_x;
        player_y = treasure_y;
        ds_list_clear(global.baddieroom);
    }
}
