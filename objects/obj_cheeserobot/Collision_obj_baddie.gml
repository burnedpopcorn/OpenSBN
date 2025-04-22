with (other)
{
    if ((other.state == enemystates.stun && other.thrown == true) || (other.state == enemystates.grabbed && obj_player1.state == states.superslam))
        instance_destroy();
}
