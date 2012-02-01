local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TYPE, PSYCHICDAMAGE)

setCombatParam(combat, COMBAT_PARAM_EFFECT, 134)

function onCastSpell(cid, var)

	doCreatureSay(cid, "PSY SHIFT!", TALKTYPE_MONSTER)
	if getPlayerStorageValue(cid, 3) >= 1 then
	doSendAnimatedText(getThingPos(cid), "MISS", 215)
	setPlayerStorageValue(cid, 3, -1)
	return true
	end
	if getPlayerStorageValue(cid, 5) >= 1 then
		if math.random(1,100) <= 33 then
		doSendAnimatedText(getThingPos(cid), "SELF HIT", 180)
			if isPlayer(getCreatureTarget(cid)) then
			huah = getPlayerLevel(getCreatureTarget(cid))
			else
			huah = getPlayerLevel(getCreatureMaster(getCreatureTarget(cid)))
			end
		local levels = huah
		doTargetCombatHealth(getCreatureTarget(cid), cid, COMBAT_PHYSICALDAMAGE, -(math.random((levels*3),(levels*5))), -((math.random((levels*3),(levels*5))+10)), 3)
		return true
		end
	end
	doSendMagicEffect(getThingPos(getCreatureTarget(cid)), 12)
	return doCombat(cid, combat, var)

end 