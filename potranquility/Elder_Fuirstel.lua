function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	
	if ( e.message:findi("hail") ) then

		if ( not qglobals.fuirstel or qglobals.fuirstel == "1" ) then
			e.other:Message(0, "Elder Fuirstel groans in agony.  His tainted breath surrounds your face.");
			
		elseif ( qglobals.fuirstel == "2" or qglobals.fuirstel == "3" ) then
			e.other:Message(0, "Elder Fuirstel slowly turns towards you.   You can feel the heat radiating from his face.  The warding that envelopes your body reaches out and begins to surround him. You immediately see improvement in his condition.  The pus filled sores covering his face and his burning fever start to vanish.  'Thank you friend.  I no longer feel the touch of death on my soul.  However I do feel the grasp on Bertoxxulous, his plague is still upon me but not spreading throughout my body.  I fear the only way to remove this pox would be to weaken Bertoxxulous enough that his curse would be lifted.  I now renounce my faith in Bertoxxulous, please fell this god so that I may continue and learn from my mistakes.'");
			if ( qglobals.fuirstel == "2" ) then
				eq.set_global("fuirstel", "3", 5, "F");
			end
			e.other:Message(15, "You have received a character flag!");
			
		elseif ( qglobals.fuirstel == "4" or qglobals.fuirstel == "5" ) then
			e.other:Message(0, "Elder Fuirstel tells you, 'Welcome back friend.  I must tell you that my brother and I shall never forget what you have done for us.  We have since renounced our following of Bertoxxulous, for in him we only found suffering.  We have joined a new following, learning from the gods without their direct influence over us.  I shall not keep you though, thank you once again!'");
			if ( qglobals.fuirstel == "4" ) then
				eq.set_global("fuirstel", "5", 5, "F");
			end
			e.other:Message(15, "You have received a character flag!");
		end
	end
end
