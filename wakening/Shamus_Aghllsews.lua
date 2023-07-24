function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to my fiefdom, wayward " .. e.other:Race() .. ". I am Duke Shamus Aghllsews of the Tunarean Court. Only those who pledge friendship or membership to the Court are allowed sanctuary in the Wakening Lands.");
	elseif(e.message:findi("pledge friendship")) then
		e.self:Say("You must first prove your intentions to the Tunarean Court. I will permit you to participate in an oath of friendship only after you bring me four picks used by the Kromrif Laborers that are attempting to build into our lands.");
	elseif(e.message:findi("court")) then
		e.self:Say("The Tunarean Court is the name of the hierarchy of Tunares children that inhabit this region of Norrath. We adhere to the old ways of governing our peoples. The Koada'Dal and Feir'Dal have strayed from the old ways since the fall of Takish Hiz and the burning of their once great forest kingdom that has since become the deserts of Ro. As Duke of this court I am the highest ranking Tunarean outside the Plane of Growth.");
	end
end



function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 =30220,item2 =30220,item3 =30220,item4 =30220}, 0)) then
		e.self:Emote("grips your hand in his own and recites an oath in an ancient tongue. 'Should you ever seek membership in this court you are required to receive the support of its counts, countesses, barons, and baronesses. Should they deem you worthy you may present their crests to me and with my approval become a citizen of our kingdom. The Kromrif and Kromzek are persistent in their efforts to expand Kael into the forest of Tunare, they are a threat to all houses of the Tunarean Court. A Kromzek architect occasionally visits the building sites. I desire to acquire his blueprints for the expansion of Kael.'");
		e.other:Faction(e.self,449,20); -- tunarean court
		if(e.other:HasItem(17865)) then
			e.other:QuestReward(e.self,0,0,0,0,0,3500);
		else
			e.other:QuestReward(e.self,0,0,0,0,17865,3500);
		end
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 =30222}, 0)) then
		e.self:Say("You have my gratitude, " .. e.other:GetCleanName() .. ". With these blueprints we can better prepare the forests defenses against the giant invaders. I have yet another favor to ask of you as well. Fill this empty bag with crystallized sulfur. When mixed with the crushed herbs in the other bag it will create an explosion strong enough to destroy stone. Take the two full bags into Kael Drakkel and plant it into a crate of the kromzeks building supplies.");
		e.other:Faction(e.self,449,30); -- tunarean court
		e.other:QuestReward(e.self,{items = {17862,24860},exp = 3500}); -- empty sulfur collection bag, pouch of herbs
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 22855}, 0)) then
		e.self:Say("You have proven yourself to the Fauns of the Tunarean Court. The destruction of the Kromzeks building supplies will slow their progress for some time.");
		e.other:Faction(e.self,449,20); -- tunarean court
		e.other:QuestReward(e.self,0,0,0,0,24865,3500); -- crest of the fauns
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1095}, 0)) then
		e.self:Say("Welcome to the Tunarean Court, Thane " .. e.other:GetCleanName() .. "! Here is a signet ring to wear in honor of your status among the Tunareans.");
		e.other:Faction(e.self,449,50); -- tunarean court
		e.other:QuestReward(e.self,0,0,0,0,8950,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
