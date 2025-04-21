function wrap(argument0, argument1, argument2)
{
    var value = argument0;
    var _min = min(argument1, argument2);
    var _max = max(argument1, argument2);
    var range = (_max - _min) + 1;
    return ((((value - _min) % range) + range) % range) + _min;
}
