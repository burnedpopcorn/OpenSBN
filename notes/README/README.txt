A Decompilation of Super Bo Noise
	by burnedpopcorn180

Original GameMaker Version: 2023.11.0.0

NOTE:
The Creators of SBN were pretty lazy, and didn't clean up
a lot of old leftover code

This means that many old pizza tower objects and scripts still
exist, and still reference assets like rooms and sprites that
no longer exist and have been removed

There are also some player states that have also have had their code removed, but can still be called
(dont recommend it, since they will crash the game,
since the state function code has been deleted, but the function is still being referenced)

I dont plan on ever making a cleaned up version, since I try and keep things 
faithful to their original counterparts, even if it was slopply made

--------------------------------------------------------

Packages to add:
	- FMOD						(DONE)
	- GameFrame					(DONE)
	- NekoPresence				(DONE)
	- Scribble Deluxe 9.0.0		(DONE)
	- Mr Unown Collisions
	
TODO
	Fix FMOD DLL
	Fix Rail Collisions (Check Virdesert decomp)

--------------------------------------------------------
Project Decompilied by Ultimate_GMS2_Decompiler_v2.csx
	Improved by burnedpopcorn180
		Original Version by crystallizedsparkle
