function event_say(e)
	if(e.other:GetFactionValue(e.self) >= 0) then	
		if(e.message:findi("hail")) then
			e.self:Say("I am Vilissia, chosen of Solusek Ro.  I am a practitioner in the wizardly arts, and keeper of lore for the [runescale cloak], [Tishan's kilt] and the [acumen mask].");
		elseif(e.message:findi("runescale cloak")) then
			e.self:Say("The Runescale cloak is a wonderful item of defense for any wizard.  Are you [interested] in the [cloak]?");
		elseif(e.message:findi("interested.* cloak")) then
			e.self:Say("I can assemble for you a runescale cloak, but I will need you to bring me the necessary components.  I will need a lizardscale cloak from the temple of Cazic-Thule and the three Runes of Scale.  All three can be found on crocodiles - saltwater crocodiles in the caverns of Guk, deepwater crocodiles in the Oasis of Marr and firescale crocodiles in the mountains of Lavastorm.  Bring me these items, and I will make you a runescale cloak.");
		elseif(e.message:findi("acumen mask")) then
			e.self:Say("The acumen mask, as its name suggests, confers to its wearer certain powers of insight and knowledge.  Are you [interested] in obtaining a [mask]?");
		elseif(e.message:findi("interested.* mask")) then
			e.self:Say("I can make an acumen mask for you, but you will need to bring me the proper components.  I will need a glowing mask from a skeletal monk in the caverns of Guk, a patch of Shadow from our mortal enemies, the shadowed men, a darkbone Skull from a darkbone skeleton in the Estate of Unrest, and a bonechipped mask from a goblin headmaster in the Ocean of Tears.  Bring me these four items, and I will make for you an acumen mask.");
		elseif(e.message:findi("tishan.* kilt")) then
			e.self:Say("Tishan was once counted among the mightiest of wizards, and his items are items of power.  If you are interested in acquiring Tishan's kilt, you must take a shadowed ball from our mortal enemies, the shadowed men, and bring it to Trankia in the Everfrost Mountains.");
		end
	else
		e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Solusek Ro does not believe in half measures.";

	if(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 2352,item2 = 2367,item3 = 2368,item4 = 10558},1,text)) then
		e.self:Say("Mask, patch, skull and mask. All of the items necessary for me to make an acumen mask.  Excellent.  All praise Solusek Ro!");
		e.other:Faction(e.self,415,10,0); -- Faction: Temple of Sol Ro
		e.other:Faction(e.self,416,-1,0); -- Faction: Shadowed Men
		e.other:QuestReward(e.self,0,0,0,0,2366,1000); -- Acumen Mask
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 10000, item2 = 10035, item3 = 10035},1,text)) then 
		e.other:Say("Here is your prize - a lambent ruby.");
		e.other:Faction(e.self,415,1,0); -- Faction: Temple of Sol Ro
		e.other:Faction(e.self,416,-1,0); -- Faction: Shadowed Men
		e.other:QuestReward(e.self,0,0,0,0,10118,1000); -- Lambent Ruby
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 2332, item2 = 10553, item3 = 10554, item4 = 10555},1,text)) then 
		e.other:Say("You impress me, adventurer! I had not expected you to return with all of the runes. Very well, I shall keep my half of the bargain. Here is your Runescale Cloak.");
		e.other:Faction(e.self,415,10,0); -- Faction: Temple of Sol Ro
		e.other:Faction(e.self,416,-1,0); -- Faction: Shadowed Men
		e.other:QuestReward(e.self,0,0,0,0,2364,1000); -- Runescale Cloak
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 16507})) then 
		e.other:Say("I see that Gavel has sent you to me.  Very well, I have vulcanized your platinum bar - take it.");
		e.other:QuestReward(e.self,0,0,0,0,19048,1000); -- Vulcanized Platinum Bar
	end	
	item_lib.return_items(e.self, e.other, e.trade)
end
