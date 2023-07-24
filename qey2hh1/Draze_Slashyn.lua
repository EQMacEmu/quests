-- ###################################
-- NPC:  Draze Slashyn
-- Info:  Spawned by quest, Linaya Sowlin
-- Zone: qey2hh1
-- Quest:  Nitrates and the Assassin
-- Loot: Item id 18911 100%, random trash(rusty axe, zone random), and small cash
-- Level: 5 HP: 200 Class:  Warrior
-- Spawn Loc:  -3400,-8000,23
-- Author:  Andrew80k
-- Converted to Lua by robregen
-- ####################################

function event_spawn(e)
	eq.move_to(-7756,-3726,1);
	eq.set_timer("shout",5000)
end

function event_timer(e)
	e.self:Emote("shouts 'Come out of that house, Linaya Sowlin!! I am waiting! It is time for you to die!'")
	e.self:Say("I shall chop you down as your people chopped down the beauty of the forests!!")
	eq.stop_timer("shout")
end
