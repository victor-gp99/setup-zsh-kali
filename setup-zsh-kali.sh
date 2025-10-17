#!/bin/bash
# ============================================================
# Script de automatización de personalización de ZSH en Kali Linux
# Autor: Victor Eduardo García
# ============================================================

GREEN="\e[32m"
YELLOW="\e[33m"
RED="\e[31m"
RESET="\e[0m"

echo -e "${GREEN}[+] Verificando shell actual...${RESET}"
ls -l /proc/$$/exe

# ============================================================
# 1. Instalar ZSH y dependencias
# ============================================================
echo -e "${GREEN}[+] Instalando ZSH y dependencias...${RESET}"
sudo apt update && sudo apt install -y zsh git curl

# ============================================================
# 2. Instalar Oh My Zsh
# ============================================================
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo -e "${GREEN}[+] Instalando Oh My Zsh...${RESET}"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo -e "${YELLOW}[!] Oh My Zsh ya está instalado, saltando...${RESET}"
fi

# ============================================================
# 3. Instalar tema Powerlevel10k
# ============================================================
echo -e "${GREEN}[+] Instalando tema Powerlevel10k...${RESET}"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
"${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/themes/powerlevel10k

# Configurar el tema en .zshrc
echo -e "${GREEN}[+] Configurando tema Powerlevel10k...${RESET}"
sed -i 's|^ZSH_THEME=.*|ZSH_THEME="powerlevel10k/powerlevel10k"|' ~/.zshrc

# ============================================================
# 4. Instalar plugins
# ============================================================
echo -e "${GREEN}[+] Instalando plugins...${RESET}"
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-syntax-highlighting

# Configurar plugins en .zshrc
echo -e "${GREEN}[+] Configurando plugins en ~/.zshrc...${RESET}"
sed -i '/^plugins=/c\plugins=(git zsh-autosuggestions zsh-syntax-highlighting)' ~/.zshrc

# ============================================================
# 5. Configurar Powerlevel10k (.p10k.zsh)
# ============================================================
P10K_FILE="$HOME/.p10k.zsh"
if [ -f "$P10K_FILE" ]; then
    echo -e "${GREEN}[+] Modificando configuración de Powerlevel10k...${RESET}"

    # --- Comentar todas las líneas dentro de los bloques LEFT y RIGHT ---
    sed -i '/^typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=/,/^)/ s/^\([^#]\)/# \1/' "$P10K_FILE"
    sed -i '/^typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=/,/^)/ s/^\([^#]\)/# \1/' "$P10K_FILE"

    # --- Descomentar solo los elementos indicados ---
    # Bloque izquierdo 
    sed -i '/os_icon/s/^# //' "$P10K_FILE"
    sed -i '/dir/s/^# //' "$P10K_FILE"

    # Bloque derecho 
    sed -i '/status/s/^# //' "$P10K_FILE"
    sed -i '/vpn_ip/s/^# //' "$P10K_FILE"
    sed -i '/ip/s/^# //' "$P10K_FILE"

else
    echo -e "${YELLOW}[!] No se encontró ~/.p10k.zsh.${RESET}"
    echo -e "${YELLOW}Ejecuta 'p10k configure' y vuelve a correr el script para aplicar los cambios.${RESET}"
fi

# ============================================================
# 6. Cambiar shell por defecto a ZSH
# ============================================================
if [ "$SHELL" != "/usr/bin/zsh" ]; then
    echo -e "${GREEN}[+] Estableciendo ZSH como shell por defecto...${RESET}"
    chsh -s $(which zsh)
else
    echo -e "${YELLOW}[!] ZSH ya es la shell por defecto.${RESET}"
fi

# ============================================================
# 7. Mensaje final
# ============================================================
echo -e "${GREEN}[✓] Instalación y personalización completadas.${RESET}"
echo -e "${YELLOW}Reinicia la terminal y ejecuta:${RESET} p10k configure"
echo -e "${YELLOW}Verifica ~/.p10k.zsh para confirmar los cambios.${RESET}"
echo -e "${YELLOW}Atajos sugeridos:${RESET}"
echo -e "  Ctrl+Space  -> Split Horizontal"
echo -e "  Ctrl+\\      -> Split Vertical"
echo -e "  Ctrl+Backspace -> Collapse Subterminal"
echo -e "  Ctrl+] / Ctrl+[ -> Navegar entre paneles"
