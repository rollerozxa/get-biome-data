local function get_data(name, pos)
	local biomedata = core.get_biome_data(pos)

	core.chat_send_player(
		name,
		core.colorize("#aaa", "Biome: ")
			 .. core.colorize("#0f0", core.get_biome_name(biomedata.biome))
			 .. " ( heat: " .. core.colorize("#f00", biomedata.heat) .. ", humidity: " .. core.colorize("#55f", biomedata.humidity) .. ")")
end

core.register_tool("get_biome_data:wand", {
	description = "Biome Data Wand\n(right-click to get biome data in node's position)",
	inventory_image = "get_biome_data_wand.png",
	on_place = function(itemstack, player, pointed_thing)
		get_data(player:get_player_name(), pointed_thing.under)

		return itemstack
	end,
})

core.register_chatcommand("get_biome_data", {
	description = "Get biome data in current position",
	privs = {debug = true},
	func = function(name, params)
		get_data(name, core.get_player_by_name(name):get_pos())
	end
})
