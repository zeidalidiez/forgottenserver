local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_EXPLOSIONAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EXPLOSION)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setArea(createCombatArea(AREA_CROSS1X1))

function onGetFormulaValues(player, skill, attack, factor)
	local distanceSkill = player:getEffectiveSkillLevel(SKILL_DISTANCE)
	local min = (player:getLevel() / 5) + distanceSkill * 0.7
	local max = (player:getLevel() / 5) + distanceSkill + 5
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant, isHotkey)
	return combat:execute(creature, variant)
end
