
core.register_craftitem("get_biome_data:wand", {
	description = "Biome Data Wand\n(right-click to get biome data in node's position)",
	inventory_image = "get_biome_data_wand.png",
	groups = {tool = 1},
	on_place = function(itemstack, player, pointed_thing)
		local biomedata = core.get_biome_data(pointed_thing.under)

		local str =
				core.colorize("#aaa", "Biome: ")
			 .. core.colorize("#0f0", core.get_biome_name(biomedata.biome))
			 .. " ( heat: " .. core.colorize("#f00", biomedata.heat) .. ", humidity: " .. core.colorize("#55f", biomedata.humidity) .. ")"

		core.chat_send_player(player:get_player_name(), str)

		return itemstack
	end,
})
