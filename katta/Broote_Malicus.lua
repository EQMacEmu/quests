function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. "! I am Magistrate Broote Malicus of the Loyalist Combine Empire. Have you come to me to learn of the Vah Shir or for another matter?");
	elseif(e.message:findi("come to learn")) then
		e.self:Say("The Vah Shir are a noble and honorably race who were displaced from their previous homeland to the moon of Luclin. The details of the means and cause of their arrival is hazy but it seems that unlike our ancestors of the Combine Empire it was not an intentional sojourn. When the Vah Shir arrived their society was thrust into disarray and they had to rebuild from the rubble of their previous glory. The Vah Shir shaman were no longer able to contact the spirits they had been so familiar with back in their former homeland much like my own [ancestors].");
	elseif(e.message:findi("ancestors")) then
		e.self:Say("I come from a long lineage of practitioners of traditional shamanism. When my ancestors first arrived on Luclin the spirits they were familiar with and had contacted for their rituals for so many years were unreachable. Eventually a relationship was formed with the spirits native to Luclin and our shamanistic traditions were restored, albeit with slight modifications due to dealing with previously foreign spirits. The shaman that resided here in Katta Castellum were able to assist the Vah Shir spiritists in becoming familiar with the native spirits so that their traditions too could be restored. In exchange for the aid of the Loyalist Combine Empire the Vah Shir taught us the ways of the Beastlord, a path which I now follow as did my father and his father before him.");
	end
end
