x = room_width / 2;
y = -10;
hitboxcreate = 0;
var lay_id = layer_background_get_id_fixed("Backgrounds_1");
var back_id = layer_background_get_id_fixed(lay_id);

if (layer_background_get_sprite(back_id) != 2077)
    layer_background_sprite(back_id, 2077);
