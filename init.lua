
minetest.register_craftitem("get_biome_data:wand", {
	description = "Biome Data Wand\n(right-click to get biome data in node's position)",
	inventory_image = "get_biome_data_wand.png",
	groups = {tool = 1},
	on_place = function(itemstack, player, pointed_thing)
		local biomedata = minetest.get_biome_data(pointed_thing.under)

		local str =
				minetest.colorize("#aaa", "Biome: ")
			 .. minetest.colorize("#0f0", minetest.get_biome_name(biomedata.biome))
			 .. " ( heat: " .. minetest.colorize("#f00", biomedata.heat) .. ", humidity: " .. minetest.colorize("#55f", biomedata.humidity) .. ")"

		minetest.chat_send_player(player:get_player_name(), str)

		return itemstack
	end,
})
