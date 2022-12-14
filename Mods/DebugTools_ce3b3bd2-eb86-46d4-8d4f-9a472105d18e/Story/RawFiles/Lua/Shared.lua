local SpeedTestData = {}
local IgnoredState = {
	Paused = true
}

local currentTimes = {}

Ext.Events.GameStateChanged:Subscribe(function (e)
	local from = tostring(e.FromState)
	local to = tostring(e.ToState)
	if from == "Menu" and to == "StartLoading" then
		currentTimes[from] = nil
	end
	if from == "Running" then
		currentTimes[from] = nil
	end
	if IgnoredState[from] or IgnoredState[to] then
		return
	end
	currentTimes[to] = Ext.Utils.MonotonicTime()
	if currentTimes[from] then
		SpeedTestData[#SpeedTestData+1] = {
			From = from,
			To = to,
			Time = Ext.Utils.MonotonicTime() - currentTimes[from]
		}
	end
	currentTimes[from] = nil
	Ext.IO.SaveFile(string.format("Dumps/StateSpeeds_%s.json", Ext.IsClient() and "Client" or "Server"), Ext.Json.Stringify(SpeedTestData))
end)