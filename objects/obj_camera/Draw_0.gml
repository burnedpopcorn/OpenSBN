draw_set_color(c_black);
var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var cam_w = camera_get_view_width(view_camera[0]);
var cam_h = camera_get_view_height(view_camera[0]);
draw_rectangle(-abs(cam_x), -abs(cam_y), cam_x + cam_w, 0, false);
draw_rectangle(-abs(cam_x), -abs(cam_y), 0, cam_y + cam_h, false);
draw_rectangle(room_width, -abs(cam_y), cam_x + cam_w, cam_y + cam_h, false);
draw_rectangle(-abs(cam_x), room_height, cam_x + cam_w, cam_y + cam_h, false);
draw_set_color(c_white);
