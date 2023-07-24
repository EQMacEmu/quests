function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("salutes " .. e.other:GetCleanName() .. " crisply and gazes with dark eyes as unyielding as solid stone and as wise as the oldest mountains. 'Well met " .. e.other:GetCleanName() .. ". I am Magistrate Klandar Bronzebrow of the Loyalist Combine Empire. I pray that your stay here will be an enlightening one, you'll not find the prejudices here that are indicative to most cities and kingdoms. We of the Loyalist Combine follow the path of unity as taught by the great Tsaph Katta and all are welcome within our city gates that have purity of heart and clarity of thought.'");
	end
end
