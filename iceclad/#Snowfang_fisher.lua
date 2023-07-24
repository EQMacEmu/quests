function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Furless one wants something with snowfang? You here to help with curse?");
	elseif(e.message:findi("curse")) then
		e.self:Emote("growls as the other fisher-gnolls bark at the mention of the curse.  'Some days ago we found flat, strong, stretchy thing.  Many scribbles, many marks on it.  Ever since fish not come to us...  Rest of the snowfang think this is bad magic.  To not believe this is foolish.  But I not able to just get rid of bad magic.'");
	elseif(e.message:findi("bad magic")) then
		e.self:Say("To cast away is not something we can do. Snowfang believe bad magic thrown away just make worse magic. Only way to get rid of badness is for friend to bring gift offering. Offering that means much to snowfang. If that is done magic is broken by the giving.");
	elseif(e.message:findi("offering")) then
		e.self:Say("Offering must be true and strong. To trade for anything else would be an insult to the spirits. If you want you can bring me true strong wooden pole and fine string for new pole. That would be true strong gift and maybe enough to break bad evil on this thing we find.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30295,item2 = 30296})) then
		e.self:Emote("sniffs the offering and seems to relax.  'Very good, very worthy.   You take this magic thing, with you maybe this evil is broken.'  Before he can hand you the parchment a roar explodes from the ocean and a gigantic dark shadow slams into the ice floe.");
		eq.spawn2(110014,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),128);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
