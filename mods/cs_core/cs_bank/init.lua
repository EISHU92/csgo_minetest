bank = {
	team = {
		terrorist = {},
		counters = {},
		},
	ctl = {},
	playerst = {},
	player = {},

}
-- TABLE INSERTS
for banks, def in pairs(bank.team) do
	bank.playerst[banks] = {count = 0, players = {}}
	table.insert(bank.ctl, banks)
end
-- Add money to players when they join
minetest.register_on_joinplayer(function(player)
local playername={name=player:get_player_name()}
bank.player[playername.name] = {money = 200}
end)
minetest.register_on_leaveplayer(function(player)
local playere = player:get_player_name()  
bank.player[playere] = {money = nil}
end)
-- API
-- Drop money values of a player in variables; Variables: playerv.money
--[[
Usage:

**Copy Paste this code**

bank.place_values(player) -- Change `player` var to your player variable.

**Opcional**
playerv.money = player_money -- Change `player_money` to your preferred custom name for that var.

--]]
function bank.place_values(player)
playerv = {}
playerv.money = bank.player[player].money
end
function bank.return_val(player)
	if player and bank.player and bank.player[player] and bank.player[player].money then
		return bank.player[player].money
	end
end
-- Add money, can be added by killing or bounties
--[[
Usage:
**Copy Paste this code**

bank.player_add_value(player, amount) -- Change `amount` variable to a variable for this function ***MUST BE NUMERIC***


**Example:**

player = "Ryu" -- Name of player
amount = 10 -- Amount
bank.player_add_value(player, amount)



--]]
function CheckPlayer(name)
	for _, p in pairs(core.get_connected_players()) do
		local pname = p:get_player_name()
		if pname == name then
			return true
		end
	end
end


function bank.player_add_value(player, amount) 
	if CheckPlayer(player) and bank.player[player] then
		core.chat_send_player(player, core.colorize("#14FF14","You received $"..tostring(amount.."+")))
			if bank.player[player].money then
				bank.player[player].money = bank.player[player].money + amount
			end
	end
end
--Remove some values of a player, can be by buying some arms
function bank.rm_player_value(player, amount)
	if CheckPlayer(player) and bank.player[player] then
		--core.chat_send_player(player, core.colorize("#14FF14","Transactions: $"..tostring(amount.."-")))
		bank.player[player].money = bank.player[player].money - amount
	end
end
--[[
Removes money value from a player 
Usage:
**Copy Paste this code**

bank.rm_player_value(player, amount) -- Change `amount` variable to a variable for this function ***MUST BE NUMERIC***


**Example:**

player = "Ryu" -- Name of player
amount = 10 -- Amount
bank.rm_player_value(player, amount)



--]]
--Privs
minetest.register_privilege("bank", {
	description = "Bank value modifier.",
	give_to_singleplayer = true,
	give_to_admin = true,
})


-- Commands
minetest.register_chatcommand("add_value", {
	description = "Add a money value into yourself.",
	params = "<amount>",
	privs = {bank = true},
	func = function(name, param)
	bank.player_add_value(name, tonumber(param or 1))
	minetest.chat_send_player(name, "Added $" .. param or 1 .. " to your account.")
	end,
})
minetest.register_chatcommand("rm_value", {
	description = "Remove a money value from yourself.",
	params = "<amount>",
	privs = {bank = true},
	func = function(name, param)
	bank.rm_player_value(name, param or 1)
	end,
})






