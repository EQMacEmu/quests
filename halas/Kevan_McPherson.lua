function event_say(e)
	if (e.message:findi("hail")) then
		e.self:Say("Well met, " .. e.other:GetCleanName() .. "! I'm Kevan McPherson, the best darn smith in the north. Have ye come to purchase my finely crafted weapons or are ye wanting me ta teach ya the secrets of Northman smithing?");
	elseif(e.message:findi("northman smithing")) then
		e.self:Emote("takes a puff of an aromatic cigar and says, 'Our highly specialized Northman forge allows us to forge customized [Northman weapons] and [Northman kite shields]. If ye aren't still wet behind yer ears I'll show ya a thing or two. What's ye'r interest?");
		e.self:DoAnim(55);
	elseif(e.message:findi("northman weapon")) then
		e.self:Emote("puts his cigar out on the counter and says, 'All right, listen up, " .. e.other:GetCleanName() .. ". All Northman weapons require a flask of water and the appropriate blade molds. Long daggers and claymores need molds for the hilts and pommels, while battle axes and maces need oak shafts instead. Throwing axes, long daggers, and maces can be made from medium quality sheets of metal but claymores and battle axes require medium quality folded sheets of metal. If ye'r lookin ta make something really special ye'll need ta temper the blades with Frost Temper instead of Water, and find yerself a shaman to imbue an Ivory or Jade fer the pommel. Ye got all that, " .. e.other:GetCleanName() .. "?");
		e.self:DoAnim(5);
	elseif(e.message:findi("northman kite shield")) then
		e.self:Say("To smith a Northman kite shield ye'll need a kite shield mold, a smithy hammer, a flask of water and a medium quality folded sheet metal. Remember ye'll have ta smith the metal sheet in a regular forge and finish the shield in our special Northman forge.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade, e.text);
end
