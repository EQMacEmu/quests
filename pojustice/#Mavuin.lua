function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	local mavuinFlag = tonumber(qglobals["mavuin"]) or 0;
	
	if ( e.message:findi("hail") ) then 
	
		if ( mavuinFlag >= 2 ) then
			e.other:Message(0, "Mavuin tells you, 'So you have pleaded my case to the Tribunal, I am most thankful.  I hope that they will listen to my case soon and release me.  The knowledge that I promised you is this.  The followers in the Plane of Tranquility are trying to find information on what has happened to Zebuxoruk.  What I know is that he has been captured for a second time.  If you want to find out more information I believe you should seek an audience with Karana and Mithaniel Marr.  I can only assume that they were present at the time of his capture and know why this has taken place.  Also seek from Marr a way to translate the divine language.  Only with it can you understand the writing of the gods.  There is no more that I can tell you, but thank you once again for your attempt in returning my freedom.'");
			if ( mavuinFlag == 2 ) then
				eq.set_global("mavuin", "3", 5, "F");
			end
			e.other:Message(15, "You have received a character flag!");
			
		elseif ( mavuinFlag == 0 ) then
			e.other:Message(0, "Mavuin strains his eyes to look up at you in disbelief, then reaches down into a rusted vent and pulls out a journal.  'Please I implore you, take word to the Tribunal.  I have done nothing wrong, yet I have been sentenced to eternity in this cell.  I wish to present all of the [information] about my case to them.  They must listen to my plea if they are truly the gods of justice.'");
			
		elseif ( mavuinFlag == 1 ) then
			e.other:Message(0, "Mavuin tells you, 'Please it is the only hope that I live for.  Deliever me from this horrid fate.  Take word of my desire to plead my case before the Tribunal!'");			
		end

	elseif ( mavuinFlag <= 1 and e.message:findi("information") ) then
		e.other:Message(0, "Mavuin tells you, 'I know it has been said for years before me, and will be said for years after me, but I was truly framed for my crime.  You see the gods feared the knowledge that I carry with me.  So to prevent me passing this knowledge to others, it was set up to show that I had plotted to murder one of the other elders.  Please go before the tribunal and plead my case.  If you do this I will share what I know with you, I apologize for holding it against you, but I am desperate to be released.'");
		if ( mavuinFlag == 0 ) then
			eq.set_global("mavuin", "1", 5, "F");
		end
		e.other:Message(15, "You have received a character flag!");
	end

end
