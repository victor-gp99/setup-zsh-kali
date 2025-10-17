## 🐚 Kali Linux ZSH Setup

Este proyecto automatiza la **personalización completa de la shell ZSH en Kali Linux**, incluyendo la instalación de **Oh My Zsh**, el tema **Powerlevel10k** y los plugins más populares para mejorar la experiencia en terminal.

---

### 🚀 Características

* ✅ Instalación automática de **ZSH**, **Oh My Zsh** y dependencias.
* 🎨 Activación del tema **Powerlevel10k**.
* ⚡ Plugins útiles:

  * `zsh-autosuggestions` → sugerencias automáticas al escribir comandos.
  * `zsh-syntax-highlighting` → resaltado de sintaxis en tiempo real.
* 🔧 Configuración automática del archivo `~/.zshrc`.
* 💻 Cambio automático de shell por defecto a ZSH.
* 🔑 Atajos de teclado sugeridos para una mejor productividad.

---

### 🧩 Requisitos

* Kali Linux (o cualquier distribución basada en Debian).
* Conexión a Internet.
* Permisos de superusuario (`sudo`).

---

### 🛠️ Instalación

1. Clona este repositorio:

   ```bash
   git clone https://github.com/<tu_usuario>/kali-zsh-setup.git
   cd kali-zsh-setup
   ```

2. Asigna permisos de ejecución:

   ```bash
   chmod +x setup-zsh-kali.sh
   ```

3. Ejecuta el script:

   ```bash
   ./setup-zsh-kali.sh
   ```

4. Una vez finalizado, reinicia la terminal y ejecuta:

   ```bash
   p10k configure
   ```

---

### ⚙️ Atajos recomendados para la terminal

| Acción                           | Atajo              |
| -------------------------------- | ------------------ |
| Dividir terminal horizontalmente | `Ctrl + Space`     |
| Dividir terminal verticalmente   | `Ctrl + \`         |
| Colapsar subterminal             | `Ctrl + Backspace` |
| Mover a subterminal derecho      | `Ctrl + ]`         |
| Mover a subterminal izquierdo    | `Ctrl + [`         |

---

### 🧠 Notas adicionales

* El script modificará automáticamente tu archivo `~/.zshrc` para habilitar los plugins y el tema.
* Si ya tienes configuraciones personalizadas, se recomienda hacer una copia de seguridad:

  ```bash
  cp ~/.zshrc ~/.zshrc.backup
  ```

---

### 🧑‍💻 Autor

**Victor Eduardo García**
🔹 IT & Cybersecurity Engineer
🔹 Pentester
