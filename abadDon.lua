local Abaddon = {}

Abaddon.Enable = Menu.AddOptionBool({ "Hero Specific", "Adaddon" }, "Enable Combo", false)
Abaddon.optionIcon = Menu.AddOptionIcon({ "Hero Specific","Adadon"}, "panorama/images/heroes/icons/npc_dota_hero_adaddon_png.vtex_c")
Abaddon.Key = Menu.AddKeyOption({ "Hero Specific", "Adaddon" }, "Combo Key", Enum.ButtonCode.BUTTON_CODE_NONE)


Abaddon.npcName = "npc_dota_hero_abaddon"
		-- Items
		diffusal = nil
		nullifier = nil
		medallion = nil
		solarCrest = nil
		aghanimScepter = nil
		orchid = nil
		bloodthorn = nil
		abyssalblade = nil
		myHero = nil
		
		forceStaff = nil
		hurricanePike = nil
		eul = nil


function Abaddon.OnUpdate()
	if not Engine.IsInGame() or Heroes.GetLocal() == nil or not GameRules.GetGameState() == 5 or not Menu.IsEnabled(Abaddon.Enable) or GameRules.IsPaused() then return
	end
    myHero = Heroes.GetLocal()
	
	if NPC.GetUnitName(myHero) ~= Abaddon.npcName or not Entity.IsAlive(myHero) then
		return
	end

    myPlayer = Players.GetLocal()	
	enemy = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)	
	
	
	
	if Menu.IsKeyDown(Abaddon.Key) then	
		local protection = Abaddon.checkProtection(enemy)
		Abaddon.Combo(myHero, enemy, protection)
	end
	
end

function Abaddon.Combo(me, enemyTarget, protect)
-- Skills
		local aphoticshield = NPC.GetAbility(me, "abaddon_aphotic_shield")
		local mistcoil = NPC.GetAbility(me, "abaddon_death_coil")  
		local myMana = NPC.GetMana(me)
		
		Abaddon.GetItems(me)
	
				
		if enemyTarget and NPC.HasModifier(enemyTarget, "modifier_item_ultimate_scepter") and Ability.IsReady(NPC.GetAbility(enemyTarget, "antimage_spell_shield")) then
			

			if diffusal and Ability.IsReady(diffusal) and Ability.IsCastable(diffusal, myMana) then
				Ability.CastTarget(diffusal, enemyTarget) 
			return end
			
			return 
		end
		
		if enemyTarget and NPC.IsLinkensProtected(enemyTarget) then
			if forceStaff and Ability.IsReady(forceStaff) and Ability.IsCastable(forceStaff, myMana) then
				Ability.CastTarget(forceStaff, enemyTarget) 
			return end
			
			if hurricanePike and Ability.IsReady(hurricanePike) and Ability.IsCastable(hurricanePike, myMana) then
				Ability.CastTarget(hurricanePike, enemyTarget) 
			return end
			
			if eul and Ability.IsReady(eul) and Ability.IsCastable(eul, myMana) then
				Ability.CastTarget(eul, enemyTarget) 
			return end
			
			if diffusal and Ability.IsReady(diffusal) and Ability.IsCastable(diffusal, myMana) then
				Ability.CastTarget(diffusal, enemyTarget) 
			return end
			
			if abyssalblade and Ability.IsReady(abyssalblade) and Ability.IsCastable(abyssalblade, myMana) then
				Ability.CastTarget(abyssalblade, enemyTarget) 
			return end
			
			if orchid and Ability.IsReady(orchid) and Ability.IsCastable(orchid, myMana) then
				Ability.CastTarget(orchid, enemyTarget) 
			return end
		
			if bloodthorn and Ability.IsReady(bloodthorn) and Ability.IsCastable(bloodthorn, myMana) then
				Ability.CastTarget(bloodthorn, enemyTarget) 
			return end
			
			return 
		end
		
		if enemyTarget and aphoticshield and Ability.IsReady(aphoticshield) and Ability.IsCastable(aphoticshield, myMana) then
			Ability.CastTarget(aphoticshield, myHero)
		return end
		
		if enemyTarget and mistcoil and Ability.IsReady(mistcoil) and Ability.IsCastable(mistcoil, myMana) then 
			Ability.CastTarget(mistcoil, enemyTarget) 
		return end
		
		if enemyTarget and abyssalblade and Ability.IsReady(abyssalblade) and Ability.IsCastable(abyssalblade, myMana) then
			Ability.CastTarget(abyssalblade, enemyTarget) 
		return end
		
		if enemyTarget and diffusal and Ability.IsReady(diffusal) and Ability.IsCastable(diffusal, myMana) then
			Ability.CastTarget(diffusal, enemyTarget) 
		return end
		
		
		
		if enemyTarget and medallion and Ability.IsReady(medallion) and Ability.IsCastable(medallion, myMana) then
			Ability.CastTarget(medallion, enemyTarget) 
		return end
		
		if enemyTarget and solarCrest and Ability.IsReady(solarCrest) and Ability.IsCastable(solarCrest, myMana) then
			Ability.CastTarget(solarCrest, enemyTarget) 
		return end
		
		if enemyTarget and orchid and Ability.IsReady(orchid) and Ability.IsCastable(orchid, myMana) then
			Ability.CastTarget(orchid, enemyTarget) 
		return end
		
		if enemyTarget and bloodthorn and Ability.IsReady(bloodthorn) and Ability.IsCastable(bloodthorn, myMana) then
			Ability.CastTarget(bloodthorn, enemyTarget) 
		return end
		
		if enemyTarget and nullifier and Ability.IsReady(nullifier) and Ability.IsCastable(nullifier, myMana) then
			Ability.CastTarget(nullifier, enemyTarget) 
		return end
end

function Abaddon.GetItems(hero)
         diffusal = NPC.GetItem(hero, "item_diffusal_blade", true)
		 nullifier = NPC.GetItem(hero, "item_nullifier", true)
		 medallion = NPC.GetItem(hero, "item_medallion_of_courage", true)
		 solarCrest = NPC.GetItem(hero, "item_solar_crest", true)
		 aghanimScepter = NPC.GetItem(hero, "item_ultimate_scepter", true)
		 orchid = NPC.GetItem(hero, "item_orchid", true)
		 bloodthorn = NPC.GetItem(hero, "item_bloodthorn", true)
		 abyssalblade = NPC.GetItem(hero, "item_abyssal_blade", true)
		
		 forceStaff = NPC.GetItem(hero, "item_force_staff", true)
		 hurricanePike = NPC.GetItem(hero, "item_hurricane_pike", true)
		 eul = NPC.GetItem(hero, "item_cyclone", true)
end

function Abaddon.checkProtection(enemy)
	if NPC.IsLinkensProtected(enemy) then return "LINKEN" end
	local spell_shield = NPC.GetAbility(enemy, "antimage_spell_shield")
	if spell_shield and Ability.IsReady(spell_shield) and (NPC.HasModifier(enemy, "modifier_item_ultimate_scepter") or NPC.HasModifier(enemy, "modifier_item_ultimate_scepter_consumed")) then
		return "LINKEN"
	end
	if NPC.GetAbility(enemy,"special_bonus_unique_queen_of_pain") then return "IMMUNE" end
	if NPC.HasModifier(enemy,"modifier_dark_willow_shadow_realm_buff") then return "IMMUNE" end
	if NPC.HasModifier(enemy,"modifier_skeleton_king_reincarnation_scepter_active") then return "IMMUNE" end
	if NPC.HasState(enemy,Enum.ModifierState.MODIFIER_STATE_MAGIC_IMMUNE) then return "IMMUNE" end
    if NPC.HasState(enemy,Enum.ModifierState.MODIFIER_STATE_OUT_OF_GAME) then return "IMMUNE" end  
	return false
end

return Abaddon