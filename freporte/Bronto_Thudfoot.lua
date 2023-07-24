function event_say(e)
	local fac = e.other:GetFaction(e.self);

	if(e.message:findi("hail") and (fac <= 5)) then
		e.self:Say("How ya doin', bub? Seein' as how you just joined the conversation, I think you need to buy us a round!");		
	elseif(e.message:findi("hail") and (fac > 5)) then
		e.self:Say("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.");
	elseif(e.message:findi("blue beast")) then
		e.self:Say("The Blue Beast is our ship. It is most likely the fastest ship sailing the seas of Norrath. It is a design all my own. Lenka says it is best to anchor it far from shore to keep the rogues from it.")
	elseif(e.message:findi("Lenka")) then
		e.self:Say("Lenka Stoutheart is my friend. She is of barbarian blood. If it were not for her, I would never have survived [Guk]. After Guk, we made a quick alliance and have traveled the world of Norrath aboard the [Blue Beast].")
	elseif(e.message:findi("Guk")) then
		e.self:Say("In the swamps of Innothule, you will find the kingdom of the frogloks, Guk. It was in Guk that Lenka and I met. Side by side, we fought the hordes of living frogloks to find a world of undead frogloks and much treasure.")
	elseif(e.message:findi("rogue")) then
		e.self:Say("I had quite a bit of grog that night and it was very dark. What I do remember was seeing a tall woman in a dress run from the docks. She sort of smelled, too. Like fish. I know it was the docks, but this woman had a real stench to her. Like dried fish baking in the sun. That is all I remember. It was too dark to see anything but her [silhouette].")
	elseif(e.message:findi("silhouette")) then
		e.self:Say("Yeah! The silhouette looked like a very brawny woman. It had to be a woman. The silhouette was surely that of one with a short skirt and long hair.")																																														
	end
end

function event_signal(e)
	e.self:Say("You said it, boss!  Stay clear of taking sides and you should be just fine, young one.");
end
