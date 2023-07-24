function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Well met " .. e.other:GetCleanName() .. "! You'll have to excuse me if I do not look directly at you when I speak, my vision is all but completely gone in my old age. My eyes do not stray out of disrespect. I am Magistrate Glixx Tobbnokcog of the Loyalist Combine Empire. I am one of the handful of Loyalist to first arrive here on Luclin that are left. I am glad to have been able to live to see the city I helped plan and design become such a wonderful center of learning and wisdom. May the teachings of Tsaph Katta live forever due to the dedication of the people of Katta Castellum.");
	end
end
