# EpiConf

**EpiConf** is a complete configuration pack designed for EPITA students.  
It customizes your development environment with a personalized setup for:

- [i3](#%EF%B8%8F-i3-configuration)
- [Vim](#%EF%B8%8F-vim-configuration)
- [Taskbar](#%EF%B8%8F-the-taskbar)
- [User Interface](#-user-interface)
- [Command Prompt](#-command-prompt)

---

## 📦 Installation

> ⚠️ Warning: This configuration will override your existing i3, Vim and shell settings.  
> Make sure to back up your current configuration before installing.

Run this in your shell:

```bash
curl -L epiconf.getfdn.com | sh -s
````

During setup, you will be asked to create a password.  
This password is **not** your system password – it is only used to secure your `.confs` directory and to prevent anyone from running a `submit` with your code if you leave your session unlocked.  
Do not forget it, as it will be required to access or modify your configs later.  

> 🔐 Security note: **Never forget to i3lock!**

You can also open this documentation anytime with :

```bash
epiconf
````

You can update the config with :

```bash
update-conf
````

And if you want to delete Epiconf and get back to the [default config of epita](https://github.com/epita/epita-default-confs) :

```bash
reset-conf
````

> reset the config also remove Epiconf settings and startup script.

---

You can go en the Epiconf wiki for documentation
