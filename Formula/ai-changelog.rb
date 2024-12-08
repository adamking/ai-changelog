class AiChangelog < Formula
  desc "AI-powered changelog generator and commit message suggester using OpenAI GPT"
  homepage "https://github.com/yourusername/ai-changelog"
  url "https://github.com/yourusername/ai-changelog/archive/v1.0.0.tar.gz"
  sha256 "UPDATE_WITH_ACTUAL_SHA256_AFTER_RELEASE"
  license "MIT"
  version_scheme 1

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "git"
  depends_on "jq"
  depends_on "curl"

  def install
    bin.install "ai-changelog"
  end

  def caveats
    <<~EOS
      Before using ai-changelog, set your OpenAI API key:
        export OPENAI_API_KEY='your-api-key'
      
      Add this to your shell configuration file (~/.zshrc, ~/.bashrc) to make it permanent.
      
      Optional: Create a configuration file at ~/.ai-changelog.config:
        {
          "model": "gpt-4",
          "temperature": 0.3,
          "max_tokens": 500
        }
    EOS
  end

  test do
    # Test version output
    assert_match "version #{version}", shell_output("#{bin}/ai-changelog --version")
    
    # Test help output
    assert_match "Usage:", shell_output("#{bin}/ai-changelog --help")
    
    # Test error message when not in a git repository
    assert_match "Not in a git repository", shell_output("#{bin}/ai-changelog 2>&1", 1)
    
    # Test error message when OPENAI_API_KEY is not set
    output = shell_output("#{bin}/ai-changelog 2>&1", 1)
    assert_match "OPENAI_API_KEY environment variable is not set", output
  end
end 