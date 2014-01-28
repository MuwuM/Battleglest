local i = 0
while i < 7 do
	disableAi(i)
	disableConsume(i)
	i = i + 1
end
print("-- Loading Lanes --")

timer_event1 = startTimerEvent()
firstspawn = 1
lastspawntimer=0
timeleft=0

aiTimer = startTimerEvent()
lastAItimer = 0
aiIsWorking = 0
timer_event2 = startTimerEvent()
aiTimeLoop = 0
aiEnabled = 0
timer_gold = startTimerEvent()
goldLoop = 0
timer_respawn = startTimerEvent()

killed_bugs = 0




local i = 1
local j = 1
while i <= table.getn(tower) do
	j = 1
	while j <= table.getn(tower[i][1]) do
		makeLanes = unit:new{}
		makeLanes:createTower(0,i,tower[i][1][j])
		makeLanes = unit:new{}
		makeLanes:createTower(4,i,tower[i][2][j])
		j = j + 1
	end
	i = i + 1
end


--BASE

makeBase1 = unit:new{}
makeBase1:createBase(0,base[1])
makeBase2 = unit:new{}
makeBase2:createBase(4,base[2])


--Heros
makeHeros = unit:new{}
makeHeros:createHero(herosOfPlayersabc[1], 1, {regarea[1][1] , regarea[1][2] - 2 })
--networkSetCameraPositionForFaction(1,regarea[1])
setCameraPosition(makeHeros:position())
unit:create("_shop", 1, shop[1])
networkaddUnitToGroupSelection(1,lastCreatedUnit(),2)

makeHeros = unit:new{}
makeHeros:createHero(herosOfPlayersabc[2], 2, {regarea[1][1] , regarea[1][2] - 2 })
--networkSetCameraPositionForFaction(2,regarea[1])
unit:create("_shop", 2, shop[2])
networkaddUnitToGroupSelection(2,lastCreatedUnit(),2)

makeHeros = unit:new{}
makeHeros:createHero(herosOfPlayersabc[5], 5, {regarea[2][1] , regarea[2][2] + 2 })
--networkSetCameraPositionForFaction(5,regarea[2])
unit:create("_shop", 5, shop[5])
networkaddUnitToGroupSelection(5,lastCreatedUnit(),2)

makeHeros = unit:new{}
makeHeros:createHero(herosOfPlayersabc[6], 6, {regarea[2][1] , regarea[2][2] + 2 })
--networkSetCameraPositionForFaction(6,regarea[2])
unit:create("_shop", 6, shop[6])
networkaddUnitToGroupSelection(6,lastCreatedUnit(),2)

j = 1
while j <= table.getn(mobs) do
	makeHydra = unit:new{}
	makeHydra:create(mobs[j][2], 3,mobs[j][1])
	j = j + 1
end
displayFormattedLangText ("secleft",tostring(starttime))

i = 1
while i <= table.getn(portshrine) do
	createUnitNoSpacing('portal', 3, {portshrine[i][1],portshrine[i][2]})
	addCellMarker(portshrine[i][4],portshrine[i][3],'',{portshrine[i][1],portshrine[i][2]})
	teleports[i] = registerCellAreaTriggerEvent({portshrine[i][1]-1,portshrine[i][2]-1,portshrine[i][1]+1,portshrine[i][2]+1})
	i = i + 1
end
