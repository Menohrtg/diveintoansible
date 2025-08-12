#!/bin/bash

# Define users, OS types, and instance numbers
users=("ansible" "root")
oses=("ubuntu" "centos")
instances=(1 2 3)

# Path to password file
password_file="password.txt"

# Loop through users, OS types, and instances
for user in "${users[@]}"; do
  for os in "${oses[@]}"; do
    for instance in "${instances[@]}"; do
      host="${os}${instance}"
      echo "Copying SSH key to ${user}@${host}..."
      sshpass -f "$password_file" ssh-copy-id -o StrictHostKeyChecking=no "${user}@${host}"
    done
  done
done
