enum particle 
{
	enum_start = 0, // don't use this
	
	cloudeffect = 1,
	crazyrunothereffect = 2,
	highjumpcloud1 = 3,
	highjumpcloud2 = 4,
	jumpdust = 5,
	balloonpop = 6,
	shotgunimpact = 7,
	impact = 8,
	genericpoofeffect = 9,
	keyparticles = 10,
	teleporteffect = 11,
	landcloud = 12,
	ratmountballooncloud = 13,
	groundpoundeffect = 14,
	noisegrounddash = 15,
	bubblepop = 16,
	breakdance = 17, // new
	
	enum_length = 18, // don't use this
}
enum debris
{
	normal = 0,
	fade = 1
}

if (instance_number(obj_particlesystem) > 1)
{
    instance_destroy();
    exit;
}

depth = -99;
global.particle_system = part_system_create();
global.part_map = ds_map_create();
global.part_depth = ds_map_create();
global.part_emitter = part_emitter_create(global.particle_system);
global.debris_list = ds_list_create();
global.collect_list = ds_list_create();
var p = declare_particle(particle.cloudeffect, spr_cloudeffect, 0.5, 99);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(particle.crazyrunothereffect, spr_crazyrunothereffect, 0.5, -99);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(particle.highjumpcloud1, spr_highjumpcloud1, 0.5, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(particle.highjumpcloud2, spr_highjumpcloud2, 0.5, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(particle.jumpdust, spr_jumpdust, 0.35, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(particle.balloonpop, spr_null, 0.5, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(particle.shotgunimpact, spr_shotgunimpact, 0.5, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(particle.impact, spr_impact, 0.5, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(particle.genericpoofeffect, spr_genericpoofeffect, 1, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(particle.keyparticles, spr_keyparticles, 0.35, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(particle.teleporteffect, spr_null, 0.5, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(particle.landcloud, spr_landcloud, 0.5, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(particle.ratmountballooncloud, spr_ratmountballooncloud, 0.7, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(particle.groundpoundeffect, spr_groundpoundeffect, 0.35, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(particle.bubblepop, spr_null, 0, -10);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(particle.breakdance, spr_part_breakdance, 0, 0);
part_type_speed(p, 0, 0, 0, 0);
part_type_orientation(p, 0, 359, 1, 1, true);
part_type_size(p, 0, 1, -0.05, 0);
part_type_life(p, 1, 600);
