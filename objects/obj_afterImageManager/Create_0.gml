enum afterimage
{
	afterimage,
	mach3effect,
	heatattack,
	firemouth,
	blue,
	blur,
	
	enum_length // used to check how many afterimage types there are
}

depth = 1;
global.AfterImageList = ds_list_create();
global.BlinkTrail = false;
blinkingBufferMax = 3;
blinkingBuffer = blinkingBufferMax;
