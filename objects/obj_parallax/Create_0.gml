depth = -5;
global.ScrollOffset = 0;

if (instance_number(obj_parallax) > 1)
{
    var _first = instance_find(obj_parallax, 0);
    
    if (id != _first)
    {
        instance_destroy();
        exit;
    }
}

layerArray = [];
scr_addParallaxLayer("Backgrounds_1", defaultParallax, [0.35, 0.35]);
scr_addParallaxLayer("Backgrounds_2", defaultParallax, [0.25, 0.25]);
scr_addParallaxLayer("Backgrounds_3", defaultParallax, [0.15, 0.15]);
scr_addParallaxLayer("Backgrounds_4", defaultParallax, [0.05, 0.05]);
scr_addParallaxLayer("Backgrounds_5", defaultParallax, [0.005, 0.005]);
scr_addParallaxLayer("Backgrounds_1_ZigZag", defaultParallaxZigZag, [0.35, 0.35, 0, 50]);
scr_addParallaxLayer("Backgrounds_2_ZigZag", defaultParallaxZigZag, [0.25, 0.25, 0, 75]);
scr_addParallaxLayer("Backgrounds_3_ZigZag", defaultParallaxZigZag, [0.15, 0.15, 0, 100]);
scr_addParallaxLayer("Backgrounds_4_ZigZag", defaultParallaxZigZag, [0.05, 0.05, 0, 125]);
scr_addParallaxLayer("Backgrounds_5_ZigZag", defaultParallaxZigZag, [0.005, 0.005, 0, 150]);
scr_addParallaxLayer("Backgrounds_Ground1", defaultParallaxGround, [0.35, 0.35]);
scr_addParallaxLayer("Backgrounds_Ground2", defaultParallaxGround, [0.25, 0.25]);
scr_addParallaxLayer("Backgrounds_Ground3", defaultParallaxGround, [0.15, 0.15]);
scr_addParallaxLayer("Backgrounds_Ground4", defaultParallaxGround, [0.05, 0.05]);
scr_addParallaxLayer("Backgrounds_Ground5", defaultParallaxGround, [0.005, 0.005]);
scr_addParallaxLayer("Backgrounds_H1", defaultParallaxH, [0.35, 0.35]);
scr_addParallaxLayer("Backgrounds_H2", defaultParallaxH, [0.25, 0.25]);
scr_addParallaxLayer("Backgrounds_H3", defaultParallaxH, [0.15, 0.15]);
scr_addParallaxLayer("Backgrounds_H4", defaultParallaxH, [0.05, 0.05]);
scr_addParallaxLayer("Backgrounds_H5", defaultParallaxH, [0.005, 0.005]);
scr_addParallaxLayer("Backgrounds_V1", defaultParallaxV, [0.35, 0.35]);
scr_addParallaxLayer("Backgrounds_V2", defaultParallaxV, [0.25, 0.25]);
scr_addParallaxLayer("Backgrounds_V3", defaultParallaxV, [0.15, 0.15]);
scr_addParallaxLayer("Backgrounds_V4", defaultParallaxV, [0.05, 0.05]);
scr_addParallaxLayer("Backgrounds_V5", defaultParallaxV, [0.005, 0.005]);
scr_addParallaxLayer("Backgrounds_1Far", defaultParallaxFar, [0.35, 0.35]);
scr_addParallaxLayer("Backgrounds_2Far", defaultParallaxFar, [0.25, 0.25]);
scr_addParallaxLayer("Backgrounds_3Far", defaultParallaxFar, [0.15, 0.15]);
scr_addParallaxLayer("Backgrounds_4Far", defaultParallaxFar, [0.05, 0.05]);
scr_addParallaxLayer("Backgrounds_5Far", defaultParallaxFar, [0.005, 0.005]);
scr_addParallaxLayer("Backgrounds_still1", defaultParallaxFar, [0.25, 0.25]);
scr_addParallaxLayer("Backgrounds_still2", defaultParallaxFar, [0.15, 0.15]);
scr_addParallaxLayer("Backgrounds_stillscroll", defaultParallaxFar, [0.15, 0.15]);
scr_addParallaxLayer("Backgrounds_StillH1", defaultParallaxH, [0.35, 0.25]);
scr_addParallaxLayer("Backgrounds_StillH2", defaultParallaxH, [0.25, 0.35]);
scr_addParallaxLayer("Backgrounds_StillH3", defaultParallaxH, [0.15, 0.05]);
scr_addParallaxLayer("Backgrounds_StillH4", defaultParallaxH, [0.05, 0.005]);
scr_addParallaxLayer("Backgrounds_StillH5", defaultParallaxH, [0.005, 0.0025]);
scr_addParallaxLayer("Backgrounds_scroll", defaultParallax, [0.25, 0.25]);
scr_addParallaxLayer("Backgrounds_scroll2", defaultParallax, [0.25, 0.25]);
scr_addParallaxLayer("Backgrounds_sky", defaultParallax, [0.25, 0.25]);
scr_addParallaxLayer("Backgrounds_sky2", defaultParallax, [1, 1]);
scr_addParallaxLayer("Foregrounds_1", defaultParallax, [-0.35, -0.35]);
scr_addParallaxLayer("Foreground_1", defaultParallax, [-0.35, -0.35]);
scr_addParallaxLayer("Foregrounds_2", defaultParallax, [-0.25, -0.25]);
scr_addParallaxLayer("Foregrounds_3", defaultParallax, [-0.15, -0.15]);
scr_addParallaxLayer("Foregrounds_4", defaultParallax, [-0.05, -0.05]);
scr_addParallaxLayer("Foregrounds_5", defaultParallax, [-0.005, -0.005]);
scr_addParallaxLayer("Foregrounds_Ground1", defaultParallaxGround, [-0.35, -0.35]);
scr_addParallaxLayer("Foreground_Ground1", defaultParallaxGround, [-0.15, -0.15]);
scr_addParallaxLayer("Foregrounds_Ground2", defaultParallaxGround, [-0.25, -0.25]);
scr_addParallaxLayer("Foregrounds_Ground3", defaultParallaxGround, [-0.15, -0.15]);
scr_addParallaxLayer("Foregrounds_Ground4", defaultParallaxGround, [-0.05, -0.05]);
scr_addParallaxLayer("Foregrounds_Ground5", defaultParallaxGround, [-0.005, -0.005]);
scr_addParallaxLayer("Foregrounds_H1", defaultParallaxH, [-0.35, -0.35]);
scr_addParallaxLayer("Foregrounds_H2", defaultParallaxH, [-0.25, -0.25]);
scr_addParallaxLayer("Foregrounds_H3", defaultParallaxH, [-0.15, -0.15]);
scr_addParallaxLayer("Foregrounds_H4", defaultParallaxH, [-0.05, -0.05]);
scr_addParallaxLayer("Foregrounds_H5", defaultParallaxH, [-0.005, -0.005]);
scr_addParallaxLayer("Foregrounds_V1", defaultParallaxV, [-0.35, -0.35]);
scr_addParallaxLayer("Foregrounds_V2", defaultParallaxV, [-0.25, -0.25]);
scr_addParallaxLayer("Foregrounds_V3", defaultParallaxV, [-0.15, -0.15]);
scr_addParallaxLayer("Foregrounds_V4", defaultParallaxV, [-0.05, -0.05]);
scr_addParallaxLayer("Foregrounds_V5", defaultParallaxV, [-0.005, -0.005]);
scr_addParallaxLayer("Foregrounds_1Far", defaultParallaxFar, [-0.35, -0.35]);
scr_addParallaxLayer("Foregrounds_2Far", defaultParallaxFar, [-0.25, -0.25]);
scr_addParallaxLayer("Foregrounds_3Far", defaultParallaxFar, [-0.15, -0.15]);
scr_addParallaxLayer("Foregrounds_4Far", defaultParallaxFar, [-0.05, -0.05]);
scr_addParallaxLayer("Foregrounds_5Far", defaultParallaxFar, [-0.005, -0.005]);
scr_addParallaxLayer("Assets_BG", defaultParallax, [0.2, 0.2]);
scr_addParallaxLayer("Assets_BG_1", defaultParallax, [0.35, 0.35]);
scr_addParallaxLayer("Assets_BG_2", defaultParallax, [0.25, 0.25]);
scr_addParallaxLayer("Assets_BG_3", defaultParallax, [0.15, 0.15]);
scr_addParallaxLayer("Assets_BG_4", defaultParallax, [0.05, 0.05]);
scr_addParallaxLayer("Assets_BG_5", defaultParallax, [0.005, 0.005]);
scr_addParallaxLayer("Assets_FG_1", defaultParallax, [-0.35, -0.35]);
scr_addParallaxLayer("Assets_FG_2", defaultParallax, [-0.25, -0.25]);
scr_addParallaxLayer("Assets_FG_3", defaultParallax, [-0.15, -0.15]);
scr_addParallaxLayer("Assets_FG_4", defaultParallax, [-0.05, -0.05]);
scr_addParallaxLayer("Assets_FG_5", defaultParallax, [-0.005, -0.005]);

safe_layer_set_depth = function(argument0, argument1)
{
    if (layer_exists(argument0) && number_in_range(argument1, -16000, 16000))
        layer_depth(argument0, argument1);
};

set_layer_depths = function()
{
    var temp_map = ds_map_create();
    ds_map_set(temp_map, "Tiles_Foreground", 50);
    ds_map_set(temp_map, "Tiles_", 100);
    ds_map_set(temp_map, "Tiles_BG", 200);
    ds_map_set(temp_map, "Assets_BG", 210);
    ds_map_set(temp_map, "Assets_FG", -350);
    ds_map_set(temp_map, "Assets_Foreground", -350);
    ds_map_set(temp_map, "Effect_", -600);
    ds_map_set(temp_map, "Foregrounds_", -500);
    ds_map_set(temp_map, "Foregrounds_Ground", -500);
    ds_map_set(temp_map, "Foregrounds", -500);
    ds_map_set(temp_map, "Tiles_Bottle", 0);
    var a = layer_get_all();
    
    for (var i = 0; i < array_length(a); i++)
    {
        var layer_id = a[i];
        var layer_name = layer_get_name(layer_id);
        var nums = string_digits(layer_name);
        var nums_at = string_last_pos(nums, layer_name);
        var layer_check_name = (nums == "") ? layer_name : string_delete(layer_name, nums_at, real(nums));
        
        if (!is_undefined(ds_map_find_value(temp_map, layer_check_name)))
        {
            var sub = (string_digits(layer_name) == "") ? 0 : real(string_digits(layer_name));
            safe_layer_set_depth(a[i], ds_map_find_value(temp_map, layer_check_name) - sub);
        }
    }
    
    ds_map_destroy(temp_map);
};
