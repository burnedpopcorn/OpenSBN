with (other)
{
    if (input_check("up") && ladderbuffer == 0 && (state == states.fireass || state == states.normal || state == states.pogo || state == states.mach2 || state == states.mach3 || state == states.mach1 || state == states.shotgunjump || state == states.jump || state == states.highjump) && state != states.hurt && state != states.machslide && state != states.freefall && state != states.freefallland)
    {
        other.hooked = 1;
        hooked = 1;
        mach2 = 0;
        state = states.ladder;
        x = other.x + 16;
        y = other.y + 40;
    }
}
