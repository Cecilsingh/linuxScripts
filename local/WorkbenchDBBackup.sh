#!/bin/bash

#Define database file paths
source_db_filename="/var/lib/rstudio-server/rstudio.sqlite"
backup_db_filename="/var/lib/rstudio-server/rstudio.sqlite.bk"

#Function to backup the database
backup_database() {
    if cp -p "$source_db_filename" "$backup_db_filename"; then
        echo "Backup successful."
    else
        echo "Backup failed."
    fi
}

#Function to restore the database
restore_database() {
    if cp -p "$backup_db_filename" "$source_db_filename"; then
        echo "Restore successful."
    else
        echo "Restore failed."
    fi
}

#Loop through the main menu
while true; do
    echo "Options:"
    echo "1. Backup Database"
    echo "2. Restore Database"
    echo "3. Quit"
    read -p "Enter your selection (1, 2, or 3): " userSelection

    case $userSelection in
        1)
            backup_database
            ;;
        2)
            restore_database
            ;;
        3)
            break
            ;;
        *)
            echo "Invalid selection. Please enter 1, 2, or 3."
            ;;
    esac
done
