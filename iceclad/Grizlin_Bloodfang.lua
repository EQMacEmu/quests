function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Lo outlander. Grizlin weaponsmaker for tribe. Make mighty blade from bone. Very important now.. need make many spear for hunter. Not make spear, then hunter not bring meat. Now my friend Keref sad, his pack gone north and Keref alone. Want to find way to help Keref but must make weapon for tribe. Maybe you go find what Keref need to make happy?");
	elseif(e.message:findi("harpoon")) then
		e.self:Say("Ahh, Harpoon hard to make. Grizlin need many thing to make true harpoon. Will need strong staff, strong bone, strong rope.");
	elseif(e.message:findi("strong staff")) then
		e.self:Say("Good staff always properly carved with totem and rune. Strong and mighty, very good for harpoon making. Not make in many moons here. All wood kept for fire. Perhaps find among outland gnoll tribe where wood is plentiful");
	elseif(e.message:findi("bone")) then
		e.self:Say("Mightiest bone come from whale. Very strong, very powerful. Yes, bone of mighty whale make very strong blade. Good for harpoon.");
	elseif(e.message:findi("strong rope")) then
		e.self:Say("Not know where find strong rope. For mighty harpoon, need very strong bone or harpoon break rope too much. Maybe furless ones with steel canoe have mighty rope.");
	end
 end

 function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 6310,item2 = 30050,item3 = 30049})) then
		e.self:Say("Yes, these good.'  He forges the items into a finely crafted harpoon. Grizlin holds the weapon up and inspects it for a moment. 'Yes, this fine weapon. This hero weapon! Groumshak have harpoon much like this. May it bring much food for your pack, furless one.'  He hands you the harpoon with a nod of his head.'");
		e.other:Faction(e.self,439,1); -- Faction: Snowfang Gnolls
		e.other:Faction(e.self,431,-1); -- Faction: Ulthork
		e.other:QuestReward(e.self,0,0,0,0,30052,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
 
