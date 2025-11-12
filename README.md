# TicTacToeMaster

🎮 **TicTacToeMaster** is a Ruby gem for playing **Tic Tac Toe**.  
It supports both **console interface** and **easy integration into web applications**.

[![Ruby](https://img.shields.io/badge/ruby-3.0%2B-red.svg)](https://www.ruby-lang.org/)
[![Gem](https://img.shields.io/gem/v/tic_tac_toe_master.svg)](https://rubygems.org/gems/tic_tac_toe_master)
[![Build Status](https://img.shields.io/github/actions/workflow/status/Natisk/tic_tac_toe_master/ci.yml?branch=main)](https://github.com/Natisk/tic_tac_toe_master/actions)
[![Coverage Status](https://img.shields.io/codecov/c/github/Natisk/tic_tac_toe_master/main.svg)](https://codecov.io/gh/Natisk/tic_tac_toe_master)

---

## Features

- Simple console interface (`UI::ConsoleUI`) for quick play in the terminal
- Flexible structure to add other UIs (e.g., `UI::WebUI`)
- Supports two players with names and symbols `X` and `O`
- Checks for win, draw, and invalid moves
- Clean, testable code with RSpec

---

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tic_tac_toe_master'
```

Or install it yourself as:

```bash
gem install tic_tac_toe_master
```

## Usage

```ruby
require 'tic_tac_toe_master'

# Start the game in console
TicTacToeMaster.start
```

## Roadmap

- Add UI::WebUI for integration with Rails or Sinatra
- Add AI for playing against the computer
- Support customizable board size and symbols

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TicTacToeMaster project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Natisk/tic_tac_toe_master/blob/main/CODE_OF_CONDUCT.md).
