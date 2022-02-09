local SpeedTestData = {}
local IgnoredState = {
	Paused = true
}

local currentTimes = {}

Ext.RegisterListener("GameStateChanged", function(from, to)
	if from == "Menu" and to == "StartLoading" then
		currentTimes[from] = nil
	end
	if from == "Running" then
		currentTimes[from] = nil
	end
	if IgnoredState[from] or IgnoredState[to] then
		return
	end
	currentTimes[to] = Ext.MonotonicTime()
	if currentTimes[from] then
		SpeedTestData[#SpeedTestData+1] = {
			From = from,
			To = to,
			Time = Ext.MonotonicTime() - currentTimes[from]
		}
	end
	currentTimes[from] = nil
	Ext.SaveFile(string.format("Dumps/StateSpeeds_%s.json", Ext.IsClient() and "Client" or "Server"), Ext.JsonStringify(SpeedTestData))
end)