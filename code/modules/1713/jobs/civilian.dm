////////////////////////////////////////////CIVILIAN///////////////////////////////////////////////////////
/datum/job/civilian
	faction = "Station"

/datum/job/civilian/give_random_name(var/mob/living/carbon/human/H)
	if (is_civilizations || is_nomad)
		H.name = H.species.get_random_name(H.gender)
		H.real_name = H.name
	else
		H.give_random_civ_name()

/mob/living/carbon/human/proc/give_random_civ_name()
	name = species.get_random_english_name(gender)
	if (client && client.prefs)
		switch (client.prefs.civ_ethnicity)
			if (SPANISH)
				name = species.get_random_spanish_name(gender)
			if (PORTUGUESE)
				name = species.get_random_portuguese_name(gender)
			if (FRENCH)
				name = species.get_random_french_name(gender)
			if (DUTCH)
				name = species.get_random_dutch_name(gender)
			if (ENGLISH)
				name = species.get_random_english_name(gender)
	else
		name = species.get_random_english_name(gender)
	real_name = name

/mob/living/carbon/human/proc/give_clothes()
	if (!map.chad_mode)
		if (map.civilizations)
			equip_to_slot_or_del(new /obj/item/weapon/material/kitchen/utensil/knife/bone(src), slot_belt)
		if (map.ordinal_age == 0)
			var/randcloth = rand(1,3)
			if (randcloth == 1)
				equip_to_slot_or_del(new /obj/item/clothing/under/indian1(src), slot_w_uniform)
			else if (randcloth == 2)
				equip_to_slot_or_del(new /obj/item/clothing/under/indian2(src), slot_w_uniform)
			else if (randcloth == 3)
				equip_to_slot_or_del(new /obj/item/clothing/under/indian3(src), slot_w_uniform)

		else if (map.ordinal_age == 1)
			var/randcloth = rand(1,2)
			if (randcloth == 1)
				equip_to_slot_or_del(new /obj/item/clothing/under/toga(src), slot_w_uniform)
			else if (randcloth == 2)
				equip_to_slot_or_del(new /obj/item/clothing/under/toga2(src), slot_w_uniform)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/roman(src), slot_shoes)

		else if (map.ordinal_age == 2)
			var/randcloth = rand(1,2)
			if (randcloth == 1)
				equip_to_slot_or_del(new /obj/item/clothing/under/medieval/yellow(src), slot_w_uniform)
			else if (randcloth == 2)
				equip_to_slot_or_del(new /obj/item/clothing/under/medieval/leather(src), slot_w_uniform)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/medieval(src), slot_shoes)
		else
			if (prob(30))
				equip_to_slot_or_del(new /obj/item/clothing/shoes/blackboots1(src), slot_shoes)
			else
				equip_to_slot_or_del(new /obj/item/clothing/shoes/leatherboots1(src), slot_shoes)
			if (gender == "male")
				var/randcloth = rand(1,5)
				if (randcloth == 1)
					equip_to_slot_or_del(new /obj/item/clothing/under/civ1(src), slot_w_uniform)
				else if (randcloth == 2)
					equip_to_slot_or_del(new /obj/item/clothing/under/civ2(src), slot_w_uniform)
				else if (randcloth == 3)
					equip_to_slot_or_del(new /obj/item/clothing/under/civ3(src), slot_w_uniform)
				else if (randcloth == 4)
					equip_to_slot_or_del(new /obj/item/clothing/under/civ5(src), slot_w_uniform)
				else if (randcloth == 5)
					equip_to_slot_or_del(new /obj/item/clothing/under/civ6(src), slot_w_uniform)
			else
				var/randcloth = rand(1,3)
				if (randcloth == 1)
					equip_to_slot_or_del(new /obj/item/clothing/under/civf1(src), slot_w_uniform)
				else if (randcloth == 2)
					equip_to_slot_or_del(new /obj/item/clothing/under/civf2(src), slot_w_uniform)
				else if (randcloth == 3)
					equip_to_slot_or_del(new /obj/item/clothing/under/civf3(src), slot_w_uniform)
				equip_to_slot_or_del(new /obj/item/clothing/head/kerchief(src), slot_head)
		if (season == "WINTER" || map.ID == MAP_NOMADS_ICE_AGE)
			equip_to_slot_or_del(new /obj/item/clothing/suit/storage/coat/fur(src), slot_wear_suit)
			if (map.ordinal_age == 0)
				equip_to_slot_or_del(new /obj/item/clothing/shoes/fur(src), slot_shoes)
/datum/job/civilian/governor
	title = "Governor"
	en_meaning = "Colony Leader"
	rank_abbreviation = "Governor"
	head_position = TRUE
	selection_color = "#2d2d63"
	spawn_location = "JoinLateCiv"
	is_officer = TRUE
	is_commander = TRUE
	whitelisted = TRUE
	SL_check_independent = TRUE
	is_governor = TRUE

	// AUTOBALANCE
	min_positions = 1
	max_positions = 1

/datum/job/civilian/governor/equip(var/mob/living/carbon/human/H)
	if (!H)	return FALSE
//shoes
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/leatherboots1(H), slot_shoes)
//clothes
	H.equip_to_slot_or_del(new /obj/item/clothing/under/civ4(H), slot_w_uniform)
//jacket
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/piratejacket5(H), slot_wear_suit)
//head
	H.equip_to_slot_or_del(new /obj/item/clothing/head/powdered_wig(H), slot_head)

	H.equip_to_slot_or_del(new /obj/item/weapon/key/civ/gov(H), slot_r_store)
	H.equip_to_slot_or_del(new /obj/item/weapon/key/civ/hall(H), slot_l_store)
	H.equip_to_slot_or_del(new /obj/item/weapon/material/sword/spadroon(H), slot_belt)
//	H.equip_to_slot_or_del(new/obj/item/stack/money/real(H), slot_l_store)
	H.add_note("Role", "You are a <b>[title]</b>, the leader of this colony. Organize your men and build a village!")
	H.setStat("strength", STAT_MEDIUM_HIGH)
	H.setStat("crafting", STAT_NORMAL)
	H.setStat("rifle", STAT_NORMAL)
	H.setStat("dexterity", STAT_NORMAL)
	H.setStat("swords", STAT_HIGH)
	H.setStat("pistol", STAT_MEDIUM_HIGH)
	H.setStat("bows", STAT_NORMAL)
	H.setStat("medical", STAT_MEDIUM_LOW)


	return TRUE

/datum/job/civilian/architect
	title = "Architect"
	en_meaning = "Colony Chief Carpenter/Planner"
	rank_abbreviation = "Architect"
	selection_color = "#2d2d63"
	spawn_location = "JoinLateCiv"
	SL_check_independent = TRUE
	is_commander = TRUE
	whitelisted = TRUE
	is_officer = TRUE

	// AUTOBALANCE
	min_positions = 1
	max_positions = 1

/datum/job/civilian/architect/equip(var/mob/living/carbon/human/H)
	if (!H)	return FALSE

//shoes
	if (prob(30))
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/blackboots1(H), slot_shoes)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/leatherboots1(H), slot_shoes)
	if (H.gender == "male")
		var/randcloth = rand(1,5)
		if (randcloth == 1)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ1(H), slot_w_uniform)
		else if (randcloth == 2)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ2(H), slot_w_uniform)
		else if (randcloth == 3)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ3(H), slot_w_uniform)
		else if (randcloth == 4)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ5(H), slot_w_uniform)
		else if (randcloth == 5)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ6(H), slot_w_uniform)
	else
		var/randcloth = rand(1,3)
		if (randcloth == 1)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civf1(H), slot_w_uniform)
		else if (randcloth == 2)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civf2(H), slot_w_uniform)
		else if (randcloth == 3)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civf3(H), slot_w_uniform)

	//head
	H.equip_to_slot_or_del(new /obj/item/clothing/head/powdered_wig(H), slot_head)

	H.equip_to_slot_or_del(new /obj/item/weapon/key/civ/hall(H), slot_l_hand)
	H.equip_to_slot_or_del(new/obj/item/weapon/storage/belt/leather(H), slot_belt)
	H.equip_to_slot_or_del(new /obj/item/weapon/attachment/scope/adjustable/binoculars(H), slot_r_store)
	H.equip_to_slot_or_del(new/obj/item/stack/money/real(H), slot_l_store)

	H.add_note("Role", "You are an <b>Architect</b>. Your job is to organize and lead the <b>Carpenters</b>, and develop the colony with your city planning skills!")
	H.setStat("strength", STAT_MEDIUM_HIGH)
	H.setStat("crafting", STAT_VERY_HIGH)
	H.setStat("rifle", STAT_MEDIUM_LOW)
	H.setStat("dexterity", STAT_NORMAL)
	H.setStat("swords", STAT_MEDIUM_LOW)
	H.setStat("pistol", STAT_MEDIUM_LOW)
	H.setStat("bows", STAT_MEDIUM_LOW)
	H.setStat("medical", STAT_MEDIUM_LOW)


	return TRUE

/datum/job/civilian/officer
	title = "Town Guard Officer"
	en_meaning = "Colony Security Leader"
	rank_abbreviation = "Officer"
	selection_color = "#2d2d63"
	spawn_location = "JoinLateCiv"
	SL_check_independent = TRUE
	is_officer = TRUE
	is_commander = TRUE
	whitelisted = TRUE

	// AUTOBALANCE
	min_positions = 1
	max_positions = 5

/datum/job/civilian/officer/equip(var/mob/living/carbon/human/H)
	if (!H)	return FALSE

//shoes
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/blackboots1(H), slot_shoes)
//clothes
	H.equip_to_slot_or_del(new /obj/item/clothing/under/civ2(H), slot_w_uniform)
//jacket
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/british_soldier(H), slot_wear_suit)

//head
	H.equip_to_slot_or_del(new /obj/item/clothing/head/bicorne_british_soldier(H), slot_head)

	H.equip_to_slot_or_del(new /obj/item/weapon/material/sword/spadroon(H), slot_belt)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/flintlock/musketoon(H), slot_back)

	H.equip_to_slot_or_del(new/obj/item/stack/money/real(H), slot_l_store)
	H.equip_to_slot_or_del(new /obj/item/weapon/key/civ/hall(H), slot_r_store)
	var/obj/item/clothing/accessory/storage/webbing/filled_a = new /obj/item/clothing/accessory/storage/webbing(null)
	filled_a.attackby(new/obj/item/ammo_casing/musketball, H)
	filled_a.attackby(new/obj/item/ammo_casing/musketball, H)
	filled_a.attackby(new/obj/item/ammo_casing/musketball, H)
	filled_a.attackby(new/obj/item/ammo_casing/musketball, H)
	var/obj/item/clothing/under/uniform = H.w_uniform
	uniform.attackby(filled_a, H)
	H.add_note("Role", "You are a <b>[title]</b>, a veteran of past wars. Your job is to organize the <b>Veterans</b> and keep the colonists safe, reporting to the <b>Governor</b>.")
	H.setStat("strength", STAT_MEDIUM_HIGH)
	H.setStat("crafting", STAT_NORMAL)
	H.setStat("rifle", STAT_MEDIUM_HIGH)
	H.setStat("dexterity", STAT_NORMAL)
	H.setStat("swords", STAT_MEDIUM_HIGH)
	H.setStat("pistol", STAT_MEDIUM_HIGH)
	H.setStat("bows", STAT_NORMAL)
	H.setStat("medical", STAT_NORMAL)


	return TRUE


/datum/job/civilian/veteran
	title = "Town Guard"
	en_meaning = "Colony Security"
	rank_abbreviation = ""
	selection_color = "#2d2d63"
	spawn_location = "JoinLateCiv"
	SL_check_independent = TRUE

	// AUTOBALANCE
	min_positions = 1
	max_positions = 30

/datum/job/civilian/veteran/equip(var/mob/living/carbon/human/H)
	if (!H)	return FALSE

//shoes
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/blackboots1(H), slot_shoes)
//clothes
	H.equip_to_slot_or_del(new /obj/item/clothing/under/civ2(H), slot_w_uniform)
//jacket
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/british_soldier(H), slot_wear_suit)

//head
	H.equip_to_slot_or_del(new /obj/item/clothing/head/bicorne_british_soldier(H), slot_head)

	H.equip_to_slot_or_del(new /obj/item/weapon/material/sword/spadroon(H), slot_belt)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/flintlock/musketoon(H), slot_back)
	H.equip_to_slot_or_del(new/obj/item/stack/money/real(H), slot_l_store)
	H.equip_to_slot_or_del(new /obj/item/weapon/key/civ/hall(H), slot_r_store)
	var/obj/item/clothing/accessory/storage/webbing/filled_a = new /obj/item/clothing/accessory/storage/webbing(null)
	filled_a.attackby(new/obj/item/ammo_casing/musketball, H)
	filled_a.attackby(new/obj/item/ammo_casing/musketball, H)
	filled_a.attackby(new/obj/item/ammo_casing/musketball, H)
	filled_a.attackby(new/obj/item/ammo_casing/musketball, H)
	var/obj/item/clothing/under/uniform = H.w_uniform
	uniform.attackby(filled_a, H)

	H.add_note("Role", "You are a <b>[title]</b>, a veteran of past wars. Your job is to organize the colony defense and hunting parties, according to the orders of the <b>Town Guard Officer</b>.")
	H.setStat("strength", STAT_MEDIUM_HIGH)
	H.setStat("crafting", STAT_MEDIUM_LOW)
	H.setStat("rifle", STAT_MEDIUM_HIGH)
	H.setStat("dexterity", STAT_NORMAL)
	H.setStat("swords", STAT_MEDIUM_HIGH)
	H.setStat("pistol", STAT_MEDIUM_HIGH)
	H.setStat("bows", STAT_NORMAL)
	H.setStat("medical", STAT_NORMAL)


	return TRUE



/datum/job/civilian/medic
	title = "Doctor"
	en_meaning = "Colony Medic"
	rank_abbreviation = "Doctor"
	selection_color = "#2d2d63"
	spawn_location = "JoinLateCiv"
	SL_check_independent = TRUE

	// AUTOBALANCE
	min_positions = 1
	max_positions = 20

/datum/job/civilian/medic/equip(var/mob/living/carbon/human/H)
	if (!H)	return FALSE

//shoes
	if (prob(30))
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/blackboots1(H), slot_shoes)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/leatherboots1(H), slot_shoes)
	if (H.gender == "male")
		var/randcloth = rand(1,5)
		if (randcloth == 1)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ1(H), slot_w_uniform)
		else if (randcloth == 2)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ2(H), slot_w_uniform)
		else if (randcloth == 3)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ3(H), slot_w_uniform)
		else if (randcloth == 4)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ5(H), slot_w_uniform)
		else if (randcloth == 5)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ6(H), slot_w_uniform)
	else
		var/randcloth = rand(1,3)
		if (randcloth == 1)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civf1(H), slot_w_uniform)
		else if (randcloth == 2)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civf2(H), slot_w_uniform)
		else if (randcloth == 3)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civf3(H), slot_w_uniform)

//head
	H.equip_to_slot_or_del(new /obj/item/clothing/head/powdered_wig(H), slot_head)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/firstaid/surgery(H), slot_l_hand)
	H.equip_to_slot_or_del(new /obj/item/weapon/doctor_handbook(H), slot_l_store)
	H.equip_to_slot_or_del(new/obj/item/stack/money/real(H), slot_r_store)

	H.add_note("Role", "You are a <b>[title]</b>, in charge of keeping the newly founded colony healthy.")
	H.setStat("strength", STAT_NORMAL)
	H.setStat("crafting", STAT_NORMAL)
	H.setStat("rifle", STAT_MEDIUM_LOW)
	H.setStat("dexterity", STAT_NORMAL)
	H.setStat("swords", STAT_MEDIUM_LOW)
	H.setStat("pistol", STAT_MEDIUM_LOW)
	H.setStat("bows", STAT_MEDIUM_LOW)
	H.setStat("medical", STAT_VERY_HIGH)


	return TRUE
/datum/job/civilian/merchant
	title = "Merchant"
	en_meaning = "Colony Trader"
	rank_abbreviation = "Merchant"
	selection_color = "#2d2d63"
	spawn_location = "JoinLateCiv"
	is_merchant = TRUE
	SL_check_independent = TRUE

	// AUTOBALANCE
	min_positions = 1
	max_positions = 20

/datum/job/civilian/merchant/equip(var/mob/living/carbon/human/H)
	if (!H)	return FALSE

//shoes
	if (prob(30))
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/blackboots1(H), slot_shoes)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/leatherboots1(H), slot_shoes)
	if (H.gender == "male")
		var/randcloth = rand(1,5)
		if (randcloth == 1)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ1(H), slot_w_uniform)
		else if (randcloth == 2)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ2(H), slot_w_uniform)
		else if (randcloth == 3)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ3(H), slot_w_uniform)
		else if (randcloth == 4)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ5(H), slot_w_uniform)
		else if (randcloth == 5)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ6(H), slot_w_uniform)
	else
		var/randcloth = rand(1,3)
		if (randcloth == 1)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civf1(H), slot_w_uniform)
		else if (randcloth == 2)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civf2(H), slot_w_uniform)
		else if (randcloth == 3)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civf3(H), slot_w_uniform)

//head
	H.equip_to_slot_or_del(new /obj/item/clothing/head/powdered_wig(H), slot_head)
	H.equip_to_slot_or_del(new/obj/item/stack/money/real(H), slot_l_store)
	H.equip_to_slot_or_del(new/obj/item/stack/money/real(H), slot_l_store)

	H.add_note("Role", "You are a <b>[title]</b>, a trader who decided to move in to the new colony to get rich. Establish your trading post and deal with both the Natives and the Colonists!")
	H.setStat("strength", STAT_NORMAL)
	H.setStat("crafting", STAT_MEDIUM_HIGH)
	H.setStat("rifle", STAT_MEDIUM_LOW)
	H.setStat("dexterity", STAT_MEDIUM_HIGH)
	H.setStat("swords", STAT_MEDIUM_LOW)
	H.setStat("pistol", STAT_MEDIUM_LOW)
	H.setStat("bows", STAT_MEDIUM_LOW)
	H.setStat("medical", STAT_NORMAL)

	return TRUE
/datum/job/civilian/priest
	title = "Priest"
	en_meaning = "Colony Priest"
	rank_abbreviation = ""
	selection_color = "#2d2d63"
	spawn_location = "JoinLateCiv"
	SL_check_independent = TRUE
	is_religious = TRUE
	// AUTOBALANCE
	min_positions = 1
	max_positions = 20

/datum/job/civilian/priest/equip(var/mob/living/carbon/human/H)
	if (!H)	return FALSE
//shoes
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/blackboots1(H), slot_shoes)

	if (H.gender == "male")
		H.equip_to_slot_or_del(new /obj/item/clothing/under/chaplain(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/head/chaplain_hood(H), slot_head)
		H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/chaplain(H), slot_wear_suit)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/under/nun(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/head/nun_hood(H), slot_head)

	H.equip_to_slot_or_del(new/obj/item/stack/money/real(H), slot_l_store)
	H.equip_to_slot_or_del(new/obj/item/stack/money/real(H), slot_l_store)

	H.add_note("Role", "You are a <b>[title]</b>, in charge of the colony's religious affairs, assisting the doctor, and if possible, of converting the natives...")
	H.setStat("strength", STAT_MEDIUM_LOW)
	H.setStat("crafting", STAT_NORMAL)
	H.setStat("rifle", STAT_MEDIUM_LOW)
	H.setStat("dexterity", STAT_NORMAL)
	H.setStat("swords", STAT_MEDIUM_LOW)
	H.setStat("pistol", STAT_MEDIUM_LOW)
	H.setStat("bows", STAT_MEDIUM_LOW)
	H.setStat("medical", STAT_HIGH)

	return TRUE

/datum/job/civilian/prospector
	title = "Prospector"
	en_meaning = "Colony Miner/Explorer"
	rank_abbreviation = ""
	selection_color = "#2d2d63"
	spawn_location = "JoinLateCiv"
	SL_check_independent = TRUE

	// AUTOBALANCE
	min_positions = 3
	max_positions = 40

/datum/job/civilian/prospector/equip(var/mob/living/carbon/human/H)
	if (!H)	return FALSE

//shoes
	if (prob(30))
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/blackboots1(H), slot_shoes)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/leatherboots1(H), slot_shoes)
	if (H.gender == "male")
		var/randcloth = rand(1,5)
		if (randcloth == 1)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ1(H), slot_w_uniform)
		else if (randcloth == 2)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ2(H), slot_w_uniform)
		else if (randcloth == 3)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ3(H), slot_w_uniform)
		else if (randcloth == 4)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ5(H), slot_w_uniform)
		else if (randcloth == 5)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ6(H), slot_w_uniform)
	else
		var/randcloth = rand(1,3)
		if (randcloth == 1)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civf1(H), slot_w_uniform)
		else if (randcloth == 2)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civf2(H), slot_w_uniform)
		else if (randcloth == 3)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civf3(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/head/kerchief(H), slot_head)

	H.equip_to_slot_or_del(new/obj/item/weapon/pickaxe(H), slot_belt)
	H.equip_to_slot_or_del(new/obj/item/weapon/shovel(H), slot_back)
	H.equip_to_slot_or_del(new/obj/item/stack/money/real(H), slot_l_store)
	H.add_note("Role", "You are a <b>[title]</b>, a former miner who decided to move into the New World to find riches. Explore the area, mine, and sell to the <b>Merchant</b> what you find!")
	H.setStat("strength", STAT_HIGH)
	H.setStat("crafting", STAT_MEDIUM_HIGH)
	H.setStat("rifle", STAT_NORMAL)
	H.setStat("dexterity", STAT_MEDIUM_HIGH)
	H.setStat("swords", STAT_MEDIUM_LOW)
	H.setStat("pistol", STAT_MEDIUM_LOW)
	H.setStat("bows", STAT_MEDIUM_LOW)
	H.setStat("medical", STAT_MEDIUM_LOW)

	return TRUE

/datum/job/civilian/farmer
	title = "Farmer"
	en_meaning = "Colony Farmer/Rancher"
	rank_abbreviation = ""
	selection_color = "#2d2d63"
	spawn_location = "JoinLateCiv"
	SL_check_independent = TRUE

	// AUTOBALANCE
	min_positions = 3
	max_positions = 50

/datum/job/civilian/farmer/equip(var/mob/living/carbon/human/H)
	if (!H)	return FALSE

//shoes
	if (prob(30))
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/blackboots1(H), slot_shoes)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/leatherboots1(H), slot_shoes)
	if (H.gender == "male")
		var/randcloth = rand(1,5)
		if (randcloth == 1)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ1(H), slot_w_uniform)
		else if (randcloth == 2)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ2(H), slot_w_uniform)
		else if (randcloth == 3)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ3(H), slot_w_uniform)
		else if (randcloth == 4)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ5(H), slot_w_uniform)
		else if (randcloth == 5)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ6(H), slot_w_uniform)
	else
		var/randcloth = rand(1,3)
		if (randcloth == 1)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civf1(H), slot_w_uniform)
		else if (randcloth == 2)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civf2(H), slot_w_uniform)
		else if (randcloth == 3)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civf3(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/head/kerchief(H), slot_head)

	H.equip_to_slot_or_del(new/obj/item/weapon/storage/belt/leather/farmer(H), slot_belt)
	H.equip_to_slot_or_del(new/obj/item/weapon/plough(H), slot_l_hand)
	H.equip_to_slot_or_del(new/obj/item/weapon/material/kitchen/utensil/knife(H), slot_r_store)
	H.equip_to_slot_or_del(new/obj/item/stack/money/real(H), slot_l_store)

	H.add_note("Role", "You are a <b>[title]</b>, specialized in plant growth, animal husbandry, and cooking. Keep the colony fed!")
	H.setStat("strength", STAT_MEDIUM_HIGH)
	H.setStat("crafting", STAT_MEDIUM_HIGH)
	H.setStat("rifle", STAT_MEDIUM_LOW)
	H.setStat("dexterity", STAT_MEDIUM_HIGH)
	H.setStat("swords", STAT_NORMAL)
	H.setStat("pistol", STAT_MEDIUM_LOW)
	H.setStat("bows", STAT_MEDIUM_LOW)
	H.setStat("medical", STAT_NORMAL)

	return TRUE
/datum/job/civilian/carpenter
	title = "Carpenter"
	en_meaning = "Colony Carpenter/Craftsman"
	rank_abbreviation = "Carpenter"
	selection_color = "#2d2d63"
	spawn_location = "JoinLateCiv"
	SL_check_independent = TRUE

	// AUTOBALANCE
	min_positions = 3
	max_positions = 50

/datum/job/civilian/carpenter/equip(var/mob/living/carbon/human/H)
	if (!H)	return FALSE

//shoes
	if (prob(30))
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/blackboots1(H), slot_shoes)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/leatherboots1(H), slot_shoes)
//clothes
	if (H.gender == "male")
		var/randcloth = rand(1,5)
		if (randcloth == 1)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ1(H), slot_w_uniform)
		else if (randcloth == 2)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ2(H), slot_w_uniform)
		else if (randcloth == 3)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ3(H), slot_w_uniform)
		else if (randcloth == 4)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ5(H), slot_w_uniform)
		else if (randcloth == 5)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ6(H), slot_w_uniform)

	//head
		var/randhead = rand(1,5)
		if (randhead == 1)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/blue_beret(H), slot_head)
		else if (randhead == 2)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/red_beret(H), slot_head)
		else if (randhead== 3)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/strawhat(H), slot_head)
		else if (randhead == 4)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/tarred_hat(H), slot_head)
		else if (randhead == 5)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/tricorne_black(H), slot_head)
	else
		var/randcloth = rand(1,3)
		if (randcloth == 1)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civf1(H), slot_w_uniform)
		else if (randcloth == 2)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civf2(H), slot_w_uniform)
		else if (randcloth == 3)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civf3(H), slot_w_uniform)

	//head
		H.equip_to_slot_or_del(new /obj/item/clothing/head/kerchief(H), slot_head)
	H.equip_to_slot_or_del(new/obj/item/weapon/material/hatchet(H), slot_belt)
	H.equip_to_slot_or_del(new/obj/item/weapon/wrench(H), slot_r_store)
	H.equip_to_slot_or_del(new/obj/item/stack/money/real(H), slot_l_store)

	H.add_note("Role", "You are a <b>Carpenter</b>. Organize the supplies and help the colonists build the Village!")
	H.setStat("strength", STAT_MEDIUM_HIGH)
	H.setStat("crafting", STAT_VERY_HIGH)
	H.setStat("rifle", STAT_MEDIUM_LOW)
	H.setStat("dexterity", STAT_NORMAL)
	H.setStat("swords", STAT_MEDIUM_LOW)
	H.setStat("pistol", STAT_MEDIUM_LOW)
	H.setStat("bows", STAT_MEDIUM_LOW)
	H.setStat("medical", STAT_MEDIUM_LOW)


	return TRUE

/datum/job/civilian/blacksmith
	title = "Blacksmith"
	en_meaning = "Colony Blacksmith"
	rank_abbreviation = "Blacksmith"
	selection_color = "#2d2d63"
	spawn_location = "JoinLateCiv"
	SL_check_independent = TRUE

	// AUTOBALANCE
	min_positions = 2
	max_positions = 10

/datum/job/civilian/blacksmith/equip(var/mob/living/carbon/human/H)
	if (!H)	return FALSE

//shoes
	if (prob(30))
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/blackboots1(H), slot_shoes)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/leatherboots1(H), slot_shoes)
//clothes
	if (H.gender == "male")
		var/randcloth = rand(1,5)
		if (randcloth == 1)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ1(H), slot_w_uniform)
		else if (randcloth == 2)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ2(H), slot_w_uniform)
		else if (randcloth == 3)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ3(H), slot_w_uniform)
		else if (randcloth == 4)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ5(H), slot_w_uniform)
		else if (randcloth == 5)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ6(H), slot_w_uniform)

	//head
		var/randhead = rand(1,5)
		if (randhead == 1)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/blue_beret(H), slot_head)
		else if (randhead == 2)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/red_beret(H), slot_head)
		else if (randhead== 3)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/strawhat(H), slot_head)
		else if (randhead == 4)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/tarred_hat(H), slot_head)
		else if (randhead == 5)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/tricorne_black(H), slot_head)
	else
		var/randcloth = rand(1,3)
		if (randcloth == 1)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civf1(H), slot_w_uniform)
		else if (randcloth == 2)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civf2(H), slot_w_uniform)
		else if (randcloth == 3)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civf3(H), slot_w_uniform)

	//head
		H.equip_to_slot_or_del(new /obj/item/clothing/head/kerchief(H), slot_head)

	H.equip_to_slot_or_del(new 	/obj/item/weapon/hammer(H), slot_belt)
	H.equip_to_slot_or_del(new 	/obj/item/stack/material/iron/twentyfive(H), slot_l_hand)
	H.equip_to_slot_or_del(new/obj/item/stack/money/real(H), slot_l_store)

	H.add_note("Role", "You are a <b>[title]</b>. Your job is to craft weapons and guns. However, you probably should follow the <b>Governor's</b> orders!")
	H.setStat("strength", STAT_VERY_HIGH)
	H.setStat("crafting", STAT_NORMAL)
	H.setStat("rifle", STAT_MEDIUM_LOW)
	H.setStat("dexterity", STAT_NORMAL)
	H.setStat("swords", STAT_MEDIUM_HIGH)
	H.setStat("pistol", STAT_MEDIUM_LOW)
	H.setStat("bows", STAT_VERY_LOW)
	H.setStat("medical", STAT_VERY_LOW)
	return TRUE

/datum/job/civilian/inkeeper
	title = "Inkeeper"
	en_meaning = "Colony Innkeeper/Taverner"
	rank_abbreviation = "Innkeeper"
	selection_color = "#2d2d63"
	spawn_location = "JoinLateCiv"
	SL_check_independent = TRUE

	// AUTOBALANCE
	min_positions = 1
	max_positions = 2

/datum/job/civilian/inkeeper/equip(var/mob/living/carbon/human/H)
	if (!H)	return FALSE

//shoes
	if (prob(30))
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/blackboots1(H), slot_shoes)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/leatherboots1(H), slot_shoes)
	if (H.gender == "male")
		var/randcloth = rand(1,5)
		if (randcloth == 1)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ1(H), slot_w_uniform)
		else if (randcloth == 2)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ2(H), slot_w_uniform)
		else if (randcloth == 3)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ3(H), slot_w_uniform)
		else if (randcloth == 4)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ5(H), slot_w_uniform)
		else if (randcloth == 5)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ6(H), slot_w_uniform)

	//head
		var/randhead = rand(1,5)
		if (randhead == 1)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/blue_beret(H), slot_head)
		else if (randhead == 2)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/red_beret(H), slot_head)
		else if (randhead== 3)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/strawhat(H), slot_head)
		else if (randhead == 4)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/tarred_hat(H), slot_head)
		else if (randhead == 5)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/tricorne_black(H), slot_head)
	else
		var/randcloth = rand(1,3)
		if (randcloth == 1)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civf1(H), slot_w_uniform)
		else if (randcloth == 2)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civf2(H), slot_w_uniform)
		else if (randcloth == 3)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civf3(H), slot_w_uniform)

	//head
		H.equip_to_slot_or_del(new /obj/item/clothing/head/kerchief(H), slot_head)

	H.equip_to_slot_or_del(new/obj/item/stack/money/real(H), slot_l_store)
	H.equip_to_slot_or_del(new/obj/item/weapon/key/civ/inn(H), slot_r_store)
	H.equip_to_slot_or_del(new/obj/item/weapon/material/knife/butcher(H), slot_belt)

	H.add_note("Role", "You are a <b>Inkeeper</b>. Your job is to build an Inn or Tavern to supply the Colonists with wine and food!")
	H.setStat("strength", STAT_MEDIUM_HIGH)
	H.setStat("crafting", STAT_NORMAL)
	H.setStat("rifle", STAT_MEDIUM_LOW)
	H.setStat("dexterity", STAT_NORMAL)
	H.setStat("swords", STAT_NORMAL)
	H.setStat("pistol", STAT_MEDIUM_LOW)
	H.setStat("bows", STAT_MEDIUM_LOW)
	H.setStat("medical", STAT_NORMAL)


	return TRUE



/datum/job/civilian/worker
	title = "Colonist"
	en_meaning = "Basic Colonist"
	rank_abbreviation = ""
	selection_color = "#2d2d63"
	spawn_location = "JoinLateCiv"
	SL_check_independent = TRUE

	// AUTOBALANCE
	min_positions = 10
	max_positions = 150

/datum/job/civilian/worker/equip(var/mob/living/carbon/human/H)
	if (!H)	return FALSE

//shoes
	if (prob(30))
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/blackboots1(H), slot_shoes)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/leatherboots1(H), slot_shoes)
	if (H.gender == "male")
		var/randcloth = rand(1,5)
		if (randcloth == 1)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ1(H), slot_w_uniform)
		else if (randcloth == 2)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ2(H), slot_w_uniform)
		else if (randcloth == 3)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ3(H), slot_w_uniform)
		else if (randcloth == 4)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ5(H), slot_w_uniform)
		else if (randcloth == 5)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civ6(H), slot_w_uniform)

	//head
		var/randhead = rand(1,5)
		if (randhead == 1)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/blue_beret(H), slot_head)
		else if (randhead == 2)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/red_beret(H), slot_head)
		else if (randhead== 3)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/strawhat(H), slot_head)
		else if (randhead == 4)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/tarred_hat(H), slot_head)
		else if (randhead == 5)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/tricorne_black(H), slot_head)
	else
		var/randcloth = rand(1,3)
		if (randcloth == 1)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civf1(H), slot_w_uniform)
		else if (randcloth == 2)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civf2(H), slot_w_uniform)
		else if (randcloth == 3)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/civf3(H), slot_w_uniform)

	//head
		H.equip_to_slot_or_del(new /obj/item/clothing/head/kerchief(H), slot_head)

	H.equip_to_slot_or_del(new/obj/item/stack/money/real(H), slot_l_store)

	H.add_note("Role", "You are a simple <b>Colonist</b>. Build your village!")
	H.setStat("strength", STAT_MEDIUM_HIGH)
	H.setStat("crafting", STAT_MEDIUM_LOW)
	H.setStat("rifle", STAT_MEDIUM_LOW)
	H.setStat("dexterity", STAT_NORMAL)
	H.setStat("swords", STAT_MEDIUM_LOW)
	H.setStat("pistol", STAT_MEDIUM_LOW)
	H.setStat("bows", STAT_MEDIUM_LOW)
	H.setStat("medical", STAT_MEDIUM_LOW)


	return TRUE

/////////////////////////CIVS////////////////////////

/datum/job/civilian/civa
	title = "Civilization A Citizen"
	rank_abbreviation = ""
	selection_color = "#2d2d63"
	spawn_location = "JoinLateCivA"
	SL_check_independent = TRUE
	is_civilizations = TRUE
	// AUTOBALANCE
	min_positions = 9999
	max_positions = 9999

/datum/job/civilian/civa/equip(var/mob/living/carbon/human/H)
	if (!H)	return FALSE
	H.civilization = civname_a
	H.give_clothes()

	H.add_note("Role", "You are a <b>citizen</b>. Stick with your fellow tribesmen, build your village, and honor the Gods!")
	H.add_note("Civilization", "You are a member of the <b>[civname_a]</b> civilization.")
	if (map.ordinal_age >= 2)
		if (prob(85))
			H.add_note("Religion", "You worship the <b>Old Gods</b> of your tribe. Keep an eye for heretics...")
		else
			H.add_note("Religion", "You worship the <b>Dark God</b>. Find your brothers in faith, and take over the Civilization! Remember, foreign worshipers are your allies, the Dark God is above patriotism!")
	else
		H.add_note("Religion", "You worship the <b>Old Gods</b> of your tribe. Keep an eye for heretics...")

	H.setStat("strength", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("crafting", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("rifle", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("dexterity", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("swords", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("pistol", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("bows", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("medical", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("philosophy", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))


	return TRUE


/datum/job/civilian/civb
	title = "Civilization B Citizen"
	rank_abbreviation = ""
	selection_color = "#2d2d63"
	spawn_location = "JoinLateCivB"
	SL_check_independent = TRUE
	is_civilizations = TRUE
	// AUTOBALANCE
	min_positions = 9999
	max_positions = 9999

/datum/job/civilian/civb/equip(var/mob/living/carbon/human/H)
	if (!H)	return FALSE
	H.civilization = civname_b
	H.give_clothes()

	H.add_note("Role", "You are a <b>citizen</b>. Stick with your fellow tribesmen, build your village, and honor the Gods!")
	H.add_note("Civilization", "You are a member of the <b>[civname_b]</b> civilization.")
	if (map.ordinal_age >= 2)
		if (prob(85))
			H.add_note("Religion", "You worship the <b>Old Gods</b> of your tribe. Keep an eye for heretics...")
		else
			H.add_note("Religion", "You worship the <b>Dark God</b>. Find your brothers in faith, and take over the Civilization! Remember, foreign worshipers are your allies, the Dark God is above patriotism!")
	else
		H.add_note("Religion", "You worship the <b>Old Gods</b> of your tribe. Keep an eye for heretics...")

	H.setStat("strength", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("crafting", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("rifle", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("dexterity", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("swords", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("pistol", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("bows", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("medical", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("philosophy", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))


	return TRUE


/datum/job/civilian/civc
	title = "Civilization C Citizen"
	rank_abbreviation = ""
	selection_color = "#2d2d63"
	spawn_location = "JoinLateCivC"
	SL_check_independent = TRUE
	is_civilizations = TRUE
	// AUTOBALANCE
	min_positions = 9999
	max_positions = 9999

/datum/job/civilian/civc/equip(var/mob/living/carbon/human/H)
	if (!H)	return FALSE
	H.civilization = civname_c
	H.give_clothes()

	H.add_note("Role", "You are a <b>citizen</b>. Stick with your fellow tribesmen, build your village, and honor the Gods!")
	H.add_note("Civilization", "You are a member of the <b>[civname_c]</b> civilization.")
	if (map.ordinal_age >= 2)
		if (prob(85))
			H.add_note("Religion", "You worship the <b>Old Gods</b> of your tribe. Keep an eye for heretics...")
		else
			H.add_note("Religion", "You worship the <b>Dark God</b>. Find your brothers in faith, and take over the Civilization! Remember, foreign worshipers are your allies, the Dark God is above patriotism!")
	else
		H.add_note("Religion", "You worship the <b>Old Gods</b> of your tribe. Keep an eye for heretics...")

	H.setStat("strength", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("crafting", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("rifle", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("dexterity", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("swords", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("pistol", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("bows", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("medical", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("philosophy", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))


	return TRUE


/datum/job/civilian/civd
	title = "Civilization D Citizen"
	rank_abbreviation = ""
	selection_color = "#2d2d63"
	spawn_location = "JoinLateCivD"
	SL_check_independent = TRUE
	is_civilizations = TRUE
	// AUTOBALANCE
	min_positions = 9999
	max_positions = 9999

/datum/job/civilian/civd/equip(var/mob/living/carbon/human/H)
	if (!H)	return FALSE
	H.civilization = civname_d
	H.give_clothes()

	H.add_note("Role", "You are a <b>citizen</b>. Stick with your fellow tribesmen, build your village, and honor the Gods!")
	H.add_note("Civilization", "You are a member of the <b>[civname_d]</b> civilization.")
	if (map.ordinal_age >= 2)
		if (prob(85))
			H.add_note("Religion", "You worship the <b>Old Gods</b> of your tribe. Keep an eye for heretics...")
		else
			H.add_note("Religion", "You worship the <b>Dark God</b>. Find your brothers in faith, and take over the Civilization! Remember, foreign worshipers are your allies, the Dark God is above patriotism!")
	else
		H.add_note("Religion", "You worship the <b>Old Gods</b> of your tribe. Keep an eye for heretics...")

	H.setStat("strength", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("crafting", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("rifle", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("dexterity", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("swords", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("pistol", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("bows", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("medical", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("philosophy", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))


	return TRUE


/datum/job/civilian/cive
	title = "Civilization E Citizen"
	rank_abbreviation = ""
	selection_color = "#2d2d63"
	spawn_location = "JoinLateCivE"
	SL_check_independent = TRUE
	is_civilizations = TRUE
	// AUTOBALANCE
	min_positions = 9999
	max_positions = 9999

/datum/job/civilian/cive/equip(var/mob/living/carbon/human/H)
	if (!H)	return FALSE
	H.civilization = civname_e
	H.give_clothes()

	H.add_note("Role", "You are a <b>citizen</b>. Stick with your fellow tribesmen, build your village, and honor the Gods!")
	H.add_note("Civilization", "You are a member of the <b>[civname_e]</b> civilization.")
	if (map.ordinal_age >= 2)
		if (prob(85))
			H.add_note("Religion", "You worship the <b>Old Gods</b> of your tribe. Keep an eye for heretics...")
		else
			H.add_note("Religion", "You worship the <b>Dark God</b>. Find your brothers in faith, and take over the Civilization! Remember, foreign worshipers are your allies, the Dark God is above patriotism!")
	else
		H.add_note("Religion", "You worship the <b>Old Gods</b> of your tribe. Keep an eye for heretics...")

	H.setStat("strength", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("crafting", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("rifle", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("dexterity", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("swords", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("pistol", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("bows", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("medical", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("philosophy", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))


	return TRUE


/datum/job/civilian/civf
	title = "Civilization F Citizen"
	rank_abbreviation = ""
	selection_color = "#2d2d63"
	spawn_location = "JoinLateCivF"
	SL_check_independent = TRUE
	is_civilizations = TRUE
	// AUTOBALANCE
	min_positions = 9999
	max_positions = 9999

/datum/job/civilian/civf/equip(var/mob/living/carbon/human/H)
	if (!H)	return FALSE
	H.civilization = civname_f
	H.give_clothes()

	H.add_note("Role", "You are a <b>citizen</b>. Stick with your fellow tribesmen, build your village, and honor the Gods!")
	H.add_note("Civilization", "You are a member of the <b>[civname_f]</b> civilization.")
	if (map.ordinal_age >= 2)
		if (prob(85))
			H.add_note("Religion", "You worship the <b>Old Gods</b> of your tribe. Keep an eye for heretics...")
		else
			H.add_note("Religion", "You worship the <b>Dark God</b>. Find your brothers in faith, and take over the Civilization! Remember, foreign worshipers are your allies, the Dark God is above patriotism!")
	else
		H.add_note("Religion", "You worship the <b>Old Gods</b> of your tribe. Keep an eye for heretics...")

	H.setStat("strength", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("crafting", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("rifle", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("dexterity", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("swords", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("pistol", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("bows", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("medical", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("philosophy", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))


	return TRUE


/datum/job/civilian/civnomad
	title = "Nomad"
	rank_abbreviation = ""
	selection_color = "#2d2d63"
	spawn_location = "JoinLateCiv"
	SL_check_independent = TRUE
	is_nomad = TRUE
	// AUTOBALANCE
	min_positions = 9999
	max_positions = 9999

/datum/job/civilian/civnomad/equip(var/mob/living/carbon/human/H)
	if (!H)	return FALSE
	H.give_clothes()
	H.make_nomad()

	H.add_note("Role", "You are a <b>Nomad</b>. Form a tribe and survive!")
	if (prob(80))
		H.add_note("Religion", "You worship the <b>Ancients</b>. This is a low-key religion that teaches you to respect others. Other violent religions, however, are not to be accepted...")
	else if (prob(50))
		H.add_note("Religion", "You worship the <b>Dark God</b>. Find your brothers in faith, and take over the world! The Lord of Light is your natural enemy.")
	else
		H.add_note("Religion", "You worship the <b>Lord of Light</b>. Find your brothers in faith, and take over the world! The Dark Lord is your natural enemy.")


	H.setStat("strength", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("crafting", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("rifle", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("dexterity", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("swords", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("pistol", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("bows", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("medical", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))
	H.setStat("philosophy", pick(STAT_NORMAL, STAT_MEDIUM_LOW, STAT_MEDIUM_HIGH))


	return TRUE
