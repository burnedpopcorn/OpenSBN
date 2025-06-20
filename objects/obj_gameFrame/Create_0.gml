enum resolution
{
	normal = 0,
	undertale = 1
}
global.resolutions[resolution.normal] = [[480, 270], [960, 540], [1024, 576], [1280, 720], [1600, 900], [1920, 1080]];
global.resolutions[resolution.undertale] = [[640, 480], [800, 600], [1024, 768], [1152, 864], [1440, 1080]];
depth = -99999;
gameframe_init();
scr_init_options();
global.gameframe_caption_text = "The Bo-ginning of Super Bo Noise!";
global.gameframe_caption_font = font_caption;
global.gameframe_caption_icon = spr_gameframe_icon;
global.gameframe_caption_margin = 6;
global.gameframe_border_width = 2;
do_focus = true;
previousMouseX = device_mouse_x_to_gui(0);
previousMouseY = device_mouse_y_to_gui(0);
captionBuffer = 100;
zoom = 1;
scale = 1;
savedwidth = window_get_width();
savedheight = window_get_height();
saved_guiwidth = display_get_gui_width();
saved_guiheight = display_get_gui_height();
currentwidth = savedwidth;
currentheight = savedheight;
defaultwidth = global.resolutions[resolution.normal][1][0];
defaultheight = global.resolutions[resolution.normal][1][1];
displaywidth = defaultwidth;
displayheight = defaultheight;
gui_surface = -4;
application_surface_draw_enable(false);
__display_set_gui_size_hook(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
alarm[0] = 1;
alarm[2] = 1;
