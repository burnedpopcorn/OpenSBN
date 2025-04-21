if (fadeBuffer > 0)
    fadeBuffer--;
else
    image_alpha -= 0.05;

if (image_alpha <= 0)
    instance_destroy();
