event_inherited();

canCollide = function(argument0 = obj_player)
{
    switch (argument0)
    {
        case obj_player:
        case obj_player1:
        case obj_player2:
            with (argument0)
            {
                var _state = (state == states.backbreaker || state == states.chainsaw) ? tauntstoredstate : state;
                return _state == states.gotoplayer || _state == states.trashjump || _state == states.trashjumpprep || _state == states.mach3 || _state == states.Parry || sprite_index == spr_mach3boost;
            }
            
            break;
        
        default:
            return false;
            break;
    }
    
    return false;
};
