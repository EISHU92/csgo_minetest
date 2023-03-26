local modpath = core.get_modpath(minetest.get_current_modname())



-- Core 1 Dofiles

version = "V1-ALPHA"
--Initial core settings:
dofile(modpath.."/clua_registering.lua")
--Cores
--dofile(modpath.."/core3.lua") -- 3ND CORE --- Player Customise
dofile(modpath.."/core1.lua") -- Primary Core

--Core1 dofiles
dofile(modpath.."/cooldown.lua") -- CoolDown MINI-API
dofile(modpath.."/api.lua") -- API
dofile(modpath.."/l_j.lua") -- Leave/Join.
dofile(modpath.."/callbacks.lua") -- Callbacks

--clua.throw("Bad Argument to option `2`: Expected number, got NIL")

-- Second Core
dofile(modpath.."/core2.lua") -- Secondary Core
dofile(modpath.."/on_match.lua")
dofile(modpath.."/central_memory.lua") -- Auto fixer
dofile(modpath.."/hand.lua")
dofile(modpath.."/c4_api.lua")
dofile(modpath.."/bomb.lua")
dofile(modpath.."/formatter.lua")

--Third Core
dofile(modpath.."/core3.lua")

dofile(modpath.."/alias.lua") -- Aliases


--MODS in core
dofile(modpath.."/cs_match/init.lua")
dofile(modpath.."/cs_timer/init.lua")


--Some functions
clua.start_luat(core.get_modpath(minetest.get_current_modname()), "core")