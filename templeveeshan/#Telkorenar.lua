-- Telkorenar's WToV tests: Test of Protection, Fire Storm, Living Flame, Tooth

function event_say(e)
	if(e.other:GetFactionValue(e.self) >= 500) then -- req kindly cov
		if(e.message:findi("hail")) then
			e.self:Say("The Strong seek me out, for one reason or another. It seems you have come here in peace. Perhaps you wish to prove yourself a mighty fighter? I respect only might, " .. e.other:Race() .. ".");
		elseif(e.message:findi("prove")) then
			e.self:Say("For the mighty I have four tests. The test of the tooth, the test of the flame, the test of the fire storm, and the test of protection. Which test do you wish to undertake?");
		elseif(e.message:findi("tooth")) then
			e.self:Say("With tooth and nail you must fight, deep into the halls of testing. Recover the white tear of power, the white symbol for purity, the silver symbol to calm ones self, and a glowing orb. If you can return these to me I will know you are a mighty fighter indeed.");
		elseif(e.message:findi("flame")) then
			e.self:Say("Return the black tear, the black symbol, the poison symbol, and the serrated symbol to me and you will have completed the test of flame. Your reward will be quite suitable to one who enters the fray of battle.");
		elseif(e.message:findi("fire storm")) then
			e.self:Say("Become like a fire storm and bring your wrath upon the inhabitants of the halls of testing. Return when you have the tear of poison and the serrated tear along with the a symbol kissed by flames and a ruby symbol.");
		elseif(e.message:findi("protection")) then
			e.self:Say("My fire will protect you if you are strong enough to endure this test. A ruby tear like my flames, an emerald tear like a forest ready to burn, an emerald symbol, and a platinum symbol are what I seek. With these I will forge pauldrons unlike any you have ever seen mortal. Go now and seek out what I desire.");
		end
 	elseif(e.other:GetFactionValue(e.self) >= 0) then
		e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
	else
		e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFactionValue(e.self) >= 500 and item_lib.check_turn_in(e.self, e.trade, {item1 = 31257,item2 = 31268,item3 = 31270,item4 = 31258})) then -- protection
		FactionHits(e);
		e.other:QuestReward(e.self,0,0,0,0,31472,20000);
	elseif(e.other:GetFactionValue(e.self) >= 500 and item_lib.check_turn_in(e.self, e.trade, {item1 = 31260,item2 = 31253,item3 = 31261,item4 = 31250})) then -- test of the tooth
		FactionHits(e);
		e.other:QuestReward(e.self,0,0,0,0,31469,20000);
	elseif(e.other:GetFactionValue(e.self) >= 500 and item_lib.check_turn_in(e.self, e.trade, {item1 = 31262,item2 = 31251,item3 = 31255,item4 = 31254})) then -- test of living flame
		FactionHits(e);
		e.other:QuestReward(e.self,0,0,0,0,31470,20000);
	elseif(e.other:GetFactionValue(e.self) >= 500 and item_lib.check_turn_in(e.self, e.trade, {item1 = 31256,item2 = 31266,item3 = 31265,item4 = 31259})) then -- test of the fire storm
		FactionHits(e);
		e.other:QuestReward(e.self,0,0,0,0,31471,20000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function FactionHits(e)
	e.self:Say("You have done well, ".. e.other:Race() .. ". You have proven that you are strong, but do you dare enter those halls again?");
	e.other:Faction(e.self,430,75); -- Faction: Claws of Veeshan
	e.other:Faction(e.self,436,18); -- Faction: Yelinak
	e.other:Faction(e.self,448,-37); -- Faction: Kromzek
end
