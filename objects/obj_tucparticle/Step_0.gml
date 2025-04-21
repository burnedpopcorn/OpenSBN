if (vsp < 12)
    vsp += 0.2;

image_speed = 0;
x += hsp;
y += vsp;

if (x > camera_get_view_width(view_camera[0]) || y > camera_get_view_height(view_camera[0]) || x < 0 || y < 0)
    instance_destroy();
