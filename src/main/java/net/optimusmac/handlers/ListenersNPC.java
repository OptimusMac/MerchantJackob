package net.optimusmac.handlers;

import de.tr7zw.nbtapi.NBTItem;
import net.citizensnpcs.api.event.NPCRightClickEvent;
import net.optimusmac.Merchant;
import net.optimusmac.npc.CustomMerchant;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.block.BlockBreakEvent;
import org.bukkit.event.entity.EntityPickupItemEvent;
import org.bukkit.event.player.PlayerPickupItemEvent;

public class ListenersNPC implements Listener {

    @EventHandler
    public void onBreakBlock(BlockBreakEvent e) {
        if (Merchant.getInstance().getMerchant().getNPC().getEntity().getLocation().distance(e.getBlock().getLocation()) <= 15) {
            e.setCancelled(true);
        }
    }

    @Deprecated
    @EventHandler
    public void onPickUP(PlayerPickupItemEvent e) {
        NBTItem nbtItem = new NBTItem(e.getItem().getItemStack());
        if(nbtItem.hasTag("jack")){
            Merchant.getInstance().getMerchant().addTakePlayer(e.getPlayer());
        }
    }

    @EventHandler
    public void onRightClickNPC(NPCRightClickEvent e){
        if(e.getNPC().getName().equals(Merchant.getInstance().getNameNPC())){
            CustomMerchant customMerchant = Merchant.getInstance().getMerchant();;
            if(customMerchant.canGiveItem()){
                customMerchant.giveItemJack(e.getClicker());
            }
        }
    }

}
