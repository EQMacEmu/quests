local INVIS_TRIBUNAL_TYPE = 201423; -- #The_Tribunal_
local VIS_TRIBUNAL_TYPE = 201427; -- The_Tribunal

local skipAggroText;

function AnimateTribunal(animationId)
	local npcList = eq.get_entity_list():GetNPCList();

	if ( npcList ) then
		for npc in npcList.entries do
			if ( npc.valid and npc:GetNPCTypeID() == VIS_TRIBUNAL_TYPE ) then
				npc:DoAnim(animationId);
			end
		end
	end
end

function event_say(e)
	if ( e.message:findi("hail") ) then
		e.self:Say("Greetings mortal, it seems the council has deemed you worthy of the challenge, are you ready to face judgement?");
		
	elseif ( e.message:findi("ready to face") ) then
		e.self:Say("Very well mortals, Now begins the test of your very souls!");
		skipAggroText = true;
		e.self:AddToHateList(e.other);
	end
end

function event_combat(e)
	if ( e.joined ) then
		if ( not skipAggroText ) then
			e.self:Say("Prepare for judgement mortals!");
		end
		eq.set_timer("verdict", math.random(181, 190) * 1000);
		eq.set_timer("tremor", math.random(86, 95) * 1000);
		eq.stop_timer("stop");
	else
		skipAggroText = false;
		eq.set_timer("stop", 600000);
	end
end

function event_timer(e)

	if ( e.timer == "verdict" ) then
		eq.set_timer("verdict", 187000);
		AnimateTribunal(42);
		eq.get_entity_list():GetMobByNpcTypeID(INVIS_TRIBUNAL_TYPE):CastSpell(1108, e.self:GetID()); -- Verdict of Eternity
		
	elseif ( e.timer == "tremor" ) then
		eq.set_timer("tremor", 187000);
		AnimateTribunal(1);
		eq.get_entity_list():GetMobByNpcTypeID(INVIS_TRIBUNAL_TYPE):CastSpell(1107, e.self:GetID()); -- Tremor of Judgment
		
	elseif ( e.timer == "stop" ) then
		eq.stop_timer("stop");
		eq.stop_timer("verdict");
		eq.stop_timer("tremor");
	end
end
