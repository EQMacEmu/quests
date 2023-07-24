function event_say(e)
	if(e.message:findi("hail") or e.message:findi("patty melt") or e.message:findi("grilled cheese sandwich") or e.message:findi("dryad pate")) then
		if(e.other:GetFaction(e.self) < 6) then
			if(e.message:findi("hail")) then
				e.self:Say("Whatchoo want?"); 
			elseif(e.message:findi("dryad pate")) then
				e.self:Say("You want my secret recipe for Nymph Pate? You don't look like you could even cook a [Patty Melt] without making a disgusting mess, let alone something as delicate and refined as Nymph Pate!");
			elseif(e.message:findi("patty melt")) then
				e.self:Say("Yeah, you know a patty melt! It's like a [Grilled Cheese Sandwich] with some meat stuck in between the whole mess. Sheesh, are you a vegetarian or something?");
			elseif(e.message:findi("grilled cheese sandwich")) then
				e.self:Say("Great Brell's gravy, you are inept aren't you! I'll say this slowly. You take some bread, then you take some cheese then you put them together and cook it with a frying pan! I'll tell you what, if you can manage to figure out how to make a Patty Melt, bring it back to me and if it's halfway edible I'll give you my recipe for Nymph Pate.");
			end
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFaction(e.self) < 6 and item_lib.check_turn_in(e.self, e.trade, {item1 = 8194}, 0)) then -- Hand-In: Patty Melt
		e.self:Emote("wolfs down the Patty Melt in one bite. 'Yeah, this isn't too bad I guess. Not nearly as good as I could have done though.'");
		e.self:Emote("scribbles on a piece of paper and hands it to " .. e.other:GetCleanName() .. ". 'Here is the recipe you wanted.'");
		e.other:QuestReward(e.self,0,0,0,0,18430); -- Elegant Pates
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
