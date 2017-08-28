-- Pizza MOD
-- by vitaminx
-- Improved by jogag

NAME="Pizza MOD - Improved by jogag"
VERSION="0.1"

print(NAME.." "..VERSION)

-- items
minetest.register_craftitem("pizza:pizza_dough", {
    description = "Pizza Dough",
    inventory_image = "pizza_dough.png"
})

minetest.register_node("pizza:pizza", {
    description = "Pizza",
    drawtype = "signlike",
    tiles = { "pizza.png" },
    inventory_image = "pizza.png",
    wield_image = "pizza.png",
    groups = { dig_immediate=2 },
    paramtype = "light",
    on_use = minetest.item_eat(30),
})

minetest.register_craftitem("pizza:pizzaslice", {
    description = "Pizza Slice",
    inventory_image = "pizzaslice.png",
    on_use = minetest.item_eat(5)
})

minetest.register_node("pizza:pizzabox", {
    description = "Pizzabox",
    tiles = {
        "pizzabox_top.png",
        "pizzabox_bottom.png",
        "pizzabox_side.png",
        "pizzabox_side.png",
        "pizzabox_side.png",
        "pizzabox_side.png",
    },
    inventory_image = "pizzabox_top.png",
    groups = { dig_immediate=2 },
    paramtype = "light",
    paramtype2 = "facedir",
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {
            { -0.5, -0.5, -0.5, 0.5, -0.3, 0.5 }
        }
    },
    on_rightclick = function(pos, node, clicker, itemstack)
        node.name = "pizza:pizzabox_open"
        minetest.add_node(pos, node)
    end,
})

minetest.register_node("pizza:pizzabox_open", {
    description = "Open Pizzabox",
    tiles = {
        "pizzabox_bottom.png^pizza.png",
        "pizzabox_bottom.png",
        "pizzabox_side.png^(pizzabox_side.png^[transformR90)",
        "pizzabox_side.png^(pizzabox_side.png^[transformR90FX)",
        "pizzabox_top.png^[transformFY",
        "pizzabox_bottom.png^pizzabox_side.png",
    },
    inventory_image = "pizzabox_top.png",
    groups = { dig_immediate=2, not_in_creative_inventory=1 },
    paramtype = "light",
    paramtype2 = "facedir",
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {
            { -0.5, -0.5, -0.5, 0.5, -0.3, 0.5 },
            { -0.5, -0.5, 0.5, 0.5, 0.5, 0.5 }
        }
    },
    drop = "pizza:pizzabox",
    on_rightclick = function(pos, node, clicker, itemstack)
        node.name = "pizza:pizzabox"
        minetest.add_node(pos, node)
    end,
})

-- recipes
minetest.register_craft({
    type = "shapeless",
    output = "pizza:pizza_dough",
    recipe = {"group:food_flour", "group:food_cheese", "group:food_tomato"},
})

minetest.register_craft({
    output = "pizza:pizza",
    type = "cooking",
    cooktime = 50.0,
    recipe = "pizza:pizza_dough",
})

minetest.register_craft({
    type = "shapeless",
    output = "pizza:pizza",
    recipe = {"pizza:pizzabox"},
})

minetest.register_craft({
    type = "shapeless",
    output = "pizza:pizzaslice 6",
    recipe = {"pizza:pizza"},
})

minetest.register_craft({
    output = "pizza:pizzabox",
    recipe = {
        {"", "default:paper", ""},
        {"default:paper", "pizza:pizza", "default:paper"},
        {"", "default:paper", ""},
    },
})

