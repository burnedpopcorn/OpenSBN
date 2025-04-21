with (other)
{
    if (input_check_pressed("up"))
    {
        if (state == states.normal)
            state = states.ratmount;
        else if (state == states.ratmount)
            state = states.normal;
    }
}
