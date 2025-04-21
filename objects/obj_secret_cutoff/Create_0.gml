image_speed = 0;
depth = 50;
trueYscale = image_yscale;
image_yscale = sign(image_yscale);
imageIndexArray = [irandom_range(0, image_number - 1)];

repeat (abs(trueYscale) - 1)
    array_push(imageIndexArray, irandom_range(0, image_number - 1));

if (ds_list_find_index(global.saveroom, id) == -1)
    ds_list_add(global.saveroom, id, imageIndexArray);
else
    imageIndexArray = ds_list_find_value(global.saveroom, ds_list_find_index(global.saveroom, id) + 1);

image_angle = round(image_angle / 90) * 90;
