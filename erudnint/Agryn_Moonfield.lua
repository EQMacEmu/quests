function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the Bank of Erudin. I am Agryn, the bank manager. How may I be of service to you?");
	elseif(e.message:findi("guild coin")) then
		e.self:Say("If you do not have your guild coin, you must go and ask the guildmaster for one.")
	elseif(e.message:findi("vasty deep water")) then
		e.self:Say("You must have been sent by one of the guilds. All you need to do is give me your guild coin and I shall exchange it for the Vasty Deep water.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13989})) then
		e.self:Say("Ah!! A Peacekeeper. I have some Vasty Deep water sitting out already. Here you are. Do not let it fall into the wrong hands.");
		e.other:QuestReward(e.self,0,0,0,0,13939,100); -- Item: Clear Water
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
