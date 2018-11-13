local activeProjectIndex = 0
local sectionName = "com.pandabot.DrumsControl"

local kickIndexKey = "kickIndex"
local snareIndexKey = "snareIndex"
local hihatIndexKey = "hihatIndex"
local rideIndexKey = "rideIndex"

local defaultKickIndex = 1
local defaultSnareIndex = 1
local defaultHihatIndex = 1
local defaultRideIndex = 1

--

local function setValue(key, value)
  reaper.SetProjExtState(activeProjectIndex, sectionName, key, value)
end

local function getValue(key, defaultValue)

  local valueExists, value = reaper.GetProjExtState(activeProjectIndex, sectionName, key)

  if valueExists == 0 then
    setValue(key, defaultValue)
    return defaultValue
  end

  return value
end

--

local function getTableFromString(arg)

  local output = {}

  for match in arg:gmatch("([^,%s]+)") do
    output[#output + 1] = match
  end

  return output
end

local function setTableValue(key, value)
  reaper.SetProjExtState(activeProjectIndex, sectionName, key, table.concat(value, ","))
end

local function getTableValue(key, defaultValue)

  local valueExists, value = reaper.GetProjExtState(activeProjectIndex, sectionName, key)

  if valueExists == 0 then
    setTableValue(key, defaultValue)
    return defaultValue
  end

  return getTableFromString(value)
end

--[[ ]]--


function getKickIndex()
  return tonumber(getValue(kickIndexKey, defaultKickIndex))
end

function setKickIndex(arg)
  setValue(kickIndexKey, arg)
end

function getNumberOfKicks()
  return 1
end

--

function getSnareIndex()
  return tonumber(getValue(snareIndexKey, defaultSnareIndex))
end

function setSnareIndex(arg)
  setValue(snareIndexKey, arg)
end

function getNumberOfSnares()
  return 2
end

--

function getHihatIndex()
  return tonumber(getValue(hihatIndexKey, defaultHihatIndex))
end

function setHihatIndex(arg)
  setValue(hihatIndexKey, arg)
end

function getNumberOfHihats()
  return 5
end

--

function getRideIndex()
  return tonumber(getValue(rideIndexKey, defaultRideIndex))
end

function setRideIndex(arg)
  setValue(rideIndexKey, arg)
end

function getNumberOfRides()
  return 3
end
