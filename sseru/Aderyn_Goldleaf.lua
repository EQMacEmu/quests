-- Jeweled Quiver of the Hand

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ". I am a Ranger of Seru. There are not many that follow our ways within the city, as there is only limited need for us. Tracking is an invaluable tool at times though so our ways continue to be passed on. There is no way that [Katta] Castellium can match our tracking skills. What are you look... ah, I see you are eyeing my quiver. It is the Jeweled Quiver of the Hand. It is given to each ranger that is in the Hand's Ranks. ");
	elseif(e.message:findi("katta")) then
		e.self:Say("Katta Castellium is a dreary place. To show how vile it is, they have vampyres living within the city! My point though, is that they would easily spot one of us entering their city. You are just right. They would not question one from Norrath. If you with to prove your worth and earn your own Quiver go to Katta. Galren Fuzzytoes is know to us to be a spy, but we can never catch him. Surely it will be easier to find him within his own city. Defeat him, and retrieve any report that he is taking back to their Governors.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29892}, 0)) then
		e.self:Say("You actually did it? You have done an invaluable service ridding us of that wretched little halfing. You deserve to be a soldier in Seru's army. Take this Quiver with my regard, " .. e.other:GetCleanName() .. ".");
		e.other:Faction(e.self,1485,30); -- eye of seru
		e.other:Faction(e.self,1484,-3); -- hand of seru
		e.other:Faction(e.self,1486,-3); -- heart of seru
		e.other:Faction(e.self,1483,1); -- seru
		e.other:Faction(e.self,1542,-3); -- haven smugglers
		e.other:Faction(e.self,1503,-3); -- validus custodus
		e.other:Faction(e.self,1504,-7); -- magus conlegium
 		e.other:QuestReward(e.self,0,0,0,0,17120,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
