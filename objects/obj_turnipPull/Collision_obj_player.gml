if (other.state == states.handstandjump)
{
    if (other.move == 0)
    {
        other.hsp = 0;
        other.state = states.normal;
        
        if (!is_undefined(onPick))
            self.onPick();
        
        instance_destroy();
    }
}
