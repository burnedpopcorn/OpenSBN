var t;

if (!ds_exists(tex_list, ds_type_list))
{
    t = 1;
}
else
{
    var p = tex_max - ds_list_size(tex_list);
    t = p / tex_max;
}

var spr_w = sprite_get_width(spr_loadingbo);
var spr_h = sprite_get_height(spr_loadingbo);
var xx = floor((camera_get_view_width(view_camera[0]) / 2) - (spr_w / 2));
var yy = floor((camera_get_view_height(view_camera[0]) / 2) - (spr_h / 2));
draw_sprite(spr_loadingbo, 0, xx, yy);
var _t = spr_h * (1 - t);
var _h = spr_h * t;
_t = clamp(_t, 0, spr_h);
_h = clamp(_h, 0, spr_h);
draw_sprite_part(spr_loadingbo, 1, 0, _t, spr_w, _h, xx, yy + _t);
