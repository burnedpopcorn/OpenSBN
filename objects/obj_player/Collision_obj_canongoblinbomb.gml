if (hurted == 0 && other.grounded == false && state != states.backbreaker && state != states.Parry)
{
    instance_destroy(other);
    instance_create(x, y, obj_canonexplosion);
}
