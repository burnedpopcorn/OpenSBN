layer_depth("Tiles_BG", 200);
layer_depth("Tiles_BG2", 199);
layer_depth("Tiles_BG3", 198);
layer_depth("Tiles_1", 100);
layer_depth("Tiles_2", 98);
layer_depth("Tiles_3", 97);
layer_depth("Tiles_4", 96);
layer_depth("Tiles_Foreground1", -30);
layer_depth("Tiles_Foreground2", -31);
layer_depth("Tiles_Foreground3", -32);
layer_depth("Assets_BG", 201);

if (global.hidetiles)
{
    layer_set_visible("Tiles_BG", 0);
    layer_set_visible("Tiles_BG2", 0);
    layer_set_visible("Tiles_BG3", 0);
    layer_set_visible("Tiles_1", 0);
    layer_set_visible("Tiles_2", 0);
    layer_set_visible("Tiles_3", 0);
    layer_set_visible("Tiles_4", 0);
    layer_set_visible("Tiles_Foreground1", 0);
    layer_set_visible("Tiles_Foreground2", 0);
    layer_set_visible("Tiles_Foreground3", 0);
}

bg_scrollx = 0;
bg_scrolly = 0;
bg_scrollxoffset = layer_get_x("Backgrounds_scroll");
bg_scrollyoffset = layer_get_y("Backgrounds_scroll");
bg_scroll2x = 0;
bg_scroll2y = 0;
bg_scroll2xoffset = layer_get_x("Backgrounds_scroll2");
bg_scroll2yoffset = layer_get_y("Backgrounds_scroll2");
bg_still1xoffset = layer_get_x("Backgrounds_still1");
bg_still1yoffset = layer_get_y("Backgrounds_still1");
bg_still2xoffset = layer_get_x("Backgrounds_still2");
bg_still2yoffset = layer_get_y("Backgrounds_still2");
bg_stillH1xoffset = layer_get_x("Backgrounds_stillH1");
bg_stillH1yoffset = layer_get_y("Backgrounds_stillH1");
bg_stillH2xoffset = layer_get_x("Backgrounds_stillH2");
bg_stillH2yoffset = layer_get_y("Backgrounds_stillH2");
bg_1xoffset = layer_get_x("Backgrounds_1");
bg_1yoffset = layer_get_y("Backgrounds_1");
bg_2xoffset = layer_get_x("Backgrounds_2");
bg_2yoffset = layer_get_y("Backgrounds_2");
layer_depth("Foreground_Ground1", -300);
layer_depth("Foreground_1", -300);
layer_depth("Backgrounds_Ground1", 250);
