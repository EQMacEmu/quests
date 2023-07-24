function event_say(e)
	local qglobals = eq.get_qglobals(e.other);

	if ( e.message:findi("hail") ) then
	
		if ( qglobals.time or (qglobals.zebuxoruk == "2" and e.other:HasItem(29165)) ) then
			e.other:Message(0, "Maelin tells you, 'The Quintessence! Oh my this is amazing! I have come into contact with Chronographer Muon in the realm of innovation. Go to him, show him you have the power to activate machine. I shall meet you there, this I must see!'");
			
		elseif ( qglobals.zebuxoruk == "2" ) then
			e.other:Message(0, "Maelin tells you, 'As I have told you, you must retrieve the elemental essence from each elemental plane so that we can activate the machine in the Plane of Innovation that will open a portal into the shard of time that Zebuxoruk is held.'");
			
		elseif ( qglobals.cipher ) then
			e.other:Message(0, "Maelin tells you, 'Welcome back my friends.  I assure you that I have been studying the Cipher of Druzzil very diligently.  Did you happen to find any lore or information that I could look at?'");
			
		elseif ( qglobals.mmarr and qglobals.saryrn ) then
			e.other:Message(0, "Maelin tells you, 'Astounding, this truly is the Cipher of Druzzil!  I shall take notes from your knowledge and try to learn from it.  If you happen upon any artifacts that have writings in the language of the gods bring them back to me and I will do my best to read them to you in common tongue.'");
			eq.set_global("cipher", "1", 5, "F");
			e.other:Message(15, "You have received a character flag!");
			eq.delete_global("mmarr");
			eq.delete_global("saryrn");			
		else
			e.other:Message(0, "Maelin tells you, 'Welcome to Myrist!  This is truly something for me to be proud of.  All of the knowledge you can find here in this library is because of many years of hard work gathering data.  If you happen to come across any especially interesting information come bring it to me and I will try to catalogue it for the library.'");
		end
		
	elseif ( e.message:findi("lore") ) then

		if ( qglobals.zebuxoruk ) then
		
			if ( qglobals.zebuxoruk == "2" ) then
				e.other:Message(0, "Maelin tells you, 'As I have told you, you must retrieve the elemental essence from each elemental plane so that we can activate the machine in the Plane of Innovation that will open a portal into the shard of time that Zebuxoruk is held.'");
			elseif ( qglobals.zeks and qglobals.zeks == "7" ) then
				e.other:Message(0, "Maelin tells you, 'A parchment of Rallos'?  Let me read it, it says that Rallos was not alone in his feelings about mortals.  Solusek Ro also holds stake in the war to be led on Norrath.  Not only this but he is channeling power from his father's plane into his own.  He is taking that power and intensifying it through an artifact of great power, and then focusing it onto one point.  It is a detailed as a crystal that burns with all the powers of the plane of fire.  It is said to have the ability to turn the face of Norrath into a charred wasteland.  They plan for a manaetic behemoth to carry and deposit it upon Norrath.  You must stop these plans, you must stop Solusek!'");
			else
				e.other:Message(0, "Maelin tells you, 'Since we now know of the fate of Zebuxoruk I would suggest seeking those that could have had a hand in the planning and tactics of that situation.  The Zeks are especially gifted at things of this nature.  I would recommend trying to get any information from them that you can.'");
			end		
		else
			if ( qglobals.mmarr_book and qglobals.karana and qglobals.karana == "4" ) then
				e.other:Message(0, "Maelin tells you, 'This is quite interesting friends.  It is a detailed document on what has become of Zebuxoruk.  It seems that he had been tampering with translating works of the gods for mortals.  This knowledge was leading them to enlightenment and finally to ascention into dietyhood.  This angered the gods, for they felt that any diety should be chosen by them.  Ascension of any mortal was not something they were prepared to deal with.'");
				eq.set_global("zebuxoruk", "1", 5, "F");
				e.other:Message(15, "You have received a character flag!");
				eq.delete_global("mmarr_book");
				eq.delete_global("karana");
				
			elseif ( qglobals.mmarr_book or (qglobals.karana and qglobals.karana == "4") ) then
				e.other:Message(0, "Maelin tells you, 'What is this that you have found?  It appears to be written in the divine language.  Let me see, the writing on the front seems to indicate that it is some sort of journal of things already passed.  I cannot make heads or tails of the rest of it though, there must be another piece.'");
				
			else
				e.other:Message(0, "Maelin tells you, 'Come now, I don't see any new lore about you.  There is no reason to be dishonest with me.'");
			end
		end
		
	elseif ( e.message:findi("information") ) then

		if ( qglobals.zebuxoruk == "2" ) then
			e.other:Message(0, "Maelin tells you, 'As I have told you, you must retrieve the elemental essence from each elemental plane so that we can activate the machine in the Plane of Innovation that will open a portal into the shard of time that Zebuxoruk is held.'");
			
		elseif ( qglobals.zebuxoruk == "1" and qglobals.zeks == "7" ) then
			e.other:Message(0, "Maelin tells you, 'There is no way to escape from the prison that is The Plane of Time.  I am sorry but your quest for information ends here.  Time is something that none of us can escape.  That is however.. back when my explorations of the Planes were more common, I would travel searching for knowledge and lore to bring back to Tanaan.  I stumbled into the Plane of Innovation.  It was a great marvel to see indeed.  I found the creator of all things mechanical.  Meldrath the Marvelous was a kind and just gnome.  We spent many weeks together discussing all of his devices.  This included a machine that would allow you to open a tear into a period of time and enter into that time.  The machine was more of a flight of whimsy though as the power necessary to power such a machine was enormous.  He jokingly equated needing the very essence of the elements to power it.'");
			e.other:Message(0, "Maelin takes a deep breath and continues, 'I can see now that he was not joking at all.  Let us suppose that you travelers could venture into the Elemental Planes and retrieve this essence; and form it into one powerful conglomeration.  You could open a tear into the period of time before Zebuxoruk was imprisoned.  There is no way you can free him from his stasis now, but if you were to halt the Pantheon at the time of imprisonment.   Hah!  It could work I do believe.  Forgive me, but my old gnomish heart is alive with the excitement of possibilities.  Gather up your strength friends, travel into the deep elements.  You will need all of your wits about you.  Find the very essence of the elementals, and fuse them into one.  How to combine them I do not know, and can only wish you luck on finding that information.  If you can accomplish this please come get me.  I would like to record the events as they take place!'");
			eq.set_global("zebuxoruk", "2", 5, "F");
			e.other:Message(15, "You have received a character flag!");
			
		elseif ( qglobals.zeks ) then
		
			if ( qglobals.cipher ) then
			
				if ( qglobals.zeks == "7" ) then
					e.other:Message(0, "Maelin tells you, 'Now that we have learned what has been planned for Norrath, might I suggest that you try to obtain any lore that you can while traveling the planes?  I would like to learn from any history written in the divine language that you might come across.'");
					
				elseif ( qglobals.zeks == "6" ) then
					e.other:Message(0, "Maelin tells you, 'As I have already told you, Rallos must be stopped!  The war he plans to rage on Norrath could have devastating effects on not only that planet but all planes of existence!'");
					
				elseif ( qglobals.zeks == "5" ) then
					e.other:Message(0, "Maelin tells you, 'This cannot be.  You must hurry!  Rallos Zek seems to be planing a massive raid on Norrath.  He is tired of mortals overstepping their boundaries!  You are the only hope!  Go challenge Rallos, hurry!'");
					eq.set_global("zeks", "6", 5, "F");
					e.other:Message(15, "You have received a character flag!");
				end
			else
				if ( qglobals.zeks == "3" or qglobals.zeks == "4" or qglobals.zeks == "5" ) then
					e.other:Message(0, "Maelin tells you, 'Notes written in the language of the gods!  Unfortunately only one with the Cipher of Druzzil could translate these.  I do not know where this legendary cipher can be retrieved, but I wish you luck in finding it and bringing it to me.'");
				end
			end				
		end
	end
end
