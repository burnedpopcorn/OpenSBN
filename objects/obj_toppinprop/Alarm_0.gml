if (state == states.walk)
{
    hsp = 0;
    state = UnknownEnum.Value_128;
    alarm[0] = 80 + irandom(110);
}
else if (state != states.backbreaker)
{
    image_xscale *= -1;
    hsp = 0;
    state = states.walk;
    alarm[0] = 60 + irandom(130);
}
else
{
    alarm[0] = 1;
}
