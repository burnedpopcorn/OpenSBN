if (input_check_pressed("up"))
{
    if (obj_player1.paletteselect < 6)
        obj_player1.paletteselect += 1;
    else
        obj_player1.paletteselect = 1;
}
