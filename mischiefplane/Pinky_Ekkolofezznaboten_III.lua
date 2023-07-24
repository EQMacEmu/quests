function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Knock knock.");
	elseif(e.message:findi("whos there") or e.message:findi("who there") or e.message:findi("there")) then
		e.self:Say("Will.");
	elseif(e.message:findi("will who")) then
		e.self:Say("Will you tell ME a knock knock joke?");
	elseif(e.message:findi("knock knock joke")) then
		e.self:Say("Here is a knock for ya! Har har har haaaarrr!!!");
		e.self:CastSpell(904,e.other:GetID()); -- Spell: Knockback
	end
end
