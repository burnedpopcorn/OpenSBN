if (state == enemystates.stun && thrown && other.state != states.tumble && other.state != enemystates.stun)
{
    with (other)
    {
        state = enemystates.stun;
        vsp = -5;
        stunstate = 0;
        stunned = 100;
    }
}
