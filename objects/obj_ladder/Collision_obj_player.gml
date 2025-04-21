with (other)
{
    if (input_check("up") && ladderbuffer == 0 && (state == states.normal || state == states.pogo || state == states.mach2 || state == states.mach3 || state == states.mach1 || state == states.shotgunjump || state == states.jump || state == states.highjump) && state != states.hurt && state != states.machslide && state != states.freefall && state != states.freefallland)
    {
        state = states.ladder;
        x = other.x + 16;
        y = floor(y);
        
        if ((y % 2) == 1)
            y -= 1;
    }
    
    if (input_check("up") && ladderbuffer == 0 && (state == states.ratmountjump || state == states.ratmount))
    {
        state = states.ratmountladder;
        
        if (brick == 1)
        {
            with (instance_create(x, y, obj_brickcomeback))
            {
                wait = 1;
                instance_create(x, y, obj_genericpoofeffect);
            }
        }
        
        brick = 0;
        x = other.x + 16;
        y = floor(y);
        
        if ((y % 2) == 1)
            y -= 1;
    }
}
