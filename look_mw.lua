-- look_simpleblue.lua drawing engine configuration file for Notion.

if not gr.select_engine("de") then return end

de.reset()

local FONT = "-*-fixed-medium-r-*-*-12-*-*-*-*-*-*-*"
--local FONT = "-*-magic-medium-r-*-*-12-*-*-*-*-*-*-*"

de.defstyle("*", {
    shadow_colour = "black",
    highlight_colour = "black",
    background_colour = "#0f1f4f",
    foreground_colour = "#9f9f9f",
    padding_pixels = 1,
    highlight_pixels = 0,
    shadow_pixels = 0,
    border_style = "elevated",
    font = FONT,
    text_align = "center",
})

local boring = "#300a00";
--local boringer = "#200500";
local boringer = "#150500";
local interesting = "#002a4f";

de.defstyle("frame", {
    based_on = "*",
    shadow_colour = "black",
    highlight_colour = "black",
    padding_colour = "black",
    background_colour = "black",
    foreground_colour = "#ffffff",
    padding_pixels = 0,
    highlight_pixels = 0,
    shadow_pixels = 0,
    de.substyle("active", {
        shadow_colour = "black",
        highlight_colour = "black",
        background_colour = "black",
        foreground_colour = "#ffffff",
    }),
})

de.defstyle("tab", {
    based_on = "*",
    font = FONT,
    de.substyle("active-selected", {
        shadow_colour = "black",
        highlight_colour = "black",
        background_colour = interesting,
        foreground_colour = "#cfcfcf",
    }),
    de.substyle("active-unselected", {
        shadow_colour = "black",
        highlight_colour = "black",
        background_colour = boring,
        foreground_colour = "#9f9f9f",
    }),
    de.substyle("inactive-selected", {
        shadow_colour = "black",
        highlight_colour = "black",
        background_colour = boring,
        foreground_colour = "#9f9f9f",
    }),
    de.substyle("inactive-unselected", {
        shadow_colour = "black",
        highlight_colour = "black",
        background_colour = boringer,
        foreground_colour = "#9f9f9f",
    }),
    text_align = "center",
})

de.defstyle("input", {
    based_on = "*",
    shadow_colour = "black",
    highlight_colour = "black",
    background_colour = boring,
    foreground_colour = "white",
    padding_pixels = 1,
    highlight_pixels = 0,
    shadow_pixels = 0,
    border_style = "elevated",
    de.substyle("*-cursor", {
        background_colour = "white",
        foreground_colour = boring,
    }),
    de.substyle("*-selection", {
        background_colour = "black",
        foreground_colour = "white",
    }),
})

de.defstyle("input-menu", {
    based_on = "*",
    padding_pixels=0,
})

dopath("lookcommon_clean")

de.defstyle("stdisp", {
    shadow_pixels = 0,
    highlight_pixels = 0,
    text_align = "left",
    foreground_colour = 'grey',
    background_colour = boringer,
    font = FONT,

    de.substyle("important", {
        foreground_colour = "green",
    }),

    de.substyle("critical", {
        foreground_colour = "red",
    }),
})


gr.refresh()

