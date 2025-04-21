if (!window_has_focus())
{
    alarm[0] = 1;
    exit;
}

if (!gameframe_get_fullscreen())
    gameframe_restore();

var w = global.resolutions[global.option_aspect_ratio][global.option_resolution][0];
var h = global.resolutions[global.option_aspect_ratio][global.option_resolution][1];
displaywidth = global.resolutions[global.option_aspect_ratio][1][0];
displayheight = global.resolutions[global.option_aspect_ratio][1][1];
window_set_size(w, h);
alarm[1] = 2;
