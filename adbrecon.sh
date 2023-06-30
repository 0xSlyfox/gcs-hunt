#!/bin/bash

# Cool banner, makes it go 10x faster
echo -e "\033[1;31m                                                                                        
███████╗ ██████╗ ██╗  ██╗██╗  ██╗██╗   ██╗███╗   ██╗████████╗     ██████╗  ██████╗███████╗
██╔════╝██╔═══██╗╚██╗██╔╝██║  ██║██║   ██║████╗  ██║╚══██╔══╝    ██╔════╝ ██╔════╝██╔════╝
█████╗  ██║   ██║ ╚███╔╝ ███████║██║   ██║██╔██╗ ██║   ██║       ██║  ███╗██║     ███████╗
██╔══╝  ██║   ██║ ██╔██╗ ██╔══██║██║   ██║██║╚██╗██║   ██║       ██║   ██║██║     ╚════██║
██║     ╚██████╔╝██╔╝ ██╗██║  ██║╚██████╔╝██║ ╚████║   ██║       ╚██████╔╝╚██████╗███████║
╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝   ╚═╝        ╚═════╝  ╚═════╝╚══════╝
by slyf0x
\033[0m                                                                                       
"
sleep 2

echo "Project Name: "
read project

# Create a filename using the project name
filename="${project}_recon.txt"

# Print status and write output to the file
echo "Getting Hardware ID's..."
echo "========================================================================" | tee -a $PWD/$filename
echo "======================== General Hardware Info =========================" | tee -a $PWD/$filename
echo "========================================================================" | tee -a $PWD/$filename
echo -e "\nProduct Model:\n" | tee -a $PWD/$filename
adb shell getprop ro.product.model | tee -a $PWD/$filename

echo -e "\nAndroid Version:\n" | tee -a $PWD/$filename
adb shell getprop ro.build.version.release | tee -a $PWD/$filename

echo -e "\nCPU ABI:\n" | tee -a $PWD/$filename
adb shell getprop ro.product.cpu.abi | tee -a $PWD/$filename

echo -e "\nTotal Memory:\n" | tee -a $PWD/$filename
adb shell cat /proc/meminfo | grep MemTotal | awk '{print $2}' | tee -a $PWD/$filename

echo "========================================================================" | tee -a $PWD/$filename
echo "============================ SDK Info ==================================" | tee -a $PWD/$filename
echo "========================================================================" | tee -a $PWD/$filename
echo -e "\nSDK Version:\n" | tee -a $PWD/$filename
adb shell getprop ro.build.version.sdk | tee -a $PWD/$filename

echo "========================================================================" | tee -a $PWD/$filename
echo "====================== Manufacturer Info ===============================" | tee -a $PWD/$filename
echo "========================================================================" | tee -a $PWD/$filename
echo -e "\nManufacturer:\n" | tee -a $PWD/$filename
adb shell getprop ro.product.manufacturer | tee -a $PWD/$filename

echo -e "\nBrand:\n" | tee -a $PWD/$filename
adb shell getprop ro.product.brand | tee -a $PWD/$filename

echo -e "\nDevice Name:\n" | tee -a $PWD/$filename
adb shell getprop ro.product.name | tee -a $PWD/$filename

echo "========================================================================" | tee -a $PWD/$filename
echo "========================== Screen Info =================================" | tee -a $PWD/$filename
echo "========================================================================" | tee -a $PWD/$filename
echo -e "\nScreen Size:\n" | tee -a $PWD/$filename
adb shell wm size | awk '{print $3}' | tee -a $PWD/$filename

echo -e "\nScreen Density:\n" | tee -a $PWD/$filename
adb shell wm density | awk '{print $3}' | tee -a $PWD/$filename

echo "========================================================================" | tee -a $PWD/$filename
echo "========================== Battery Info ================================" | tee -a $PWD/$filename
echo "========================================================================" | tee -a $PWD/$filename
echo -e "\nBattery Status:\n" | tee -a $PWD/$filename
adb shell dumpsys battery | tee -a $PWD/$filename

echo "========================================================================" | tee -a $PWD/$filename
echo "======================= Wifi Statistics ================================" | tee -a $PWD/$filename
echo "========================================================================" | tee -a $PWD/$filename
echo -e "\nWifi Information:\n" | tee -a $PWD/$filename
adb shell dumpsys wifi | tee -a $PWD/$filename

echo "========================================================================" | tee -a $PWD/$filename
echo "====================== Network Statistics ==============================" | tee -a $PWD/$filename
echo "========================================================================" | tee -a $PWD/$filename
echo -e "\nNetwork Statistics:\n" | tee -a $PWD/$filename
adb shell dumpsys netstats | tee -a $PWD/$filename

echo "========================================================================" | tee -a $PWD/$filename
echo "======================== Security Patch ================================" | tee -a $PWD/$filename
echo "========================================================================" | tee -a $PWD/$filename
echo -e "\nSecurity Patch Level:\n" | tee -a $PWD/$filename
adb shell getprop ro.build.version.security_patch | tee -a $PWD/$filename

echo "========================================================================" | tee -a $PWD/$filename
echo "======================= Installed Packages =============================" | tee -a $PWD/$filename
echo "========================================================================" | tee -a $PWD/$filename
adb shell pm list packages | tee -a $PWD/$filename

echo "Loot plundered..."

