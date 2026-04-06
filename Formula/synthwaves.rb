class Synthwaves < Formula
  desc "synthwaves.fm CLI -- manage your music library from the terminal"
  homepage "https://synthwaves.fm"
  url "https://github.com/leopolicastro/synthwaves.fm-cli.git", tag: "v0.1.0"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-X github.com/leo/synthwaves-cli/cmd.Version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"synthwaves"), "."
  end

  test do
    assert_match "SYNTHWAVES", shell_output("#{bin}/synthwaves --help")
  end
end
