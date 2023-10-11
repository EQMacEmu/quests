function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ranjor tell shaddernites to gets rids of spore guardian.  Ha!  Gud.");
	elseif(e.message:findi("minstrel")) then
		e.self:Say("Dere stewpid skeleton singing by Basher Ganbaku. His post be up high.");
		eq.unique_spawn(52126,0,0,-107,194,46.6,64); -- NPC: ##a_skeleton		
	elseif(e.message:findi("armor")) then
		e.self:Say("Chain, plate, leather, Krung's Clubs and Junk inside you will find.  Grobb, in the center it be.");
	elseif(e.message:findi("warrior guild")) then
		e.self:Say("Da bashers warriors of Grobb close to entrance they be.");
	elseif(e.message:findi("supplies")) then
		e.self:Say("Entrance toward the front and right.  Gunthak's Belch inside you will find.");
	elseif(e.message:findi("bank")) then
		e.self:Say("Back, back to the rear, bank you will find.");
	elseif(e.message:findi("tavern")) then
		e.self:Say("Gunthak's Belch toward entrance.");
	elseif(e.message:findi("food")) then
		e.self:Say("If hungry you be Gunthak's Belch to entrance and side you will find.");
	elseif(e.message:findi("shaman guild")) then
		e.self:Say("Shaman of Grobb called the Darkones.  Back towards Carver is where you will find.");
	elseif(e.message:findi("darkone")) then
		e.self:Say("The Darkones to the back found are they.  Shaman of Grobb they be.");
	elseif(e.message:findi("inn") or e.message:findi("rest") or e.message:findi("sleep")) then
		e.self:Say("Rocks and ground upon which you will lay.  No inn inside Grobb you will find.");
	elseif(e.message:findi("shadowknight guild")) then
		e.self:Say("Shadowknights of Knightkeep guild of shadowknights they be.  To the side and middle is where you find.");
	end
end