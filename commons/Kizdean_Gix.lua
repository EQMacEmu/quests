function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("If you have business then out with it!! If not, then please be gone. I have little time to waste on chitchat!");
	elseif(e.message:findi("thex mallet")) then
		e.self:Say("The Thex Mallet is a very special weapon of elven creation. It is as ancient as Norrath itself. Queen Cristanos commands that we find it and return it to Loveal S'nez. That is all you need to know.");
	elseif(e.message:findi("utalk adarev otcin")) then
		e.self:Say("You speak the words of the Dead. You must be the assistance Loveal was to send. You must work quickly! Inside Befallen are the three pieces to the [Thex Mallet] which are to be returned to Loveal. Find Hubard L'rodd. He was my assistant. Give him this note and he should have information.");
		e.other:SummonCursorItem(18891); -- A Tattered Cloth Note
	end
end

function event_death_complete(e)
	if(math.random(100) < 15) then
		eq.unique_spawn(21141,0,0,3036,-706,-39,0); -- chance for Dragoon Zytl to spawn.
	end
end

-- EOF commons - Kizdean_Gix