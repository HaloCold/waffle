--[[

Waffle: Version 0.9.1-alpha

[ Credits, Downloads, More: https://shhnotrightnow.xyz/waffle ]

]]

local waffle = {}

local currentStations = {}

function waffle.New(stationName)
  if not stationName:IsA("String") then
    print("[Waffle:err]: StationName must be a string (waffle.New function)")
  end
  if stationName:IsA("String") then
    local stationInstance = Instance.new("RemoteEvent")
    stationInstance.Name = "waffle-"..StationName
    table.insert(currentStations, stationInstance)

    if game.ReplicatedStorage:FindFirstChild("WaffleStations") then
      stationInstance.Parent = ReplicatedStorage:WaitForChild("WaffleStations")
    else
      local stationsFolder = Instance.new("Folder")
      stationsFolder.Name = "WaffleStations"
      stationsFolder.Parent = game.ReplicatedStorage

      stationInstance.Parent = stationsFolder
    end
    return stationInstance
  end
end

function waffle:Find(StationName)
  local result = table.find(currentStations, StationName)
  if result then
    return result
  end
end

-- waffle.ClientSay(any, station(from waffle.New), sendTo(LocalScript)

function waffle.ClientSay(any, station, sendTo)
  if game.ReplicatedStorage:FindFirstChild(station) and table.find(currentStations, station) then
    station:FireClient(sendTo, any)
    return true
  else
    return false
  end
end

-- waffle.ServerSay(any, station(from waffle.New), sendTo(LocalScript)

function waffle.ServerSay(any, station)
  if game.ReplicatedStorage:FindFirstChild(station) and table.find(currentStations, station) then
    station:FireServer(any)
    return true
  else
    return false
  end
end
