# ai-changelog

A command-line tool that uses OpenAI's GPT models to analyze your staged changes and suggest both a changelog entry and a commit message.

## Features

- Analyzes git staged changes
- Generates formatted changelog entries following Keep a Changelog format
- Suggests commit messages
- Configurable OpenAI model and parameters
- Excludes CHANGELOG.md from analysis by default

## Prerequisites

- Git
- curl
- jq
- OpenAI API key

## Installation

### Using Homebrew (Recommended)

1. First, tap the repository:
```bash
brew tap adamlui/ai-changelog
```

2. Then install the package:
```bash
brew install ai-changelog
```

### Manual Installation

1. Clone the repository:
```bash
git clone https://github.com/adamlui/ai-changelog.git
cd ai-changelog
```

2. Make the script executable:
```bash
chmod +x ai-changelog
```

3. Move to a directory in your PATH:
```bash
sudo mv ai-changelog /usr/local/bin/
```

### For Homebrew Formula Maintainers

To create your own tap:

1. Create a GitHub repository named `homebrew-[tap-name]` (e.g., `homebrew-ai-changelog`)
2. Create a `Formula` directory in the repository
3. Add the formula file (`ai-changelog.rb`) to the `Formula` directory
4. Users can then tap and install your formula:
```bash
brew tap yourusername/[tap-name]
brew install ai-changelog
```

## Configuration

Set your OpenAI API key:

```bash
export OPENAI_API_KEY='your-api-key'
```

Add this to your `~/.zshrc` or `~/.bashrc` to make it permanent.

### Optional Configuration File

Create a configuration file at `~/.ai-changelog.config`:

```json
{
  "model": "gpt-4",
  "temperature": 0.3,
  "max_tokens": 500
}
```

## Usage

```bash
ai-changelog [options]

Options:
  -h, --help            Display help message and exit
  -m, --model MODEL     Specify the OpenAI model to use (default: gpt-4-1106-preview)
  -t, --temperature T   Set the temperature for the OpenAI API (default: 0.3)
  -k, --max-tokens N    Define the maximum tokens for response (default: 500)
  -v, --verbose         Enable verbose mode for detailed logging
  --version            Display version information
  --config PATH        Specify a custom config file path

Examples:
  ai-changelog                           # Basic usage with defaults
  ai-changelog -m gpt-4 -t 0.5          # Custom model and temperature
  ai-changelog -k 600 -v                # More tokens and verbose logging
```

## Example Output

```
📝 Changelog:
----------------------------------------
### Added
- New feature description
  - `path/to/file.ext`: What changed in this file
  - `another/file.ext`: What changed here

### Changed
- Change description
  - `path/to/file.ext`: Specific changes made
----------------------------------------
```

## License

MIT