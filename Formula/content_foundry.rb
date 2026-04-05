class ContentFoundry < Formula
  desc "Content Foundry CLI -- manage your content pipeline from the terminal"
  homepage "https://git.lbp.dev/content_foundry-cli"
  url "ssh://git@100.98.15.106:23231/content_foundry-cli.git", tag: "v0.1.1"
  license :cannot_represent

  depends_on "go" => :build

  def install
    ldflags = "-X github.com/leo/content-foundry-cli/cmd.Version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"content_foundry"), "."
  end

  test do
    assert_match "CONTENT FOUNDRY", shell_output("#{bin}/content_foundry --help")
  end
end
