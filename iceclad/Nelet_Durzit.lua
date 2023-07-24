function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("sneezes and wipes his hand across his nose.  'H-h-h-i.'");
		e.self:DoAnim(52);
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(110060)) then
			eq.get_entity_list():GetMobByNpcTypeID(110060):Say("Nelet don't talk much anymore.  All this cold really gets to 'im.");
		end
	elseif(e.message:findi("cold")) then
		e.self:Emote("talks through clenched, chattering teeth.  'Y-y-yeah.  C-cursed cold.  Sh-sh-shot of gnomish pirate triple strength rum's all I need ta fix me up, Rendap tells me.  N-n-nilham lost it all, though.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30034}, 0)) then
		e.self:Emote("greedily swigs rum from the jug.  After a few drinks, he starts to gag and make faces.  'Oh, geez!  Rendap told me this stuff was strong but this tastes like clockwork grease!  It burns but now I feel - ugh.'  Nelet doubles over and passes out on the ground.  As he falls over, a small silver trinket slips out of his pocket.");
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(110060)) then
			eq.get_entity_list():GetMobByNpcTypeID(110060):Emote("points and laughs as Nelet falls over.  'That'll put hair on yer ears, boy.  Suck it up.  Least ya ain't shiverin' o' cold anymore, eh?'");
		end
		e.other:QuestReward(e.self,0,0,0,0,30033);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end