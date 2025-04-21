flags.do_once = false;
roseWater = false;

condition = function()
{
    return !instance_exists(obj_hungrypillar) && !roseWater;
};

output = function()
{
    with (obj_waterTop)
    {
        if (id != 108760)
        {
            instance_destroy();
        }
        else if (event_type == ev_other && event_number == 4)
        {
            x = -64;
            y = -288;
            image_xscale = 138;
            image_yscale = 84;
            roseWater = true;
        }
        else
        {
            var rising_speed = 4;
            x = -64;
            image_xscale = 138;
            
            if (y > -288)
            {
                y = approach(y, -288, rising_speed);
                image_yscale += rising_speed;
            }
            else
            {
                y = -288;
                image_yscale = 84;
                roseWater = true;
            }
        }
    }
};
