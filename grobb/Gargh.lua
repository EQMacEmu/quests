function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You [friend of Gardunk]? Meez friend of Gardunk.");
	elseif(e.message:findi("friend.* gardunk")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Dat good. He tell meez you was comin'. Meez learn you to fight like alligator. Dominate through fear. Dat is what we do. Strike fear into heart of enemies. You [ready to start]?");
		else
			e.self:Say("Meez don't trust you.");
		end
	elseif(e.message:findi("ready to start")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Good. We start easy. Little froggies a good place. They our enemies. You go to da swamp and kill da tadpoles. Bring back to me four pieces of Froglok Tadpole Flesh. Strip da flesh from our enemies. Dat your first task.");
		else
			e.self:Say("Meez don't trust you.");
		end
	elseif (e.message:findi("animals")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("'We start with da rat. You go and kill rats. Tear da rat apart and bring me a Giant Rat Ear and a Giant Rat Pelt.");
		else
			e.self:Say("Meez don't trust you.");
		end
	elseif (e.message:findi("alligator")) then
		if(e.other:GetFactionValue(e.self) >= 100) then			
			e.self:Say("Best way to do dat is to fight alligators. You go out and fight da alligators in da swamp. Bring back to meez an alligator tooth and meez believe you.");
		else
			e.self:Say("Meez don't trust you.");
		end
	elseif (e.message:findi("training")) then
		if(e.other:GetFactionValue(e.self) >= 100) then			
			e.self:Say("For da next part of your training you go and strike fear into da hearts of da froggies again. Only not the little ones. You go and you drain da blood from one of da full grown ones. You bring meez back da Froglok Blood. Meez be waiting for you here if you make it back alive.");
		else
			e.self:Say("Meez don't trust you.");
		end
	elseif (e.message:findi("one more task")) then
		if(e.other:GetFactionValue(e.self) >= 100) then			
			e.self:Say("You is getting stronger. It time for you to venture out some and spread fear to other parts of da world. You go over to da Feerrott. There you find lots of lizard men. You go and spread fear to them. Fight them. You cut off their tails. Bring me four Lizard Tail.");
		else
			e.self:Say("Meez don't trust you.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if (e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13187, item2 = 13187,item3 = 13187,item4 = 13187},0)) then
		e.self:Say("You done good. You begin to know fear by causing fear. You learning about da animals. You learn about da animals by fighting dem and tearing them apart. You ready to [learn about da animals]?");
		e.other:Faction(e.self,237,1); -- Faction: Dark Ones
		e.other:Faction(e.self,308,1); -- Faction: Shadowknights of Night Keep
		e.other:Faction(e.self,251,-1); -- Faction: Frogloks of Guk
		e.other:QuestReward(e.self,0,0,0,0,7380,250); -- Item: Dark Ones Bracer
	elseif (e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13050, item2 = 13054},0)) then
		e.self:Say("So you know all about da rat now. Dat is good. Next step is important. You need to learn to [fight like da alligator].");
		e.other:Faction(e.self,237,2); -- Faction: Dark Ones
		e.other:Faction(e.self,308,1); -- Faction: Shadowknights of Night Keep
		e.other:Faction(e.self,251,-1); -- Faction: Frogloks of Guk
		e.other:QuestReward(e.self,0,0,0,0,7381,400); -- Item: Dark Ones Cap
	elseif (e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13725},0)) then
		e.self:Say("Ok meez believe you. Here your reward. Meez think you just about ready for [next part of your training].");
		e.other:Faction(e.self,237,6); -- Faction: Dark Ones
		e.other:Faction(e.self,308,1); -- Faction: Shadowknights of Night Keep
		e.other:Faction(e.self,251,-1); -- Faction: Frogloks of Guk
		e.other:QuestReward(e.self,0,0,0,0,7382,600); -- Item: Dark Ones Leggings
	elseif (e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 22524},0)) then
		e.self:Say("You did it! You cause lots of fear for them. Dat good. Even da spirits are starting to tremble. Soon you will be able to make dem do what you want. But there is [one more task] meez want you to do.");
		e.other:Faction(e.self,237,28); -- Faction: Dark Ones
		e.other:Faction(e.self,308,7); -- Faction: Shadowknights of Night Keep
		e.other:Faction(e.self,251,-4); -- Faction: Frogloks of Guk
		e.other:QuestReward(e.self,0,0,0,0,7383,1000); -- Item: Dark Ones Claw
	elseif (e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13354, item2 = 13354, item3 = 13354, item4 = 13354},0)) then
		e.self:Say("Meez impressed. Da spirits, they tremble in terror before you. Meez can't teach you no more. Go and dominate through fear. Fight like da alligator and tear your enemies apart.");
		e.other:Faction(e.self,237,10); -- Faction: Dark Ones
		e.other:Faction(e.self,308,2); -- Faction: Shadowknights of Night Keep
		e.other:Faction(e.self,251,-1); -- Faction: Frogloks of Guk
		e.other:QuestReward(e.self,0,0,0,0,7384,1000); -- Item: Dark Ones Leather
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
