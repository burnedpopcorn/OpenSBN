var _secret_layer_setup = function(argument0, argument1)
{
    layer_set_visible(layer_get_id(argument0), false);
};

tiles = ["Tiles_Secret1", "Tiles_Secret2", "Tiles_Secret3"];

secretFunction = function()
{
    return place_meeting(x, y, obj_player1);
};
