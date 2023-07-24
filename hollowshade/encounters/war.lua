local WarStart = 0;
local NPC_ID1 = 0;
local NPC_ID2 = 0;
local NPC_ID3 = 0;
local DefNPC_ID = 0;
local north = nil;
local east = nil;
local south = nil;

function ScriptSpawn(e)
	eq.set_timer("Reset",5000);
end

function ScriptTimer(e)
	if(e.timer == "Reset") then
		eq.stop_timer("Reset");
		Reset(e);
	elseif(e.timer == "OwlStart") then
		eq.stop_timer("OwlStart");
		eq.set_timer("StartWar",720000);
		eq.zone_emote(7,"Somewhere in the distance, the Owlbear sharpen their claws on boulders. The unsettling scraping noise spreads to every corner of the moor.");
		eq.zone_emote(7,"In the south, the Grimlings nervously scurry about.");
		OwlNPCID(e);
		NorthAttackerSpawn(e);
		GrimDefenderNPCID(e);
		SouthDefendSpawn(e);
	elseif(e.timer == "GrimStart") then
		eq.stop_timer("GrimStart");
		eq.set_timer("StartWar",720000);
		eq.zone_emote(7,"Hollowshade is abuzz with activity as the Grimlings make preparations to invade their enemy.");
		eq.zone_emote(7,"The sonic wolves in the east seem disoriented.");
		GrimNPCID(e);
		SouthAttackerSpawn(e);
		SonicDefenderNPCID(e);
		EastDefendSpawn(e);
	elseif(e.timer == "SonicStart") then
		eq.stop_timer("SonicStart");
		eq.set_timer("StartWar",720000);
		eq.zone_emote(7,"Frenzied howling fills the air, the sound taking on every aspect of an angry wail. The sonic wolves are mounting an offensive.");
		eq.zone_emote(7,"Owlbear in the north frantically prepare for the assault.");
		SonicNPCID(e);
		EastAttackerSpawn(e);
		OwlDefenderNPCID(e)
		NorthDefendSpawn(e);
	elseif(e.timer == "StartWar") then
		local HollowshadeRand = math.random(100);
		DespawnRemaining(e);
		if(north == "owl" and east == "sonic" and south == "grim") then
			eq.stop_timer("StartWar");
			WarStart = 0;
		elseif((north == "owl" or east == "owl" or south == "owl") and (north == "sonic" or east == "sonic" or south == "sonic")) then
			if(north == "owl" and east == "owl" and south == "sonic") then
				if(HollowshadeRand > 50) then
					eq.zone_emote(7,"Somewhere in the distance, the Owlbear sharpen their claws on boulders. The unsettling scraping noise spreads to every corner of the moor.");
					eq.zone_emote(7,"The sonic wolves in the south seem disoriented.");
					OwlNPCID(e);
					NorthAttackerSpawn(e);
					SonicDefenderNPCID(e);
					SouthDefendSpawn(e);
				else
					eq.zone_emote(7,"Frenzied howling fills the air, the sound taking on every aspect of an angry wail. The sonic wolves are mounting an offensive.");
					eq.zone_emote(7,"Their forces stretched thin due to occupying northern and eastern positions, the Owlbear find themselves unable to muster a defense to stave off the imminent attack.");
					SonicNPCID(e);
					SouthAttackerSpawn(e);
				end
			elseif(north == "owl" and east == "sonic" and south == "owl") then
				if(HollowshadeRand > 50) then
					eq.zone_emote(7,"Somewhere in the distance, the Owlbear sharpen their claws on boulders. The unsettling scraping noise spreads to every corner of the moor.");
					eq.zone_emote(7,"The sonic wolves in the east seem disoriented.");
					OwlNPCID(e);
					SouthAttackerSpawn(e);
					SonicDefenderNPCID(e);
					EastDefendSpawn(e);
				else
					eq.zone_emote(7,"Frenzied howling fills the air, the sound taking on every aspect of an angry wail. The sonic wolves are mounting an offensive.");
					eq.zone_emote(7,"Their forces stretched thin due to occupying northern and southern positions, the Owlbear find themselves unable to muster a defense to stave off the imminent attack.");
					SonicNPCID(e);
					EastAttackerSpawn(e);
				end
			elseif(north == "sonic" and east == "owl" and south == "owl") then
				if(HollowshadeRand > 50) then
					eq.zone_emote(7,"Somewhere in the distance, the Owlbear sharpen their claws on boulders. The unsettling scraping noise spreads to every corner of the moor.");
					eq.zone_emote(7,"The sonic wolves in the north seem disoriented.");
					OwlNPCID(e);
					EastAttackerSpawn(e);
					SonicDefenderNPCID(e);
					NorthDefendSpawn(e);
				else
					eq.zone_emote(7,"Frenzied howling fills the air, the sound taking on every aspect of an angry wail. The sonic wolves are mounting an offensive.");
					eq.zone_emote(7,"Their forces stretched thin due to occupying eastern and southern positions, the Owlbear find themselves unable to muster a defense to stave off the imminent attack.");
					SonicNPCID(e);
					NorthAttackerSpawn(e);
				end
			elseif(north == "sonic" and east == "sonic" and south == "owl") then
				if(HollowshadeRand > 50) then
					eq.zone_emote(7,"Frenzied howling fills the air, the sound taking on every aspect of an angry wail. The sonic wolves are mounting an offensive.");
					eq.zone_emote(7,"Owlbear in the south frantically prepare for the assault.");
					SonicNPCID(e);
					NorthAttackerSpawn(e);
					OwlDefenderNPCID(e)
					SouthDefendSpawn(e);
				else
					eq.zone_emote(7,"Somewhere in the distance, the Owlbear sharpen their claws on boulders. The unsettling scraping noise spreads to every corner of the moor.");
					eq.zone_emote(7,"Sonic wolves in the east howl in frustration. Their staunchest defenders will be unable to intercept the offensive in time.");
					OwlNPCID(e);
					SouthAttackerSpawn(e);
				end
			elseif(north == "sonic" and east == "owl" and south == "sonic") then
				if(HollowshadeRand > 50) then
					eq.zone_emote(7,"Frenzied howling fills the air, the sound taking on every aspect of an angry wail. The sonic wolves are mounting an offensive.");
					eq.zone_emote(7,"Owlbear in the east frantically prepare for the assault.");
					SonicNPCID(e);
					SouthAttackerSpawn(e);
					OwlDefenderNPCID(e)
					EastDefendSpawn(e);
				else
					eq.zone_emote(7,"Somewhere in the distance, the Owlbear sharpen their claws on boulders. The unsettling scraping noise spreads to every corner of the moor.");
					eq.zone_emote(7,"Sonic wolves in the north howl in frustration. Their staunchest defenders will be unable to intercept the offensive in time.");
					OwlNPCID(e);
					EastAttackerSpawn(e);
				end
			elseif(north == "owl" and east == "sonic" and south == "sonic") then
				if(HollowshadeRand > 50) then
					eq.zone_emote(7,"Frenzied howling fills the air, the sound taking on every aspect of an angry wail. The sonic wolves are mounting an offensive.");
					eq.zone_emote(7,"Owlbear in the north frantically prepare for the assault.");
					SonicNPCID(e);
					EastAttackerSpawn(e);
					OwlDefenderNPCID(e)
					NorthDefendSpawn(e);
				else
					eq.zone_emote(7,"Somewhere in the distance, the Owlbear sharpen their claws on boulders. The unsettling scraping noise spreads to every corner of the moor.");
					eq.zone_emote(7,"Sonic wolves in the south howl in frustration. Their staunchest defenders will be unable to intercept the offensive in time.");
					OwlNPCID(e);
					NorthAttackerSpawn(e);
				end
			end
		elseif((north == "owl" or east == "owl" or south == "owl") and (north == "grim" or east == "grim" or south == "grim")) then
			if(north == "owl" and east == "owl" and south == "grim") then
				if(HollowshadeRand > 50) then
					eq.zone_emote(7,"Somewhere in the distance, the Owlbear sharpen their claws on boulders. The unsettling scraping noise spreads to every corner of the moor.");
					eq.zone_emote(7,"In the south, the Grimlings nervously scurry about.");
					OwlNPCID(e);
					NorthAttackerSpawn(e);
					GrimDefenderNPCID(e);
					SouthDefendSpawn(e);
				else
					eq.zone_emote(7,"Hollowshade is abuzz with activity as the Grimlings make preparations to invade their enemy.");
					eq.zone_emote(7,"Their forces stretched thin due to occupying northern and eastern positions, the Owlbear find themselves unable to muster a defense to stave off the imminent attack.");
					GrimNPCID(e);
					SouthAttackerSpawn(e);
				end
			elseif(north == "owl" and east == "grim" and south == "owl") then
				if(HollowshadeRand > 50) then
					eq.zone_emote(7,"Somewhere in the distance, the Owlbear sharpen their claws on boulders. The unsettling scraping noise spreads to every corner of the moor.");
					eq.zone_emote(7,"In the east, the Grimlings nervously scurry about.");
					OwlNPCID(e);
					SouthAttackerSpawn(e);
					GrimDefenderNPCID(e);
					EastDefendSpawn(e);
				else
					eq.zone_emote(7,"Hollowshade is abuzz with activity as the Grimlings make preparations to invade their enemy.");
					eq.zone_emote(7,"Their forces stretched thin due to occupying northern and southern positions, the Owlbear find themselves unable to muster a defense to stave off the imminent attack.");
					GrimNPCID(e);
					EastAttackerSpawn(e);
				end
			elseif(north == "grim" and east == "owl" and south == "owl") then
				if(HollowshadeRand > 50) then
					eq.zone_emote(7,"Somewhere in the distance, the Owlbear sharpen their claws on boulders. The unsettling scraping noise spreads to every corner of the moor.");
					eq.zone_emote(7,"In the north, the Grimlings nervously scurry about.");
					OwlNPCID(e);
					EastAttackerSpawn(e);
					GrimDefenderNPCID(e);
					NorthDefendSpawn(e);
				else
					eq.zone_emote(7,"Hollowshade is abuzz with activity as the Grimlings make preparations to invade their enemy.");
					eq.zone_emote(7,"Their forces stretched thin due to occupying eastern and southern positions, the Owlbear find themselves unable to muster a defense to stave off the imminent attack.");
					GrimNPCID(e);
					NorthAttackerSpawn(e);
				end
			elseif(north == "grim" and east == "grim" and south == "owl") then
				if(HollowshadeRand > 50) then
					eq.zone_emote(7,"Hollowshade is abuzz with activity as the Grimlings make preparations to invade their enemy.");
					eq.zone_emote(7,"Owlbear in the south frantically prepare for the assault.");
					GrimNPCID(e);
					NorthAttackerSpawn(e);
					OwlDefenderNPCID(e)
					SouthDefendSpawn(e);
				else
					eq.zone_emote(7,"Somewhere in the distance, the Owlbear sharpen their claws on boulders. The unsettling scraping noise spreads to every corner of the moor.");
					eq.zone_emote(7,"The Grimlings brace themselves for an inevitable defeat and chant prayers for outside assistance. Their undefended eastern position will surely fall if unaided.");
					OwlNPCID(e);
					SouthAttackerSpawn(e);
				end
			elseif(north == "grim" and east == "owl" and south == "grim") then
				if(HollowshadeRand > 50) then
					eq.zone_emote(7,"Hollowshade is abuzz with activity as the Grimlings make preparations to invade their enemy.");
					eq.zone_emote(7,"Owlbear in the east frantically prepare for the assault.");
					GrimNPCID(e);
					SouthAttackerSpawn(e);
					OwlDefenderNPCID(e)
					EastDefendSpawn(e);
				else
					eq.zone_emote(7,"Somewhere in the distance, the Owlbear sharpen their claws on boulders. The unsettling scraping noise spreads to every corner of the moor.");
					eq.zone_emote(7,"The Grimlings brace themselves for an inevitable defeat and chant prayers for outside assistance. Their undefended northern position will surely fall if unaided.");
					OwlNPCID(e);
					EastAttackerSpawn(e);
				end
			elseif(north == "owl" and east == "grim" and south == "grim") then
				if(HollowshadeRand > 50) then
					eq.zone_emote(7,"Hollowshade is abuzz with activity as the Grimlings make preparations to invade their enemy.");
					eq.zone_emote(7,"Owlbear in the north frantically prepare for the assault.");
					GrimNPCID(e);
					EastAttackerSpawn(e);
					OwlDefenderNPCID(e)
					NorthDefendSpawn(e);
				else
					eq.zone_emote(7,"Somewhere in the distance, the Owlbear sharpen their claws on boulders. The unsettling scraping noise spreads to every corner of the moor.");
					eq.zone_emote(7,"The Grimlings brace themselves for an inevitable defeat and chant prayers for outside assistance. Their undefended southern position will surely fall if unaided.");
					OwlNPCID(e);
					NorthAttackerSpawn(e);
				end
			end
		elseif((north == "sonic" or east == "sonic" or south == "sonic") and (north == "grim" or east == "grim" or south == "grim")) then
			if(north == "sonic" and east == "sonic" and south == "grim") then
				if(HollowshadeRand > 50) then
					eq.zone_emote(7,"Frenzied howling fills the air, the sound taking on every aspect of an angry wail. The sonic wolves are mounting an offensive.");
					eq.zone_emote(7,"In the south, the Grimlings nervously scurry about.");
					SonicNPCID(e);
					NorthAttackerSpawn(e);
					GrimDefenderNPCID(e);
					SouthDefendSpawn(e);
				else
					eq.zone_emote(7,"Hollowshade is abuzz with activity as the Grimlings make preparations to invade their enemy.");
					eq.zone_emote(7,"Sonic wolves in the east howl in frustration. Their staunchest defenders will be unable to intercept the offensive in time.");
					GrimNPCID(e);
					SouthAttackerSpawn(e);
				end
			elseif(north == "sonic" and east == "grim" and south == "sonic") then
				if(HollowshadeRand > 50) then
					eq.zone_emote(7,"Frenzied howling fills the air, the sound taking on every aspect of an angry wail. The sonic wolves are mounting an offensive.");
					eq.zone_emote(7,"In the east, the Grimlings nervously scurry about.");
					SonicNPCID(e);
					SouthAttackerSpawn(e);
					GrimDefenderNPCID(e);
					EastDefendSpawn(e);
				else
					eq.zone_emote(7,"Hollowshade is abuzz with activity as the Grimlings make preparations to invade their enemy.");
					eq.zone_emote(7,"Sonic wolves in the north howl in frustration. Their staunchest defenders will be unable to intercept the offensive in time.");
					GrimNPCID(e);
					EastAttackerSpawn(e);
				end
			elseif(north == "grim" and east == "sonic" and south == "sonic") then
				if(HollowshadeRand > 50) then
					eq.zone_emote(7,"Frenzied howling fills the air, the sound taking on every aspect of an angry wail. The sonic wolves are mounting an offensive.");
					eq.zone_emote(7,"In the north, the Grimlings nervously scurry about.");
					SonicNPCID(e);
					EastAttackerSpawn(e);
					GrimDefenderNPCID(e);
					NorthDefendSpawn(e);
				else
					eq.zone_emote(7,"Hollowshade is abuzz with activity as the Grimlings make preparations to invade their enemy.");
					eq.zone_emote(7,"Sonic wolves in the south howl in frustration. Their staunchest defenders will be unable to intercept the offensive in time.");
					GrimNPCID(e);
					NorthAttackerSpawn(e);
				end
			elseif(north == "grim" and east == "grim" and south == "sonic") then
				if(HollowshadeRand > 50) then
					eq.zone_emote(7,"Hollowshade is abuzz with activity as the Grimlings make preparations to invade their enemy.");
					eq.zone_emote(7,"The sonic wolves in the south seem disoriented.");
					GrimNPCID(e);
					NorthAttackerSpawn(e);
					SonicDefenderNPCID(e);
					SouthDefendSpawn(e);
				else
					eq.zone_emote(7,"Frenzied howling fills the air, the sound taking on every aspect of an angry wail. The sonic wolves are mounting an offensive.");
					eq.zone_emote(7,"The Grimlings brace themselves for an inevitable defeat and chant prayers for outside assistance. Their undefended eastern position will surely fall if unaided.");
					SonicNPCID(e);
					SouthAttackerSpawn(e);
				end
			elseif(north == "grim" and east == "sonic" and south == "grim") then
				if(HollowshadeRand > 50) then
					eq.zone_emote(7,"Hollowshade is abuzz with activity as the Grimlings make preparations to invade their enemy.");
					eq.zone_emote(7,"The sonic wolves in the east seem disoriented.");
					GrimNPCID(e);
					SouthAttackerSpawn(e);
					SonicDefenderNPCID(e);
					EastDefendSpawn(e);
				else
					eq.zone_emote(7,"Frenzied howling fills the air, the sound taking on every aspect of an angry wail. The sonic wolves are mounting an offensive.");
					eq.zone_emote(7,"The Grimlings brace themselves for an inevitable defeat and chant prayers for outside assistance. Their undefended northern position will surely fall if unaided.");
					SonicNPCID(e);
					EastAttackerSpawn(e);
				end
			elseif(north == "sonic" and east == "grim" and south == "grim") then
				if(HollowshadeRand > 50) then
					eq.zone_emote(7,"Hollowshade is abuzz with activity as the Grimlings make preparations to invade their enemy.");
					eq.zone_emote(7,"The sonic wolves in the north seem disoriented.");
					GrimNPCID(e);
					EastAttackerSpawn(e);
					SonicDefenderNPCID(e);
					NorthDefendSpawn(e);
				else
					eq.zone_emote(7,"Frenzied howling fills the air, the sound taking on every aspect of an angry wail. The sonic wolves are mounting an offensive.");
					eq.zone_emote(7,"The Grimlings brace themselves for an inevitable defeat and chant prayers for outside assistance. Their undefended southern position will surely fall if unaided.");
					SonicNPCID(e);
					NorthAttackerSpawn(e);
				end
			end
		end
	elseif(e.timer == "victory") then
		eq.stop_timer("StartWar");
		eq.stop_timer("victory");
		eq.set_timer("GuardPostCond",90000);
		if(north == "owl" and east == "owl" and south == "owl") then
			eq.zone_emote(7,"The moor is shaken by the piercing screech of the mother owlbear, Skriat`Chakku!");
			eq.spawn_condition("hollowshade",6,1);
			eq.get_entity_list():GetMobByNpcTypeID(166028):Shout("Guards, merchants, we cannot win this battle!  Grab what you can carry and retreat back to Shar Vahl! Hurry!");
			GuardPostLeave(e);
		elseif(north == "sonic" and east == "sonic" and south == "sonic") then
			eq.zone_emote(7,"The eerie howls of triumphant wolves emanate from every corner of the moor. The howling rises and fall in chorus, as if calling someone yet unseen.");
			eq.spawn_condition("hollowshade",5,1);
			eq.get_entity_list():GetMobByNpcTypeID(166028):Shout("The wolves are upon us!  Grab what you can carry and retreat back to Shar Vahl!");
			GuardPostLeave(e);
		elseif(north == "grim" and east == "grim" and south == "grim") then
			eq.zone_emote(7,"The Grimling Chieftain shouts, 'All shall bear witness to the power of our master! We are the rightful heirs to this world and everything that lies upon it. Bow down before us or die!'");
			eq.spawn_condition("hollowshade",7,1);
			eq.zone_emote(7,"The Grimling Chieftain shouts, 'I call upon you, Prince! The swamplands have been cleansed and await your presence. Fill us with your strength and power!'");
			GuardPostLeave(e);
		end
	elseif(e.timer == "GuardPostCond") then
		eq.stop_timer("GuardPostCond");
		eq.spawn_condition("hollowshade",1,0);
	end
end

function ScriptSignal(e)
	if(e.signal == 1) then
		eq.set_timer("OwlStart",5000);
	elseif(e.signal == 2) then
		eq.set_timer("GrimStart",5000);
	elseif(e.signal == 3) then
		eq.set_timer("SonicStart",5000);
	elseif(e.signal == 4) then
		eq.set_timer("victory",15000);
	elseif(e.signal == 5) then
		eq.set_timer("Reset",10000);
		eq.stop_timer("GuardPostCond");
	end
end

function DespawnRemaining(e)
	eq.depop_all(166058); -- a_sonic_wolf_fiend
	eq.depop_all(166055); -- a_grimling_invader
	eq.depop_all(166056); -- a_grimling_invader
	eq.depop_all(166057); -- a_grimling_invader
	eq.depop_all(166046); -- a_furious_owlbear
	eq.depop_all(166053); -- an_owlbear_defender
	eq.depop_all(166054); -- a_grimling_defender
	eq.depop_all(166015); -- a_sonic_defender
end

function Reset(e)
	eq.spawn_condition("hollowshade",1,0);
	eq.spawn_condition("hollowshade",1,1);
	eq.spawn_condition("hollowshade",2,1);
	eq.spawn_condition("hollowshade",3,1);
	eq.spawn_condition("hollowshade",4,1);
	eq.spawn_condition("hollowshade",5,0);
	eq.spawn_condition("hollowshade",6,0);
	eq.spawn_condition("hollowshade",7,0);
	eq.spawn_condition("hollowshade",8,0);
	eq.spawn_condition("hollowshade",9,0);
	eq.spawn_condition("hollowshade",10,0);
	eq.spawn_condition("hollowshade",11,0);
	eq.spawn_condition("hollowshade",12,0);
	eq.spawn_condition("hollowshade",13,0);
	WarStart = 0;
	north = "owl";
	east = "sonic";
	south = "grim";
end

function chieftainDeath(e)
	if(WarStart == 0) then
		WarStart = 1;
		eq.signal(166232,1);
	end
end

function SonicPackDeath(e)
	if(WarStart == 0) then
		WarStart = 1;
		eq.signal(166232,2);
	end
end

function SonicGhowlikDeath(e)
	if(WarStart == 0) then
		WarStart = 1;
		eq.signal(166232,2);
	end
end

function OwlChaDeath(e)
	if(WarStart == 0) then
		WarStart = 1;
		eq.signal(166232,3);
	end
end

function OwlChuDeath(e)
	if(WarStart == 0) then
		WarStart = 1;
		eq.signal(166232,3);
	end
end

function OwlDenDeath(e)
	if(WarStart == 0) then
		WarStart = 1;
		eq.signal(166232,3);
	end
end

function OwlNPCID(e)
	NPC_ID1 = 166046;
	NPC_ID2 = 166046;
	NPC_ID3 = 166046;
end

function SonicNPCID(e)
	NPC_ID1 = 166058;
	NPC_ID2 = 166058;
	NPC_ID3 = 166058;
end

function GrimNPCID(e)
	NPC_ID1 = 166057;
	NPC_ID2 = 166056;
	NPC_ID3 = 166055;
end

function OwlDefenderNPCID(e)
	DefNPC_ID = 166053;
end

function SonicDefenderNPCID(e)
	DefNPC_ID = 166015;
end

function GrimDefenderNPCID(e)
	DefNPC_ID = 166054;
end

function NorthDefendSpawn(e)
	eq.spawn2(DefNPC_ID,0,0,1157,2171,165,170);
	eq.spawn2(DefNPC_ID,0,0,1137,2151,165,170);
	eq.spawn2(DefNPC_ID,0,0,1145,2132,165,170);
end

function EastDefendSpawn(e)
	eq.spawn2(DefNPC_ID,0,0,-2718,536,55,72);
	eq.spawn2(DefNPC_ID,0,0,-2716,551,55,72);
	eq.spawn2(DefNPC_ID,0,0,-2720,568,55,72);
end

function SouthDefendSpawn(e)
	eq.spawn2(DefNPC_ID,0,0,-618,-2763,59,0);
	eq.spawn2(DefNPC_ID,0,0,-621,-2771,60,0);
	eq.spawn2(DefNPC_ID,0,0,-605,-2760,59,0);
	eq.spawn2(DefNPC_ID,0,0,-627,-2764,58,0);
	eq.spawn2(DefNPC_ID,0,0,-609,-2767,61,0);
end


function NorthAttackerSpawn(e)
	eq.spawn2(NPC_ID1,73,0,1390,2160,165,0);
	eq.spawn2(NPC_ID2,73,0,1417,2164,160,0);
	eq.spawn2(NPC_ID2,73,0,1429,2167,155,0);
	eq.spawn2(NPC_ID3,73,0,1444,2170,155,0);
	eq.spawn2(NPC_ID3,73,0,1463,2175,150,0);
end

function EastAttackerSpawn(e)
	eq.spawn2(NPC_ID1,72,0,-2918,541,60,0);
	eq.spawn2(NPC_ID2,72,0,-2898,542,60,0);
	eq.spawn2(NPC_ID2,72,0,-2875,544,60,0);
	eq.spawn2(NPC_ID3,72,0,-2857,546,60,0);
	eq.spawn2(NPC_ID3,72,0,-2839,548,60,0);
end

function SouthAttackerSpawn(e)
	eq.spawn2(NPC_ID1,71,0,-1714,-1776,-122,0);
	eq.spawn2(NPC_ID2,71,0,-1702,-1767,-118,0);
	eq.spawn2(NPC_ID2,71,0,-1687,-1763,-114,0);
	eq.spawn2(NPC_ID3,71,0,-1652,-1751,-117,0);
	eq.spawn2(NPC_ID3,71,0,-1640,-1720,-120,0);
end

function GuardPostLeave(e)
	eq.rain(1);
	local Sergeant = eq.get_entity_list():GetMobByNpcTypeID(166028);
	if(Sergeant.valid) then
		Sergeant:SetRunning(true);
		Sergeant:CastToNPC():AssignWaypoints(74);
	end	
	local Kliknaw = eq.get_entity_list():GetMobByNpcTypeID(166078);
	if(Kliknaw.valid) then
		Kliknaw:SetRunning(true);
		Kliknaw:CastToNPC():AssignWaypoints(75);
	end	
	local Kreethaw = eq.get_entity_list():GetMobByNpcTypeID(166076);
	if(Kreethaw.valid) then
		Kreethaw:SetRunning(true);
		Kreethaw:CastToNPC():AssignWaypoints(81);
	end	
	local Rawkkun = eq.get_entity_list():GetMobByNpcTypeID(166079);
	if(Rawkkun.valid) then
		Rawkkun:SetRunning(true);
		Rawkkun:CastToNPC():AssignWaypoints(76);
	end	
	local Skurr = eq.get_entity_list():GetMobByNpcTypeID(166077);
	if(Skurr.valid) then
		Skurr:SetRunning(true);
		Skurr:CastToNPC():AssignWaypoints(82);
	end	
	local Kerr = eq.get_entity_list():GetMobByNpcTypeID(166083);
	if(Kerr.valid) then
		Kerr:SetRunning(true);
		Kerr:CastToNPC():AssignWaypoints(79);
	end	
	local Rittuh = eq.get_entity_list():GetMobByNpcTypeID(166081);
	if(Rittuh.valid) then
		Rittuh:SetRunning(true);
		Rittuh:CastToNPC():AssignWaypoints(78);
	end	
	local Tokk = eq.get_entity_list():GetMobByNpcTypeID(166082);
	if(Tokk.valid) then
		Tokk:SetRunning(true);
		Tokk:CastToNPC():AssignWaypoints(77);
	end	
	local Tolah = eq.get_entity_list():GetMobByNpcTypeID(166084);
	if(Tolah.valid) then
		Tolah:SetRunning(true);
		Tolah:CastToNPC():AssignWaypoints(80);
	end	
end

function OwlWaypoint(e)
	if(e.self:GetGrid() == 71 and e.wp == 5) then
		eq.spawn_condition("hollowshade",3,0);
		eq.spawn_condition("hollowshade",11,0);
		eq.spawn_condition("hollowshade",10,1);
		east = "owl";
		eq.zone_emote(7,"Your ears are filled with the screeches of the Owlbear as they lay claim to the swampland in the east.");
		if(north == "owl" and east == "owl" and south == "owl") then
			eq.signal(166232,4);
		end
		eq.depop_all(166046);
		eq.depop();
	elseif(e.self:GetGrid() == 72 and e.wp == 11) then
		eq.spawn_condition("hollowshade",8,0);
		eq.spawn_condition("hollowshade",9,0);
		eq.spawn_condition("hollowshade",2,1);
		north = "owl";
		eq.zone_emote(7,"The Owlbear screech in delight, having recovered their cavernous home in the north.");
		if(north == "owl" and east == "owl" and south == "owl") then
			eq.signal(166232,4);
		end
		eq.depop_all(166046);
		eq.depop();
	elseif(e.self:GetGrid() == 73 and e.wp == 20) then
		eq.spawn_condition("hollowshade",4,0);
		eq.spawn_condition("hollowshade",13,0);
		eq.spawn_condition("hollowshade",12,1);
		south = "owl";
		eq.zone_emote(7,"The Owlbear chase off any remaining survivors as they lay claim to the southern shores.");
		if(north == "owl" and east == "owl" and south == "owl") then
			eq.signal(166232,4);
		end
		eq.depop_all(166046);
		eq.depop();
	end
end

function SonicWaypoint(e)
	if(e.self:GetGrid() == 71 and e.wp == 5) then
		eq.spawn_condition("hollowshade",10,0);
		eq.spawn_condition("hollowshade",11,0);
		eq.spawn_condition("hollowshade",3,1);
		east = "sonic";
		eq.zone_emote(7,"Sonic wolves howl together in unison, delighted that they have recovered their cavern home in the east.");
		if(north == "sonic" and east == "sonic" and south == "sonic") then
			eq.signal(166232,4);
		end
		eq.depop_all(166058);
		eq.depop();
	elseif(e.self:GetGrid() == 72 and e.wp == 11) then
		eq.spawn_condition("hollowshade",2,0);
		eq.spawn_condition("hollowshade",9,0);
		eq.spawn_condition("hollowshade",8,1);
		north = "sonic";
		eq.zone_emote(7,"Sonic wolves howl in celebration, having overrun the inhabitants of the northern caves.");
		if(north == "sonic" and east == "sonic" and south == "sonic") then
			eq.signal(166232,4);
		end
		eq.depop_all(166058);
		eq.depop();
	elseif(e.self:GetGrid() == 73 and e.wp == 20) then
		eq.spawn_condition("hollowshade",4,0);
		eq.spawn_condition("hollowshade",12,0);
		eq.spawn_condition("hollowshade",13,1);
		south = "sonic";
		eq.zone_emote(7,"Sonic wolves hunt down the few remaining survivors as they claim the southern shores for themselves.");
		if(north == "sonic" and east == "sonic" and south == "sonic") then
			eq.signal(166232,4);
		end
		eq.depop_all(166058);
		eq.depop();
	end
end

function Grim1Waypoint(e)
	if(e.self:GetGrid() == 71 and e.wp == 5) then
		eq.spawn_condition("hollowshade",10,0);
		eq.spawn_condition("hollowshade",3,0);
		eq.spawn_condition("hollowshade",11,1);
		east = "grim";
		eq.zone_emote(7,"From the east, sounds of the Grimling victory celebration echo across the swamp.");
		if(north == "grim" and east == "grim" and south == "grim") then
			eq.signal(166232,4);
		end
		eq.depop_all(166056);
		eq.depop_all(166057);
		eq.depop_all(166055);
		eq.depop();
	elseif(e.self:GetGrid() == 72 and e.wp == 11) then
		eq.spawn_condition("hollowshade",2,0);
		eq.spawn_condition("hollowshade",8,0);
		eq.spawn_condition("hollowshade",9,1);
		north = "grim";
		eq.zone_emote(7,"In the north resounds an excited chattering of Grimlings as they take over the network of caves for their own.");
		if(north == "grim" and east == "grim" and south == "grim") then
			eq.signal(166232,4);
		end
		eq.depop_all(166056);
		eq.depop_all(166057);
		eq.depop_all(166055);
		eq.depop();
	elseif(e.self:GetGrid() == 73 and e.wp == 20) then
		eq.spawn_condition("hollowshade",13,0);
		eq.spawn_condition("hollowshade",12,0);
		eq.spawn_condition("hollowshade",4,1);
		south = "grim";
		eq.zone_emote(7,"The Grimlings on the southern shores begin hosting a celebration, elated at having reclaimed their ancestral home.");
		if(north == "grim" and east == "grim" and south == "grim") then
			eq.signal(166232,4);
		end
		eq.depop_all(166056);
		eq.depop_all(166057);
		eq.depop_all(166055);
		eq.depop();
	end
end

function Grim2Waypoint(e)
	if(e.self:GetGrid() == 71 and e.wp == 5) then
		eq.spawn_condition("hollowshade",10,0);
		eq.spawn_condition("hollowshade",3,0);
		eq.spawn_condition("hollowshade",11,1);
		east = "grim";
		eq.zone_emote(7,"From the east, sounds of the Grimling victory celebration echo across the swamp.");
		if(north == "grim" and east == "grim" and south == "grim") then
			eq.signal(166232,4);
		end
		eq.depop_all(166057);
		eq.depop_all(166055);
		eq.depop_all(166056);
		eq.depop();
	elseif(e.self:GetGrid() == 72 and e.wp == 11) then
		eq.spawn_condition("hollowshade",2,0);
		eq.spawn_condition("hollowshade",8,0);
		eq.spawn_condition("hollowshade",9,1);
		north = "grim";
		eq.zone_emote(7,"In the north resounds an excited chattering of Grimlings as they take over the network of caves for their own.");
		if(north == "grim" and east == "grim" and south == "grim") then
			eq.signal(166232,4);
		end
		eq.depop_all(166057);
		eq.depop_all(166055);
		eq.depop_all(166056);
		eq.depop();
	elseif(e.self:GetGrid() == 73 and e.wp == 20) then
		eq.spawn_condition("hollowshade",13,0);
		eq.spawn_condition("hollowshade",12,0);
		eq.spawn_condition("hollowshade",4,1);
		south = "grim";
		eq.zone_emote(7,"The Grimlings on the southern shores begin hosting a celebration, elated at having reclaimed their ancestral home.");
		if(north == "grim" and east == "grim" and south == "grim") then
			eq.signal(166232,4);
		end
		eq.depop_all(166057);
		eq.depop_all(166055);
		eq.depop_all(166056);
		eq.depop();
	end
end

function Grim3Waypoint(e)
	if(e.self:GetGrid() == 71 and e.wp == 5) then
		eq.spawn_condition("hollowshade",10,0);
		eq.spawn_condition("hollowshade",3,0);
		eq.spawn_condition("hollowshade",11,1);
		east = "grim";
		eq.zone_emote(7,"From the east, sounds of the Grimling victory celebration echo across the swamp.");
		if(north == "grim" and east == "grim" and south == "grim") then
			eq.signal(166232,4);
		end
		eq.depop_all(166055);
		eq.depop_all(166056);
		eq.depop_all(166057);
		eq.depop();
	elseif(e.self:GetGrid() == 72 and e.wp == 11) then
		eq.spawn_condition("hollowshade",2,0);
		eq.spawn_condition("hollowshade",8,0);
		eq.spawn_condition("hollowshade",9,1);
		north = "grim";
		eq.zone_emote(7,"In the north resounds an excited chattering of Grimlings as they take over the network of caves for their own.");
		if(north == "grim" and east == "grim" and south == "grim") then
			eq.signal(166232,4);
		end
		eq.depop_all(166055);
		eq.depop_all(166056);
		eq.depop_all(166057);
		eq.depop();
	elseif(e.self:GetGrid() == 73 and e.wp == 20) then
		eq.spawn_condition("hollowshade",13,0);
		eq.spawn_condition("hollowshade",12,0);
		eq.spawn_condition("hollowshade",4,1);
		south = "grim";
		eq.zone_emote(7,"The Grimlings on the southern shores begin hosting a celebration, elated at having reclaimed their ancestral home.");
		if(north == "grim" and east == "grim" and south == "grim") then
			eq.signal(166232,4);
		end
		eq.depop_all(166055);
		eq.depop_all(166056);
		eq.depop_all(166057);
		eq.depop();
	end
end

function GarzemortDeath(e)
	eq.zone_emote(7,"A heavy silence descends upon the moor as Garzemort stills in death. One by one the sonic wolves and owlbears return to their homes, leaving an uneasy peace upon the land. Small grimling hands lift the prince's body in the air and carry him into the caves to seek resurrection from their Master.");
	eq.signal(166232,5);
end
function GnarlickDeath(e)
	eq.zone_emote(7,"A howl echoes through the land as Gnarlick's blood seeps into the ground. The owlbears and grimlings take back their homes in respectful silence, bringing balance back to the swamplands. The wolves keen and howl as a powerful wolf successor steps forward to feed upon their former leader.");
	eq.signal(166232,5);
end
function ChakkuDeath(e)
	eq.zone_emote(7,"Skriat`Chakku collapses in a pile of feathers, defeated. The Grimling and sonic wolves reclaim their homes, bringing balance back to the swamplands. Fortunately for the Owlbear, their great denmother left an heir.");
	eq.signal(166232,5);
end

function OwlDefSpawn(e)
	local client_list = eq.get_entity_list():GetClientList();
	if(client_list ~= nil) then
		eq.set_timer("depop",600000);
	else
		eq.set_timer("depop",60000);
	end
end

function OwlDefTimer(e)
	eq.stop_timer("depop");
	eq.depop();
end

function OwlDefCombat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function SonicDefSpawn(e)
	local client_list =eq.get_entity_list():GetClientList();
	if(client_list ~= nil) then
		eq.set_timer("depop",600000);
	else
		eq.set_timer("depop",60000);
	end
end

function SonicDefTimer(e)
	eq.stop_timer("depop");
	eq.depop();
end

function SonicDefCombat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function GrimDefSpawn(e)
	local client_list = eq.get_entity_list():GetClientList();
	if(client_list ~= nil) then
		eq.set_timer("depop",600000);
	else
		eq.set_timer("depop",60000);
	end
end

function GrimDefTimer(e)
	eq.stop_timer("depop");
	eq.depop();
end

function GrimDefCombat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function event_encounter_load(e)
	eq.register_npc_event("war", Event.spawn, 166053, OwlDefSpawn);
	eq.register_npc_event("war", Event.timer, 166053, OwlDefTimer);
	eq.register_npc_event("war", Event.combat, 166053, OwlDefCombat);
	eq.register_npc_event("war", Event.spawn, 166015, SonicDefSpawn);
	eq.register_npc_event("war", Event.timer, 166015, SonicDefTimer);
	eq.register_npc_event("war", Event.combat, 166015, SonicDefCombat);
	eq.register_npc_event("war", Event.spawn, 166054, GrimDefSpawn);
	eq.register_npc_event("war", Event.timer, 166054, GrimDefTimer);
	eq.register_npc_event("war", Event.combat, 166054, GrimDefCombat);
	eq.register_npc_event("war", Event.death, 166051, GarzemortDeath);
	eq.register_npc_event("war", Event.death, 166045, GnarlickDeath);
	eq.register_npc_event("war", Event.death, 166059, ChakkuDeath);
	eq.register_npc_event("war", Event.waypoint_arrive, 166055, Grim1Waypoint);
	eq.register_npc_event("war", Event.waypoint_arrive, 166056, Grim2Waypoint);
	eq.register_npc_event("war", Event.waypoint_arrive, 166057, Grim3Waypoint);
	eq.register_npc_event("war", Event.waypoint_arrive, 166046, OwlWaypoint);
	eq.register_npc_event("war", Event.waypoint_arrive, 166058, SonicWaypoint);
	eq.register_npc_event("war", Event.death, 166259, chieftainDeath);
	eq.register_npc_event("war", Event.death, 166151, SonicPackDeath);
	eq.register_npc_event("war", Event.death, 166008, SonicGhowlikDeath);
	eq.register_npc_event("war", Event.death, 166011, OwlChaDeath);
	eq.register_npc_event("war", Event.death, 166009, OwlChuDeath);
	eq.register_npc_event("war", Event.death, 166152, OwlDenDeath);
	eq.register_npc_event("war", Event.spawn, 166232, ScriptSpawn);
	eq.register_npc_event("war", Event.timer, 166232, ScriptTimer);
	eq.register_npc_event("war", Event.signal, 166232, ScriptSignal);
end