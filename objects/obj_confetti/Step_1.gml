image_angle -= (spin * sign(image_xscale));
var shrink = random_range(0.005, 0.02);
image_xscale = approach(image_xscale, 0, shrink);
image_yscale = approach(image_yscale, 0, shrink);

if (image_xscale == 0 || image_yscale == 0)
    instance_destroy();
