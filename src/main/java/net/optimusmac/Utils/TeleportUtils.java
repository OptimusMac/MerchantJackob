package net.optimusmac.Utils;

import net.citizensnpcs.api.npc.NPC;
import net.optimusmac.Merchant;
import net.optimusmac.Utils.Color.IridiumColorAPI;
import net.optimusmac.Utils.messages.Messages;
import net.optimusmac.npc.CustomMerchant;
import org.bukkit.Bukkit;
import org.bukkit.Location;
import org.bukkit.Material;
import org.bukkit.World;
import org.bukkit.block.Block;

public class TeleportUtils {

    private NPC npc;
    private CustomMerchant customMerchant;

    public TeleportUtils(CustomMerchant customMerchant) {
        this.npc = customMerchant.getNPC();
        this.npc.setName(Merchant.getInstance().getNameNPC());
        this.customMerchant = customMerchant;
    }


    public boolean safeTeleport(String worldName) {
        World world = Bukkit.getWorld(worldName);
        if (world == null) return false;
        int worldBorderSize = (int) world.getWorldBorder().getSize() / 2;
        int x = (int) (Math.random() * (worldBorderSize - 10) * 2) - worldBorderSize;
        int z = (int) (Math.random() * (worldBorderSize - 10) * 2) - worldBorderSize;
        int y = world.getHighestBlockYAt(x, z);
        Location location = new Location(world, x, y, z);
        Block block = location.getBlock();
        if (block.getType() != Material.AIR) {
            int minY = Math.max(y - 10, 0);
            int maxY = Math.min(y + 10, 255);
            for (int i = minY; i < maxY; i++) {
                block = world.getBlockAt(x, i, z);
                if (block.getType() == Material.AIR) {
                    location.setY(i);
                    break;
                }
            }
        }
        customMerchant.setActive(true);
        Messages.writeAll(String.format(Merchant.getInstance().getMessageAll(), location.getBlockX(), location.getBlockY(), location.getBlockZ()));
        return npc.spawn(location);
    }


}
