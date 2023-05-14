package net.optimusmac;

import net.milkbowl.vault.economy.Economy;
import net.optimusmac.Utils.Color.IridiumColorAPI;
import net.optimusmac.Utils.TeleportUtils;
import net.optimusmac.handlers.ListenersNPC;
import net.optimusmac.npc.CustomMerchant;
import org.bukkit.Bukkit;
import org.bukkit.Material;
import org.bukkit.plugin.RegisteredServiceProvider;
import org.bukkit.plugin.java.JavaPlugin;

import java.util.Date;
import java.util.Random;
import java.util.concurrent.CompletableFuture;
import java.util.logging.Level;

public final class Merchant extends JavaPlugin {

    private static Merchant instance;
    private double chanceSpawn;
    private CustomMerchant merchant;
    private String worldName;
    private String messageAll;
    private int minutesFromDead;
    private String materialBounty;
    private int givePerSecondBountyItem;
    private int pricePerBounty;
    private String messageDepositMoney;

    public static Economy econ;

    @Override
    public void onEnable() {
        instance = this;
        saveDefaultConfig();
        setupEconomy();
        Bukkit.getPluginManager().registerEvents(new ListenersNPC(), this);
        if (getServer().getPluginManager().getPlugin("Citizens") == null) {
            getLogger().log(Level.SEVERE, "Citizens 2.0 not found or not enabled");
            getServer().getPluginManager().disablePlugin(this);
        }
        merchant = new CustomMerchant();
        load();
        start();

    }


    private boolean setupEconomy() {
        RegisteredServiceProvider<Economy> economyProvider = Bukkit.getServicesManager().getRegistration(Economy.class);
        if (economyProvider != null) {
            econ = economyProvider.getProvider();
        }
        return econ != null;
    }

    public String getNameNPC() {
        return IridiumColorAPI.process("<GRADIENT:ff0000>Зажиточный Джейкоб</GRADIENT:ffff00>");
    }



    public int getPricePerBounty() {
        return pricePerBounty;
    }

    private void load() {
        chanceSpawn = getInstance().getConfig().getDouble("SettingsNPC.chanceSpawnPerSecond", 0.2f);
        minutesFromDead = getInstance().getConfig().getInt("SettingsNPC.minutesFromDead", 20);
        pricePerBounty = getInstance().getConfig().getInt("SettingsNPC.pricePerBounty", 1000);
        givePerSecondBountyItem = getInstance().getConfig().getInt("SettingsNPC.givePerSecondBountyItem", 30);
        worldName = getInstance().getConfig().getString("SettingsNPC.onlyWorld", "world");
        messageDepositMoney = getInstance().getConfig().getString("SettingsNPC.messageDepositMoney");
        messageAll = getInstance().getConfig().getString("SettingsNPC.allMessage");
        materialBounty = getInstance().getConfig().getString("SettingsNPC.itemBounty.material", "gold_ingot").toUpperCase();

    }

    public String getMessageDepositMoney() {
        return messageDepositMoney;
    }

    public int getGivePerSecondBountyItem() {
        return givePerSecondBountyItem;
    }

    public String getMaterialBounty() {
        return materialBounty;
    }

    public Material MaterialBounty(){
        return Material.getMaterial(getMaterialBounty()) == null ? Material.GOLD_INGOT : Material.getMaterial(getMaterialBounty());
    }

    public String getMessageAll() {
        return messageAll;
    }

    private int getMinutes() {
        return minutesFromDead;
    }

    public CustomMerchant getMerchant() {
        return merchant;
    }

    public int minutesDead() {
        return (20 * 60) * getMinutes();
    }

    @Override
    public void onDisable() {
        merchant.getNPC().destroy();
    }


    public static Merchant getInstance() {
        return instance;
    }



    private void start() {
        Bukkit.getScheduler().scheduleAsyncRepeatingTask(this, () -> {
            double randomValue = Math.random() * 100.0;
            if (randomValue <= chanceSpawn && (merchant.isDead())) {
                CompletableFuture.runAsync(() -> {
                    TeleportUtils teleportUtils = new TeleportUtils(merchant);
                    boolean isTeleport = teleportUtils.safeTeleport(worldName);
                    if (!isTeleport) {
                        throw new IllegalStateException("NPC is cant spawned write from developer plugin");
                    } else {
                        merchant.startDead();
                    }
                });
            }


        }, 20L, 20L);
    }

    public void setMerchant(CustomMerchant merchant) {
        this.merchant = merchant;
    }
}

