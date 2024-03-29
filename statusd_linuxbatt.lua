-- statusd_linuxbatt.lua
--
-- Public domain
--
-- Uses the /proc/acpi interface to get battery percentage.
--
-- Use the key "linuxbatt" to get the battery percentage; use
-- "linuxbatt_state" to get a symbol indicating charging "+",
-- discharging "-", or charged " ".
--
-- Now uses lua functions instead of bash, awk, dc.  MUCH faster!
--
-- The "bat" option to the statusd settings for linuxbatt modifies which
-- battery we look at.

local defaults={
        update_interval=15*1000,
	bat=0,
        important_threshold=30,
        critical_threshold=10,
}
local settings=table.join(statusd.get_config("linuxbatt"), defaults)

local function readfile(fname)
	local fname = table.concat{"/sys/class/power_supply/BAT",tostring(settings.bat),"/",fname}
	local fd=io.open(fname)
	if not fd then return nil end
	local r=fd:read("*a")
	fd:close()
	return r
end


function get_linuxbatt()
	
	--local capacity = readfile('energy_full')
	local capacity = readfile('charge_full')
	--local remaining = readfile('energy_now')
	local remaining = readfile('charge_now')
	local statename = readfile('status')

	if capacity == nil or remaining == nil or statename == nil then
		return 0, "No battery"
	end

        local percent = math.floor(remaining * 100 / capacity)

        if string.find(statename, "Charging") ~= nil then
                return percent, "+"
        elseif string.find(statename, "Discharging") ~= nil then
                return percent, "-"
        else
                return percent, " "
        end
end

function update_linuxbatt()
	local perc, state = get_linuxbatt()
	statusd.inform("linuxbatt", tostring(perc))
	statusd.inform("linuxbatt_state", state)
        if perc < settings.critical_threshold
        then statusd.inform("linuxbatt_hint", "critical")
        elseif perc < settings.important_threshold
        then statusd.inform("linuxbatt_hint", "important")
        else statusd.inform("linuxbatt_hint", "normal")
        end
	linuxbatt_timer:set(settings.update_interval, update_linuxbatt)
end

linuxbatt_timer = statusd.create_timer()
update_linuxbatt()
