if (obj_player1.state == states.taxi)
{
    if (!global.pizzadelivery)
    {
        with (instance_create(obj_stopsign.x - 480, obj_stopsign.y, obj_taxidud))
            playerid = obj_player1;
    }
    else
    {
        with (instance_create(obj_checkpoint.x - 480, obj_checkpoint.y - 50, obj_taxidud))
            playerid = obj_player1;
        
        with (obj_player1)
        {
            x = obj_checkpoint.x;
            y = obj_checkpoint.y - 50;
        }
    }
}

if (obj_player1.state == UnknownEnum.Value_154)
{
    with (obj_player1)
    {
        visible = true;
        state = states.normal;
    }
}
