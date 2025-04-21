with (other.id)
{
    if (state != states.firemove && hurted == 0)
    {
        state = states.firemove;
        movespeed = 0;
        image_index = 0;
    }
}
