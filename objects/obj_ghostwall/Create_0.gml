canCollide = function(argument0 = obj_player)
{
    switch (argument0)
    {
        case obj_player:
        case obj_player1:
        case obj_player2:
            var _state = (argument0.state == states.backbreaker || argument0.state == states.chainsaw) ? argument0.tauntstoredstate : argument0.state;
            return _state != states.ghost;
            break;
        
        default:
            return true;
            break;
    }
};

with (instance_create(x, y, obj_ghosttransparency))
{
    mask_index = other.sprite_index;
    sprite_index = other.sprite_index;
    image_xscale = other.image_xscale;
}

away = 0;
