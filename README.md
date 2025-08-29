# par-s-e

**par-s-e** – *pronunciation*: `\pa.ʁɛ.sø\`
**Pronunciation (French):** "par S E" – like "paresseux"

A lightweight manager for the kind of scripts you write when you’re too lazy to type long commands.

You know the ones:

* `push-branch.sh` — so you don’t have to type `git push origin <branch>` every time.
* `copy-branch.sh` — because right-click + copy is *too much effort*.

par-s-e gives those “lazy scripts” a proper home:

* install, update, and remove them with a single command
* browse what’s available with a clean catalog view
* manage aliases so your shortcuts are even shorter

Because if you’re going to be lazy, you might as well be **organized about it**. 🦥

---

## Installation

Clone the repository and run the installer:

```bash
git clone <repo-url> ~/par-s-e
cd ~/par-s-e
./install_par-s-e.sh
````

This will:

* Create `~/.par-s-e/bin` for the scripts.
* Symlink `par-s-e` to your `BIN_DIR`.
* Install autocompletion for Bash/Zsh.
* Warn if `~/.par-s-e/bin` is not in your PATH.

---

## Adding Your Scripts

To make scripts available for `par-s-e`:

1. Place your scripts inside the `scripts` folder **inside the repository**:

```text
~/par-s-e/scripts/<my_script.sh>
```

2. Make sure the script is executable:

```bash
chmod +x ~/par-s-e/scripts/<my_script.sh>
```

3. The scripts will automatically appear as available when running:

```bash
par-s-e catalog
```

4. Install the script with:

```bash
par-s-e install <my_script.sh> [<alias>]
```

**Directory structure example:**

```text
~/par-s-e/
├─ scripts/
│  ├─ my_script.sh
│  └─ another_script.sh
├─ par-s-e
└─ install_par-s-e.sh
```

---

## Usage

```bash
par-s-e <command> [options] [arguments]
```

### Available commands

| Command     | Description                                                     |
| ----------- | --------------------------------------------------------------- |
| `list`      | List all available subcommands.                                 |
| `catalog`   | Show available and installed scripts.                           |
| `install`   | Install a script from the repository, optionally with an alias. |
| `update`    | Update a single installed script, or all if none specified.     |
| `uninstall` | Remove an installed script.                                     |
| `help`      | Show help for a command.                                        |

### Help

Display global help:

```bash
par-s-e -h
```

Display help for a specific command:

```bash
par-s-e help install
```

---

## Catalog

The `catalog` command displays your scripts with a clear legend:

```
Legend:  ○ available   ● installed   ↳ alias
```

Example:

```text
● script_1.sh   ↳ script-1
● script_2.sh   ↳ s2
○ script_3.sh
```

* `●` = installed
* `○` = available
* `↳` = alias for installed script

---

## Installing Scripts

Install a script:

```bash
par-s-e install my_script.sh
```

Install with an alias:

```bash
par-s-e install my_script.sh ms
```

Installed scripts are stored in `~/.par-s-e/bin`.

---

## Updating Scripts

Update all installed scripts:

```bash
par-s-e update
```

Update a specific script:

```bash
par-s-e update script-1
```

---

## Removing Scripts

Uninstall a script:

```bash
par-s-e uninstall script-1
```

---

## Autocompletion

After installation, autocompletion should be enabled automatically for Bash/Zsh.
If not, manually source it:

```bash
source ~/.par-s-e/completions/par-s-e-completion.sh
```

---

## Notes

* This tool is designed for personal use; scripts should be formatted and tested before installation.
* All commands give visual feedback similar to the `catalog` style, with color codes for clarity.
