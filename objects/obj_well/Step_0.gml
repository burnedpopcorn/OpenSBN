if (!instance_exists(ID) && obj_player1.state != states.mortattack && obj_player1.state != states.mort && obj_player1.state != states.mortjump && obj_player1.state != states.morthook && place_meeting(x, y, obj_player1))
{
    instance_destroy(obj_mort);
    
    with (instance_create(x, y - 50, obj_mort))
        other.ID = id;
}
