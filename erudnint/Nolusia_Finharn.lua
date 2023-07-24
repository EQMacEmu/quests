function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. "! Has Lanken sent you to see me? Are you a [visitor or citizen of Erudin]?");
	elseif(e.message:findi("visitor") or e.message:findi("moodoro")) then
		e.self:Say("Then, remember, inside the palace walls, never speak the names of those defilers who have passed on. I shall be at the Vasty Inn later tonight. I can answer your questions there.");
	elseif(e.message:findi("citizen")) then
		e.self:Say("Well, then, you should know better than to speak the names of defilers inside the palace walls! I must get back to my work, or I shall be late to the inn this evening.");
	elseif(e.message:findi("prexus")) then
		e.self:Say("Prexus is the Oceanlord. It is He who gave us the great oceans of our world. It is He who created the Vasty Deep, the most sacred of all waters.");
	elseif(e.message:findi("quellious")) then
		e.self:Say("Quellious the Tranquil has brought peace to the land. Within that peace we find and enter the hidden doorways of our minds.");
	end
end
