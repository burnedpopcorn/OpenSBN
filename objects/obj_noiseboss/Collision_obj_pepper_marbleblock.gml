if (state == enemystates.walk && other.grounded && other.vsp > 0 && elitehit <= 1)
    instance_destroy();
else
    x--;
