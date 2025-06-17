part_emitter_destroy(global.particle_system, global.part_emitter);
var i = particle.enum_start;

while (i < particle.enum_length)
{
    var k = ds_map_find_value(global.part_map, i);
    
    if (!is_undefined(k))
        part_type_destroy(k);
    
    i++;
}

part_system_destroy(global.particle_system);
ds_map_destroy(global.part_map);
ds_map_destroy(global.part_depth);
ds_list_destroy(global.debris_list);
ds_list_destroy(global.collect_list);
