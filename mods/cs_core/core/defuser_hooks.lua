timerd = 0
pnts = tonumber(defuser_hooks_wait)
pnts2 = tonumber(defuser_hooks_wait2)
function defuser_hooks(timedd)
	timerd = timerd + timedd
	if timerd >= 1 then
		if ask_for_bomb and ask_for_bomb() then
			if c4.planted then
				for playerr in pairs(csgo.team.counter.players) do
					if vector.distance(Player(playerr):get_pos(), c4.pos) >= 1 and vector.distance(Player(playerr):get_pos(), c4.pos) <= 2 then
						local player = Player(playerr)
						local pctrl  = player:get_player_control()
						if pctrl.dig and (player:get_wielded_item():get_name() == "core:defuser" or player:get_wielded_item():get_name() == ":" or player:get_wielded_item():get_name() == "") then
							if csgo.pot[playerr] ~= "terrorist" then
								if player:get_wielded_item():get_name() == "core:defuser" then
									player:hud_change(defuser_huds[playerr], "text", "Defusing in "..tostring(pnts))
									pnts = pnts - 1
									if pnts == 0 or pnts < 1 then
										pnts = defuser_hooks_wait
										player:hud_change(defuser_huds[playerr], "text", " ")
										annouce.winner("counter", "Congrats to "..playerr.." for defusing the bomb!")
										cs_match.finished_match(csgo.pot[playerr])
										to_end = nil
										c4.remove_bomb2()
										bank.player_add_value(playerr, 200) 
									end
								elseif player:get_wielded_item():get_name() == ":" or player:get_wielded_item():get_name() then
									player:hud_change(defuser_huds[playerr], "text", "Defusing in "..tostring(pnts2))
									pnts2 = pnts2 - 1
									if pnts2 == 0 or pnts2 < 1 then
										pnts2 = defuser_hooks_wait2
										player:hud_change(defuser_huds[playerr], "text", " ")
											annouce.winner("counter", "Congrats to "..playerr.." for defusing the bomb!")
											cs_match.finished_match(csgo.pot[playerr])
											to_end = nil
											c4.remove_bomb2()
											bank.player_add_value(playerr, 200) 
									end
								end
							end
							
						else
							local tableed = player:hud_get(defuser_huds[playerr])
							if tableed.text ~= "" or tableed.text ~= " " then
								player:hud_change(defuser_huds[playerr], "text", " ")
								if pnts2 ~= defuser_hooks_wait2 then
									pnts2 = tonumber(defuser_hooks_wait2)
								end
								if pnts ~= defuser_hooks_wait then
									pnts = tonumber(defuser_hooks_wait)
								end
							end
							tableed = {}
						end
					end
				end
			end
		end
		timerd = 0
	end
end
core.register_globalstep(defuser_hooks)