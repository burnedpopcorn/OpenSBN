function __background_set(argument0, argument1, argument2)
{
    var __backinfo = __background_get_element(argument1);
    __background_set_internal(argument0, argument1, argument2, __backinfo);
    var __res = __background_get_internal(argument0, argument1, __backinfo);
    return __res;
}
