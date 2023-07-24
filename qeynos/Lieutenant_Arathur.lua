function event_waypoint_arrive(e)
  if(e.wp == 12) then
    e.self:Say("Guard, stand up straight!");
    eq.signal(1002,1); -- NPC: Guard_Jerith
    eq.signal(1181,1); -- NPC: Guard_Dunix
  elseif(e.wp == 28) then
    e.self:Say("Guard, stand up straight!");
    eq.signal(1090,1); -- NPC: Guard_Beren
    eq.signal(1091,1); -- NPC: Guard_Corshin
  elseif(e.wp == 38) then
    e.self:Say("Guard, stand up straight!");
    eq.signal(1001,1); -- NPC: Guard_Mezzt
    eq.signal(1189,1); -- NPC: Guard_Phaeton
    eq.signal(1006,1); -- NPC: Guard_Cyrillian
    eq.signal(1174,1); -- NPC: Guard_Forbly
  end
end  

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. "!  Lieutenant Arathur Swelnik at your service.  I take great pride in keeping Qeynos safe and proper.  I also try to bring the word of [Mithaniel Marr] to the people of this fine city.");
	elseif(e.message:findi("marr")) then
		e.self:Say("Mithaniel Marr is the Lord of Valor and my personal source of power and inspiration.  You see, I was orphaned as a small child and raised by the Priests of Marr in [Freeport].  I have dedicated my life to protecting the innocent.  I now use the glorious powers that my faith in the Truthbringer has provided to help bring honor to the city of Qeynos.");
	elseif(e.message:findi("freeport"))then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Freeport is the city of my birth.  It is not what it once was, though.  Thugs and bandits patrol its streets.  My comrades in the Knights of Truth have managed to protect the northern parts of the city but I fear they are outnumbered and will soon have to flee Freeport altogether.  If it were not for my sworn duty here, I would join their noble [crusade].");		
		else
			e.self:Say("Hurmp!  You have not proven yourself loyal to Qeynos.  Begone!");		
		end
	elseif(e.message:findi("crusade"))then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("The Knights of Truth fight a never-ending battle against the corrupt and vicious Freeport Milita.  If you are going to Freeport, you might want to meet up with Knight Rolius and let him know you are a friend of Arathur.  They can always use another able body.");	
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("While you are a fine and loyal citizen, I simply cannot trust you with that information as yet.");
		else
			e.self:Say("Hurmp!  You have not proven yourself loyal to Qeynos.  Begone!");		
		end			
	elseif(e.message:findi("kane"))then
		e.self:Say("Commander Kane Bayle is the commander of all the Qeynos Guard.  He is second only to his brother, Antonius Bayle.  His post is in the guard house at the city gates.  Mind you, do not bother him, he has a bit of a temper.");		
	elseif(e.message:findi("circle.* unseen hand"))then
		e.self:Say("The Circle of the Unseen Hand?  I have heard nothing of them.  Are they some sort of performing magic troupe?");
	end
end