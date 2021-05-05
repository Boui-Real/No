local copy = function(script)
	local copy
	if Clipboard ~= nil then
		copy = Clipboard.set
	elseif Synapse ~= nil then
		copy = function(str)
			Synapse:Copy(str)
		end
	elseif setclipboard ~= nil then	
		copy = setclipboard
	end
	copy(script)
end

copy(game:GetService("RbxAnalyticsService"):GetClientId())
