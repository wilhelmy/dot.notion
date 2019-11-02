--
-- Notion main configuration file
--
-- This file only includes some settings that are rather frequently altered.
-- The rest of the settings are in cfg_notioncore.lua and individual modules'
-- configuration files (cfg_modulename.lua). 
--
-- When any binding and other customisations that you want are minor, it is 
-- recommended that you include them in a copy of this file in ~/.notion/.
-- Simply create or copy the relevant settings at the end of this file (from
-- the other files), recalling that a key can be unbound by passing 'nil' 
-- (without the quotes) as the callback. For more information, please see 
-- the Notion configuration manual available from the Notion Web page.
--

-- Set default modifiers. Alt should usually be mapped to Mod1 on
-- XFree86-based systems. The flying window keys are probably Mod3
-- or Mod4; see the output of 'xmodmap'.
META="Mod4+"
ALTMETA="Mod4+Shift+"

-- Terminal emulator
--XTERM="urxvtcd" -- urxvtd crashes sometimes, killing all terminal windows :'(
XTERM="urxvt"

-- Some basic settings
ioncore.set{
    -- Maximum delay between clicks in milliseconds to be considered a
    -- double click.
    --dblclick_delay=250,

    -- For keyboard resize, time (in milliseconds) to wait after latest
    -- key press before automatically leaving resize mode (and doing
    -- the resize in case of non-opaque move).
    --kbresize_delay=1500,

    -- Opaque resize?
    --opaque_resize=false,

    -- Movement commands warp the pointer to frames instead of just
    -- changing focus. Enabled by default.
    --warp=true,
    
    -- Margin to use when warping the cursor (in pixels),
    -- to inset from the edge of the frame.
    --warp_margin=5,

    -- Placement to use when positioning the cursor in the frame
    -- (as a factor from 0-1).
    -- Where an x,y value:
    -- * (0.0, 0.0) for top-left.
    -- * (1.0, 1.0) for bottom-right.
    -- * (0.5, 0.5) for the center of the frame.
    warp_factor_x=0.5,
    warp_factor_y=0.5,

    -- Float window placement method:
    -- one of 'udlr' (up down left right), 'lrud' (left right up down), 'pointer' or 'random'.
    --float_placement_method="udlr"

    -- Float non-transient dialog type windows.
    -- Can be useful for applications that try to place their own dialog windows.
    window_dialog_float=true,

    -- Switch frames to display newly mapped windows
    --switchto=true,
    
    -- Default index for windows in frames: one of 'last', 'next' (for
    -- after current), or 'next-act' (for after current and anything with
    -- activity right after it).
    --frame_default_index='next',
    
    -- Auto-unsqueeze transients/menus/queries.
    --unsqueeze=true,
    
    -- Display notification tooltips for activity on hidden workspace.
    --screen_notify=true,
    
    -- Automatically save layout on restart and exit.
    --autosave_layout=true,
    
    -- Mouse focus mode; set to "sloppy" if you want the focus to follow the 
    -- mouse, and to "disabled" otherwise.
    --mousefocus="sloppy",
  
    -- Controls Notion's reaction to stacking requests sent by clients. Set to
    -- "ignore" to ignore these requests, and to "activate" to set the activity
    -- flag on a window that requests to be stacked "Above".
    window_stacking_request="activate",

    -- Time (in ms) that a window has to be focussed in order to be added to the
    -- focus list. Set this to <=0 (or comment it out) to disable the logic, and
    -- update the focus list immediately.
    focuslist_insert_delay=60000,

    -- If enabled, activity notifiers are displayed on ALL the screens, not just
    -- the screen that contains the window producing the notification. This is
    -- only relevant on multi-head setups. By default this is disabled.
    activity_notification_on_all_screens=true,

    -- If enabled, a workspace indicator comes up at the bottom-left of the
    -- screen when a new workspace is selected. This indicator stays active for
    -- only as long as indicated by this variable (in ms). Timeout values <=0
    -- disable the indicator altogether. This is disabled by default.
    workspace_indicator_timeout=1000,
}

--
-- Notion default settings
--

-- Load configuration of the Notion 'core'. Most bindings are here.
dopath("cfg_notioncore")

-- Load some kludges to make apps behave better.
dopath("cfg_kludges")

-- Define some layouts. 
dopath("cfg_layouts")

-- Load some modules. Bindings and other configuration specific to modules
-- are in the files cfg_modulename.lua.
dopath("mod_query")
dopath("mod_menu")
dopath("mod_tiling")
--dopath("mod_statusbar")
dopath("mod_dock")
dopath("mod_sp")
dopath("mod_notionflux")
dopath("mod_xrandr")

--
-- Common customisations
--

-- Uncommenting the following lines should get you plain-old-menus instead
-- of query-menus.

--defbindings("WScreen", {
--    kpress(ALTMETA.."F12", "mod_menu.menu(_, _sub, 'mainmenu', {big=true})"),
--})
--
--defbindings("WMPlex.toplevel", {
--    kpress(META.."M", "mod_menu.menu(_, _sub, 'ctxmenu')"),
--})

function ls(scope)
	local t={}
	for k,v in pairs(scope) do
		table.insert(t,k)
		table.insert(t," ")
	end
	return table.concat(t)
end
