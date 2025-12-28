#!/bin/bash

echo -e "\e[1;36m @YarasaTR \e[0m"
echo

# TARGET DIRECTORY BELİRLENDİ
target_directory="/home/PakTool/"

if [ ! -d "$target_directory" ]; then
    echo -e "\e[1;32mPROCESS COMPLETED ✅\e[0m"
    exit 1
fi

file_count=$(find "$target_directory" -type f | wc -l)
echo -e "\e[1mARE YOU SURE YOU WANT TO NULL $file_count FILES IN $target_directory? (Y/N)\e[0m"
read -r confirmation
confirmation="${confirmation,,}"
if [ "$confirmation" = "y" ]; then
    for file in "$target_directory"/*; do
        if [ -f "$file" ]; then
            : > "$file"
        fi
    done
    echo -e "\e[1;32mFILES CLEARED\e[0m"
    echo
else
    echo "OPERATION CANCELLED."
    exit 0
fi

echo -e "\e[1mDO YOU WANT TO ADD CUSTOM CREDIT IN FILES? (Y/N)\e[0m"
read -r add_credit
add_credit="${add_credit,,}"
if [ "$add_credit" = "y" ]; then
    echo -e "\e[1mENTER THE CUSTOM CREDIT TEXT:\e[0m"
    read -p "> " credit_text
    for file in "$target_directory"/*; do
        if [ -f "$file" ]; then
            echo "$credit_text" >> "$file"
        fi
    done
    echo "CREDIT ADDED TO FILES."
else
    echo "NO CREDITS ADDED."
fi

echo -e "\e[1;32mPROCESS COMPLETED ✅\e[0m"
