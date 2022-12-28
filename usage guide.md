This is just a short guide to get started with Waffle.

Get a name for your station (its just a RemoteEvent). In the Waffle folder, it will show up as waffle-(stationname).

Start out with:'

--

local stationName = "Whatever"
local waffle = require(game:GetService("ReplicatedStorage"):WaitForChild("Waffle"))

local station = waffle.New(stationName)

--

You now have a way to start communicating. When you cerate the station, it returns with itself.

Now use this:

--

waffle:ClientSay("hey client!", station, Any_LocalScript_Here)

or...

waffle:ServerSay("hey serverscript(s)!", station)

--

When using one of these, find the script you want to receive whatever you sent.
You should find it by using:

game.ReplicatedStorage:WaitForChild("WaffleStations"):WaitForChild(stationName).OnServerEvent(whatever) -- For ServerScripts
game.ReplicatedStorage:WaitForChild("WaffleStations"):WaitForChild(stationName).OnClientEvent(whatever) -- For LocalScripts

That's pretty much it. The only other function is waffle.Find(StationName), which just returns the station if it exists.

If you have other questions, message me on twitter @halocold.
