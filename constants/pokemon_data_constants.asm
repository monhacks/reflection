; base data struct members (see data/pokemon/base_stats/*.asm)
rsreset
BASE_DEX_NO      rb
BASE_STATS       rb NUM_STATS
rsset BASE_STATS
BASE_HP          rb
BASE_ATK         rb
BASE_DEF         rb
BASE_SPD         rb
BASE_SAT         rb
BASE_SDF         rb
BASE_TYPES       rw
rsset BASE_TYPES
BASE_TYPE_1      rb
BASE_TYPE_2      rb
BASE_CATCH_RATE  rb
BASE_EXP         rb
BASE_ITEMS       rw
rsset BASE_ITEMS
BASE_ITEM_1      rb
BASE_ITEM_2      rb
BASE_GENDER      rb
BASE_EGG_STEPS   rb
BASE_PIC_SIZE    rb
BASE_GROWTH_RATE rb
BASE_EGG_GROUPS  rb
BASE_TMHM        rb (NUM_TMS + NUM_HMS + 7) / 8
BASE_DATA_SIZE EQU _RS

; gender ratio constants
GENDER_F0      EQU   0 percent
GENDER_F12_5   EQU  12 percent + 1
GENDER_F25     EQU  25 percent
GENDER_F50     EQU  50 percent
GENDER_F75     EQU  75 percent
GENDER_F100    EQU 100 percent - 1
GENDER_UNKNOWN EQU -1

; wBaseGrowthRate values
; GrowthRates indexes (see data/growth_rates.asm)
	const_def
	const GROWTH_MEDIUM_FAST
	const GROWTH_SLIGHTLY_FAST
	const GROWTH_SLIGHTLY_SLOW
	const GROWTH_MEDIUM_SLOW
	const GROWTH_FAST
	const GROWTH_SLOW
NUM_GROWTH_RATES EQU const_value

; wBaseEggGroups values
	const_def 1
	const EGG_MONSTER       ; 1
	const EGG_WATER_1       ; 2 (Amphibian)
	const EGG_BUG           ; 3
	const EGG_FLYING        ; 4
	const EGG_GROUND        ; 5 (Field)
	const EGG_FAIRY         ; 6
	const EGG_PLANT         ; 7 (Grass)
	const EGG_HUMANSHAPE    ; 8 (Human-Like)
	const EGG_WATER_3       ; 9 (Invertebrate)
	const EGG_MINERAL       ; a
	const EGG_INDETERMINATE ; b (Amorphous)
	const EGG_WATER_2       ; c (Fish)
	const EGG_DITTO         ; d
	const EGG_DRAGON        ; e
	const EGG_NONE          ; f (Undiscovered)

; pokedex entries (see data/pokemon/dex_entries.asm)
NUM_DEX_ENTRY_BANKS EQU 4

; party_struct members (see macros/wram.asm)
rsreset
MON_SPECIES            rb ; _rs = 0
MON_ITEM               rb ; 1
MON_MOVES              rb NUM_MOVES ; 2
MON_ID                 rw ; 6
MON_EXP                rb 3 ; 8
MON_STAT_EXP           rw NUM_EXP_STATS ; 11
rsset MON_STAT_EXP
MON_HP_EXP             rw ; 11
MON_ATK_EXP            rw ; 13
MON_DEF_EXP            rw ; 15
MON_SPD_EXP            rw ; 17
MON_SPC_EXP            rw ; 19
MON_DVS                rw ; 21
MON_PP                 rb NUM_MOVES ; 23
MON_HAPPINESS          rb ; 27
MON_POKERUS            rb ; 28
MON_CAUGHTDATA         rw ; 29
rsset MON_CAUGHTDATA
MON_CAUGHTTIME         rb ; 29
MON_CAUGHTGENDER       rb ; 30
rsset MON_CAUGHTDATA
MON_CAUGHTLEVEL        rb ; 29
MON_CAUGHTLOCATION     rb ; 30
MON_LEVEL              rb ; 31
MON_DV_TRAINING_COUNT  rb ; 32
BOXMON_STRUCT_LENGTH EQU _RS
MON_STATUS             rb ; 33
                       rb_skip
MON_HP                 rw ; 35
MON_MAXHP              rw ; 37
MON_STATS              rw NUM_BATTLE_STATS ; 39
rsset MON_STATS
MON_ATK                rw ; 39
MON_DEF                rw ; 41
MON_SPD                rw ; 43
MON_SAT                rw ; 45
MON_SDF                rw ; 47
PARTYMON_STRUCT_LENGTH EQU _RS ; 49

NICKNAMED_MON_STRUCT_LENGTH EQU PARTYMON_STRUCT_LENGTH + MON_NAME_LENGTH
REDMON_STRUCT_LENGTH EQU 44

; caught data

CAUGHT_TIME_MASK  EQU %11000000
CAUGHT_LEVEL_MASK EQU %00111111

CAUGHT_GENDER_MASK   EQU %10000000
CAUGHT_LOCATION_MASK EQU %01111111

CAUGHT_BY_UNKNOWN EQU 0
CAUGHT_BY_GIRL    EQU 1
CAUGHT_BY_BOY     EQU 2

CAUGHT_EGG_LEVEL EQU 1

MON_CRY_LENGTH EQU 6

; maximum number of party pokemon
PARTY_LENGTH EQU 6

; boxes
MONS_PER_BOX EQU 20
; box: count, species, mons, OTs, nicknames, padding
BOX_LENGTH EQU 1 + MONS_PER_BOX + 1 + (BOXMON_STRUCT_LENGTH + NAME_LENGTH + MON_NAME_LENGTH) * MONS_PER_BOX + 2 ; $450
NUM_BOXES EQU 14

; hall of fame
; hof_mon: species, id, dvs, level, nicknames
HOF_MON_LENGTH EQU 1 + 2 + 2 + 1 + (MON_NAME_LENGTH - 1) ; $10
; hall_of_fame: win count, party, terminator
HOF_LENGTH EQU 1 + HOF_MON_LENGTH * PARTY_LENGTH + 1 ; $62
NUM_HOF_TEAMS EQU 30

; evolution types (used in data/pokemon/evos_attacks.asm)
	const_def 1
	const EVOLVE_LEVEL
	const EVOLVE_ITEM
	const EVOLVE_TRADE
	const EVOLVE_HAPPINESS
	const EVOLVE_STAT

; EVOLVE_HAPPINESS triggers
	const_def 1
	const TR_ANYTIME
	const TR_MORNDAY
	const TR_NITE

; EVOLVE_STAT triggers
	const_def 1
	const ATK_GT_DEF
	const ATK_LT_DEF
	const ATK_EQ_DEF

; wild data

NUM_GRASSMON EQU 7 ; data/wild/*_grass.asm table size
NUM_WATERMON EQU 3 ; data/wild/*_water.asm table size

GRASS_WILDDATA_LENGTH EQU 2 + (1 + NUM_GRASSMON * 2)
WATER_WILDDATA_LENGTH EQU 2 + (1 + NUM_WATERMON * 2)
FISHGROUP_DATA_LENGTH EQU 1 + 2 * 3

NUM_ROAMMON_MAPS EQU 16 ; RoamMaps table size (see data/wild/roammon_maps.asm)

; treemon sets
; TreeMons indexes (see data/wild/treemons.asm)
	const_def
	const TREEMON_SET_JOHTO_LOW
	const TREEMON_SET_JOHTO_MED
	const TREEMON_SET_JOHTO_HIGH
	const TREEMON_SET_TOWN_LOW
	const TREEMON_SET_TOWN_MED
	const TREEMON_SET_TOWN_HIGH
	const TREEMON_SET_CITY_LOW
	const TREEMON_SET_CITY_HIGH
	const TREEMON_SET_FOREST_LOW
	const TREEMON_SET_FOREST_HIGH
	const TREEMON_SET_MOUNTAIN_LOW
	const TREEMON_SET_MOUNTAIN_MED
	const TREEMON_SET_MOUNTAIN_HIGH
	const TREEMON_SET_LAKE_LOW
	const TREEMON_SET_LAKE_MED
	const TREEMON_SET_LAKE_HIGH
	const TREEMON_SET_BEACH
	const TREEMON_SET_KANTO_HIGH
	const TREEMON_SET_KANTO_VERYHIGH
	const TREEMON_SET_ROCK_CAVE_LOW
	const TREEMON_SET_ROCK_CAVE_HIGH
	const TREEMON_SET_ROCK_BEACH_LOW
	const TREEMON_SET_ROCK_BEACH_HIGH
	const TREEMON_SET_ROCK_MOUNTAIN_LOW
	const TREEMON_SET_ROCK_MOUNTAIN_HIGH
NUM_TREEMON_SETS EQU const_value

; treemon scores
	const_def
	const TREEMON_SCORE_BAD  ; 0
	const TREEMON_SCORE_GOOD ; 1
	const TREEMON_SCORE_RARE ; 2

; ChangeHappiness arguments (see data/events/happiness_changes.asm)
	const_def 1
	const HAPPINESS_GAINLEVEL         ; 01
	const HAPPINESS_USEDITEM          ; 02
	const HAPPINESS_USEDXITEM         ; 03
	const HAPPINESS_GYMBATTLE         ; 04
	const HAPPINESS_LEARNMOVE         ; 05
	const HAPPINESS_FAINTED           ; 06
	const HAPPINESS_POISONFAINT       ; 07
	const HAPPINESS_BEATENBYSTRONGFOE ; 08
	const HAPPINESS_OLDERCUT1         ; 09
	const HAPPINESS_OLDERCUT2         ; 0a
	const HAPPINESS_OLDERCUT3         ; 0b
	const HAPPINESS_YOUNGCUT1         ; 0c
	const HAPPINESS_YOUNGCUT2         ; 0d
	const HAPPINESS_YOUNGCUT3         ; 0e
	const HAPPINESS_BITTERPOWDER      ; 0f
	const HAPPINESS_ENERGYROOT        ; 10
	const HAPPINESS_REVIVALHERB       ; 11
	const HAPPINESS_GROOMING          ; 12
	const HAPPINESS_GAINLEVELATHOME   ; 13
	const HAPPINESS_EXPCANDYS		  ; 14
	const HAPPINESS_EXPCANDYM		  ; 15
	const HAPPINESS_EXPCANDYL		  ; 16
	const HAPPINESS_HONEYDROP		  ; 17
	
NUM_HAPPINESS_CHANGES EQU const_value - 1

; significant happiness values
BASE_HAPPINESS        EQU 70
FRIEND_BALL_HAPPINESS EQU 200
HAPPINESS_TO_EVOLVE   EQU 220
HAPPINESS_THRESHOLD_1 EQU 100
HAPPINESS_THRESHOLD_2 EQU 200

; PP
PP_UP_MASK EQU %11000000
PP_UP_ONE  EQU %01000000
PP_MASK    EQU %00111111
