-- Frundle Frenkler - vial of velium vapors

function event_say(e)
	if (e.other:GetFaction(e.self) < 6) then
		if(e.message:findi("velium vapor")) then
			e.self:Say("Ahh, you come seeking my family recipe? After all you've done for our people it's the least I can do. First you must fashion a velium vial, then combine the vial with two small pieces of velium in this jar. That's all there is to it. Please keep the recipe a secret.");
			e.other:SummonCursorItem(17513); -- Item: Velium Purifier
		elseif(e.message:findi("velium vial")) then
			e.self:Say("I'm no potter mind you, but if I remember correctly it's a small brick of velium, three crystalline silks, and two glass shards. Then you'll have to finish up by firing it in a kiln with a high quality firing sheet.");
		end
	elseif(e.other:GetFaction(e.self) > 5) then
		if(e.message:findi("velium vapor") or e.message:findi("velium vial")) then
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	end
end
