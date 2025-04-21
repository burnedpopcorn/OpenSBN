canCollide = function(argument0 = obj_player)
{
    switch (argument0)
    {
        case obj_player:
        case obj_player1:
        case obj_player2:
            var _state = (argument0.state == states.backbreaker || argument0.state == states.chainsaw) ? argument0.tauntstoredstate : argument0.state;
            return _state != states.ladder && _state != states.backbreaker && _state != states.bump;
            break;
        
        default:
            return false;
            break;
    }
};
