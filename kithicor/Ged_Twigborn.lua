function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -500) then
			e.self:Say("Hello, " .. e.other:GetCleanName() .. ". What brings you to this neck of the woods? You must have heard of my expert tanning skills. I craft some of the finest skin garments this side of Highpass Hold.");
		else
			e.self:Say("I am sorry but I just would not feel comfortable helping you with that right now.  Maybe if you did more good deeds for the people of Kithicor Woods, I might reconsider.");
		end
	elseif(e.message:findi("garment")) then
		if(e.other:GetFactionValue(e.self) >= -500) then
			e.self:Say("Gloves are my specialty. I make four varieties; ratskin, wolfskin, bearskin, and my most sought after type, lionskin.");
		else
			e.self:Say("I am sorry but I just would not feel comfortable helping you with that right now.  Maybe if you did more good deeds for the people of Kithicor Woods, I might reconsider.");
		end
	elseif(e.message:findi("wolfskin glove")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("Wolfskin gloves?  Those will cost you 13 gold pieces and you need to bring me a high quality wolf skin as well.");
		else
			e.self:Say("I am sorry but I just would not feel comfortable helping you with that right now.  Maybe if you did more good deeds for the people of Kithicor Woods, I might reconsider.");
		end
	elseif(e.message:findi("bearskin glove")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Ah...  My bearskin gloves are the finest you will find anywhere.  They will cost you 25 gold pieces and you also need to give me a high quality bear skin before I can get to work.");
		else
			e.self:Say("I am sorry but I just would not feel comfortable helping you with that right now.  Maybe if you did more good deeds for the people of Kithicor Woods, I might reconsider.");
		end
	elseif(e.message:findi("lionskin glove")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Interested in the best, are you?  Well, it will cost you.  In addition to a high quality lionskin, I require payment of 96 gold pieces for me to craft you my exquisite lionskin gloves.  Search the northern plains of Karana for highland lions as their skins are the most supple.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("I know you are doing good for us here in Kithicor but I can only provide that kind of aid to heroes.  Keep up the good work and I may help you in the future.");
		else
			e.self:Say("I am sorry but I just would not feel comfortable helping you with that right now.  Maybe if you did more good deeds for the people of Kithicor Woods, I might reconsider.");
		end
	elseif(e.message:findi("ratskin glove")) then
		if(e.other:GetFactionValue(e.self) >= -500) then
			e.self:Say("Interested in some ratskin gloves, are you?  Well, before I can start, I need you to provide me a giant rat pelt and 6 gold pieces.  I need to make a living at this, after all...");
		else
			e.self:Say("I am sorry but I just would not feel comfortable helping you with that right now.  Maybe if you did more good deeds for the people of Kithicor Woods, I might reconsider.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text1 = "Wolfskin gloves, huh?  Very well, but I am still missing one of the things I require to make them.";
	local text2 = "Oh, I love working with fine bearskin!  But, if you want your gloves, you must give me the rest of the items I require.";
	local text3 = "Excellent choice!  My lionskin gloves are known throughout Norrath.  But before I can make them, I need both a high quality lion skin AND ninety-six gold pieces.";
	
	if(e.other:GetFactionValue(e.self) >= -500 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13054})) then --doesn't require gold like dialogue says
		e.self:Say("Ok! Let me see here.. Hmmm.. Oh, excellent.. Here you go. Some of my finest work, if I must say so myself.");
		e.other:Faction(e.self,269,2); -- kithicor residence
		e.other:Faction(e.self,302,1); -- protectors of the pine
		e.other:Faction(e.self,272,1); -- jaggedpine treefolk
		e.other:Faction(e.self,324,-1); -- unkempt druids
		e.other:QuestReward(e.self,0,0,0,0,2312,500);
	elseif(e.other:GetFactionValue(e.self) >= -100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13755,gold = 13},1,text1)) then
		e.self:Say("Ok! Let me see here.. Hmmm.. Oh, excellent.. Here you go. Some of my finest work, if I must say so myself.");
		e.other:Faction(e.self,269,2); -- kithicor residence
		e.other:Faction(e.self,302,1); -- protectors of the pine
		e.other:Faction(e.self,272,1); -- jaggedpine treefolk
		e.other:Faction(e.self,324,-1); -- unkempt druids
		e.other:QuestReward(e.self,0,0,0,0,2313,1000);
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13752,gold = 25},1,text2)) then
		e.self:Say("Ok! Let me see here.. Hmmm.. Oh, excellent.. Here you go. Some of my finest work, if I must say so myself.");
		e.other:Faction(e.self,269,2); -- kithicor residence
		e.other:Faction(e.self,302,1); -- protectors of the pine
		e.other:Faction(e.self,272,1); -- jaggedpine treefolk
		e.other:Faction(e.self,324,-1); -- unkempt druids
		e.other:QuestReward(e.self,0,0,0,0,2314,1500);
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13766,gold = 96},1,text3)) then
		e.self:Say("Ok! Let me see here.. Hmmm.. Oh, excellent.. Here you go. Some of my finest work, if I must say so myself.");
		e.other:Faction(e.self,269,5); -- kithicor residence
		e.other:Faction(e.self,302,1); -- protectors of the pine
		e.other:Faction(e.self,272,1); -- jaggedpine treefolk
		e.other:Faction(e.self,324,-1); -- unkempt druids
		e.other:QuestReward(e.self,0,0,0,0,2315,2000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
