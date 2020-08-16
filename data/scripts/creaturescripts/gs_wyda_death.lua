local creatureevent = CreatureEvent("GiantSpiderWyda")

function creatureevent.onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
	creature:say("It seems this was just an illusion.", TALKTYPE_MONSTER_SAY)
	return true
end

creatureevent:register()
