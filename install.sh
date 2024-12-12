# 
# Install the config thingys
# 

CONFIG_DIR="$HOME/.config"
WORKING_DIR="$(pwd)"

update_arch() {
  echo "Updating..."
  pacman -Syu --noconfirm
}
update_deb() {
  echo "Updating..."
  apt update -y
  apt upgrade -y
}
update_fed() {
  echo "Updating..."
  dnf update -y
}
update_os() {
  if [ -f /etc/debian_version ]; then
    update_deb $1
  elif [ -f /etc/arch-release ]; then
    update_arch $1
  elif [ -f /etc/fedora-release ]; then
    update_fedora $1
  else
    echo "Unsupported distro! D:"
  fi

}
install_arch_package() {
  echo "Installing $1..."
  pacman -S --noconfirm $1
}
install_deb_package() {
  echo "Installing $1..."
  apt install -y $1
}
install_fed_package() {
  echo "Installing $1..."
  dnf install -y $1
}
install_package() {
  if [ -f /etc/debian_version ]; then
    install_deb_package $1
  elif [ -f /etc/arch-release ]; then
    install_arch_package $1
  elif [ -f /etc/fedora-release ]; then
    install_fed_package $1
  else
    echo "Unsupported distro! D:"
  fi
}

install_starship() {
  echo "Installing Starship..."
  curl -fsSL https://starship.rs/install.sh | sh -s -- -y
}
install_packages() {
  update_os
  echo "Installing packages..."
  packages=("neofetch" "fastfetch" "hyprland" "hyprshot" "hyprpaper" "hypridle" "hyprlock")
  for package in "${packages[@]}"; do
    install_package "$package"
  done
}

read -p "The old configuration will be deleted. Continute (y/N)" confirm
if [[ "$confirm" =~ ^[Yy]$ ]]; then
  echo "Copying files from $WORKING_DIR to $CONFIG_DIR..."
else
  exit 0
fi

read -p "What fetch tool do you wanna use? (neofetch, fastfetch)" fetch_tool
if [[ "$fetch_tool" != "neofetch" && "$fetch_tool" != "fastfetch" ]] then
  echo "Invalid fetch tool!"
  exit 1
fi

read -p "Do you want to install the packages? (Y/n)" install_packages_confirm
if [[ "$install_packages_confirm" =~ ^[Yy]$ ]]; then
  install_packages
fi

echo "### duk"

exit 0

echo "Copying hyprland config..."
cp -r $WORKING_DIR/hypr/ $CONFIG_DIR/hypr/

echo "Copying starship config..."
cp $WORKING_DIR/starship/starship.toml $CONFIG_DIR/starship.toml

echo "Copying neofetch config..."
cp -r $WORKING_DIR/neofetch/ $CONFIG_DIR/neofetch/

echo "Copying fastfetch config..."
cp -r $WORKING_DIR/fastfetch/ $CONFIG_DIR/fastfetch/

echo "Copying bash config..."
cp $WORKING_DIR/bash/.bashrc $HOME/.bashrc

echo "Copying finished!"
exit 0
