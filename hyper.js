// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
  config: {
    // Choose either "stable" for receiving highly polished,
    // or "canary" for less polished but more frequent updates
    updateChannel: 'stable',

    // default font size in pixels for all tabs
    fontSize: 17,

    // font family with optional fallbacks
    fontFamily: '"Source Code Pro", monospace',

    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    cursorColor: '#fc2b2b',

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorShape: 'UNDERLINE',

    // set to true for blinking cursor
    cursorBlink: false,

    // color of the text
    foregroundColor: '#fff',

    // terminal background color
    backgroundColor: '#000',

    // border color (window, tabs)
    borderColor: '#333',

    // custom css to embed in the main window
    css: '',

    // custom css to embed in the terminal window
    termCSS: '',

    // set to `true` (without backticks) if you're using a Linux setup that doesn't show native menus
    // default: `false` on Linux, `true` on Windows (ignored on macOS)
    showHamburgerMenu: '',

    // set to `false` if you want to hide the minimize, maximize and close buttons
    // additionally, set to `'left'` if you want them on the left, like in Ubuntu
    // default: `true` on windows and Linux (ignored on macOS)
    showWindowControls: '',

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '10px 10px 10px 10px',

    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    colors: {
      black: '#121212',
      red: '#fa2573',
      green: '#98e123',
      yellow: '#dfd460',
      blue: '#1080d0',
      magenta: '#8700ff',
      cyan: '#43a8d0',
      white: '#bbbbbb',
      lightBlack: '#555555',
      lightRed: '#f6669d',
      lightGreen: '#b1e05f',
      lightYellow: '#fff26d',
      lightBlue: '#00afff',
      lightMagenta: '#af87ff',
      lightCyan: '#51ceff',
      lightWhite: '#ffffff'
    },

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    //
    // Windows
    // - Make sure to use a full path if the binary name doesn't work
    // - Remove `--login` in shellArgs
    //
    // Bash on Windows
    // - Example: `C:\\Windows\\System32\\bash.exe`
    //
    // Powershell on Windows
    // - Example: `C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\powershell.exe`
    shell: '',

    // for setting shell arguments (i.e. for using interactive shellArgs: ['-i'])
    // by default ['--login'] will be used
    shellArgs: ['--login'],

    // for environment variables
    env: {},

    // set to false for no bell
    bell: 'SOUND',

    // if true, selected text will automatically be copied to the clipboard
    copyOnSelect: false,

    // if true, on right click selected text will be copied or pasted if no
    // selection is present (true by default on Windows)
    // quickEdit: true

    // URL to custom bell
    // bellSoundURL: 'http://example.com/bell.mp3',

    // for advanced config flags please refer to https://hyper.is/#cfg
    summon: {
      hideDock: false,
      hideOnBlur: true,
      hotkey: 'Option+Space'
    },
    hyperline: {
      plugins: [
        "hostname", "ip", "memory", "battery", "cpu", "network"
      ]
    },
    hypercwd: {
      initialWorkingDirectory: '~/GitHub'
    }
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
    "hyperline",
    "hyperterm-summon",
    "hyperterm-alternatescroll",
    "hyper-tabs-enhanced",
    "hyperfullscreen",
    'hypercwd'
  ],

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: [
    "hyper-smyck"
  ],

  keymaps: {
    // Example
    // 'window:devtools': 'cmd+alt+o',
  }
};
