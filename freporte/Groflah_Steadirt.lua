function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. "! Join in the [celebration]! Have a few drinks. Alas, there are no [Tumpy Tonics].");
	elseif(e.message:findi("celebration")) then
		e.self:Say("The Freeport Militia now has a bar to themselves. Luckily, it is not this one. Ahh.. I tell you, I just don't feel up to much right now. I have had so much grog, my great grandma could best me!!");
	elseif(e.message:findi("ariska")) then
		e.self:Say("Ariska Zimel was my best friend. He and I learned our knowledge of metal from such places as Halas and Kaladim. When he disappeared, it seemed to involve foul play. He must be alive somewhere in the city. I pray this is not the work of [Pietro Zarn].");
	elseif(e.message:findi("pietro zarn")) then
		e.self:Say("While we were traveling through the Lavastorm Mountains, we happened upon a caravan. They wore emblems in honor of the evil god, Innoruuk. They did not see us, but we saw them. And most importantly of all, Ariska saw the apparent leader's sword. It was glowing with great energy. Suddenly, the evil knights were in a battle. The knights gave chase, leaving their camp unattended. The knight who owned the sword left it behind, opting to fight with another, leading me to believe it was not his to begin with. It was at this point that Ariska ran down and grabbed the sword. A few weeks later, we were to learn that the knight was a powerful man by the name of Pietro Zarn and that he was looking for a sword stolen from him. He called it .. Soulfire. I believe Zarn must have finally found Ariska.");
	elseif(e.message:findi("tumpy tonics")) then
		e.self:Say("Ah a tumpy tonic, good drink indeed. They are made. Lets see if I can rememeber how to make them.  Ahh yes, ye take a kiola nut and stir it with water, wait a while and ya got it.  If you plan to make some then please by all means bring me one to try as I sure do miss them.");
	end
end

function event_trade(e)
	local Tumpy_Tonic = 0;
	local item_lib =require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18818})) then 
		e.self:Say("This used to be hanging in Zimel's Blades. It is the price list. It is badly faded though. There was a fire in Zimel's Blades and I was on the scene just afterward. I did not see this hanging. I wonder who took it . . . Hmmmm.. oh, yes.. the markings on the list! It is a code! Here. I will fill it in. Read it. You probably do not even know who Ariska is.");
		e.other:QuestReward(e.self,0,0,0,0,18819); -- Item: A tattered flier
		eq.unique_spawn(10003,0,0,-920,-210,-52.1,0); -- spawns Laken Boorheez
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12114,item2 = 12114,item3 = 12114,item4 = 12114}, 0)) then
		Tumpy_Tonic = 4;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12114,item2 = 12114,item3 = 12114}, 0)) then
		Tumpy_Tonic = 3;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12114,item2 = 12114}, 0)) then
		Tumpy_Tonic = 2;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12114}, 0)) then
		Tumpy_Tonic = 1;
	end
	
	if(Tumpy_Tonic > 0) then
		repeat
			e.self:Say("<glug,glug,glug> Ahh! I missed those. I was just telling myself the other... Uh oh! I have to use the little dwarf's facilities. Excuse me");
			e.other:Faction(e.self,229,10,0); -- Faction: Coalition of Tradefolk
			e.other:Faction(e.self,336,10,0); -- Faction: Coalition of Tradefolk Underground
			e.other:Faction(e.self,281,10,0); -- Faction: Knights of Truth
			e.other:Faction(e.self,291,7,0); -- Faction: Merchants of Qeynos
			e.other:QuestReward(e.self,math.random(10),math.random(10),math.random(2),0,0,15);
			Tumpy_Tonic = Tumpy_Tonic - 1;
		until Tumpy_Tonic == 0
	end

	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	if ( e.self:IsEngaged() ) then
		return;
	end

	local turn, bard;
	
	if ( e.signal == 1 ) then
		e.self:Say("Aye!! We shall show the world that the races can live together.");
		turn = true;		
	elseif ( e.signal == 2 ) then
		e.self:Say("That's right. Them smelly ogres can't even count to one.");
		turn = true;
	elseif ( e.signal == 4 ) then
		e.self:Say("No need to speak badly of Antonius Bayle. He is a great man.");
		turn = true;
	elseif ( e.signal == 7 ) then
		e.self:Say("Sing it, lass! Sir Lucan D'Lere is no friend of the people.");
		turn = true;
	end

	if ( turn ) then
		bard = eq.get_entity_list():GetMobByNpcTypeID(10141);			-- NPC: Trolon_Lightleer
		if ( not bard.valid ) then
			bard = eq.get_entity_list():GetMobByNpcTypeID(10158);		-- NPC: Branis_Noolright
		end
		if ( not bard.valid ) then 
			bard = eq.get_entity_list():GetMobByNpcTypeID(10165);		-- NPC: Palana_Willin
		end
		if ( bard.valid ) then
			e.self:FaceTarget(bard);
		end
	end
end

-- END of FILE Zone:freportn -- Groflah_Steadirt
