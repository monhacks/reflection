	object_const_def
	const DARKCAVE1F_POKE_BALL1
	const DARKCAVE1F_POKE_BALL2
	const DARKCAVE1F_ROCK1
	const DARKCAVE1F_ROCK2
	const DARKCAVE1F_ROCK3
	const DARKCAVE1F_ROCK4
	const DARKCAVE1F_POKE_BALL3
	const DARKCAVE1F_POKE_BALL4
	const DARKCAVE1F_POKE_BALL5
	const DARKCAVE1F_POKE_BALL6
	const DARKCAVE1F_POKE_BALL7
	const DARKCAVE1F_BOULDER1
	const DARKCAVE1F_BOULDER2
	const DARKCAVE1F_BOULDER3
	const DARKCAVE1F_BOULDER4

DarkCave1F_MapScripts:
	def_scene_scripts

	def_callbacks

DarkCave1FEscapeRope:
	itemball ESCAPE_ROPE

DarkCave1FTMRockSmash:
	itemball TM_ROCK_SMASH

DarkCave1FLureBall:
	itemball LURE_BALL

DarkCave1FTMFlash:
	itemball TM_FLASH

DarkCave1FEther:
	itemball ETHER
	
DarkCave1FHyperPotion:
	itemball HYPER_POTION

DarkCave1FTatteredHat:
	itemball TATTERED_HAT

DarkCave1FRock:
	jumpstd SmashRockScript

DarkCave1FHiddenRareCandy:
	hiddenitem EXP_CANDY_S, EVENT_DARK_CAVE_1F_HIDDEN_EXP_CANDY_S

DarkCave1FBoulder:
	jumpstd StrengthBoulderScript

DarkCave1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3, 19, ROUTE_31, 3
	warp_event 35,  5, DARK_CAVE_B1F, 1
	warp_event 33, 29, ROUTE_45, 1

	def_coord_events

	def_bg_events
	bg_event  8, 11, BGEVENT_ITEM, DarkCave1FHiddenRareCandy

	def_object_events
	object_event  2,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCave1FEscapeRope, EVENT_DARK_CAVE_1F_ESCAPE_ROPE
	object_event 19,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCave1FTMRockSmash, EVENT_DARK_CAVE_1F_TM08_ROCK_SMASH
	object_event 14, 12, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DarkCave1FRock, -1
	object_event 37, 10, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DarkCave1FRock, -1
	object_event 11, 15, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DarkCave1FRock, -1
	object_event 22, 26, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DarkCave1FRock, -1
	object_event 18, 19, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCave1FLureBall, EVENT_DARK_CAVE_1F_LURE_BALL
	object_event 34,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCave1FTMFlash, EVENT_DARK_CAVE_1F_TM52_FLASH
	object_event 23, 28, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCave1FEther, EVENT_DARK_CAVE_1F_ETHER
	object_event 28,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCave1FHyperPotion, EVENT_DARK_CAVE_1F_HYPER_POTION
	object_event 14,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCave1FTatteredHat, EVENT_DARK_CAVE_1F_TATTERED_HAT
	object_event 14,  2, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DarkCave1FBoulder, -1
	object_event 15,  3, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DarkCave1FBoulder, -1
	object_event 16,  4, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DarkCave1FBoulder, -1
	object_event 35,  6, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DarkCave1FBoulder, -1

