require 'rbconfig'
require 'spec_helper'

describe(Jekyll) do
  let(:overrides) do
    {
      "source"      => source_dir,
      "destination" => dest_dir,
      "url"         => "http://example.org",
    }
  end

  let(:config) do
    Jekyll.configuration(overrides)
  end

  let(:site)      { Jekyll::Site.new(config) }
  let(:contents)  { File.read(dest_dir("index.html")) }

  before(:each) do
    site.process
  end

  is_windows = (RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/)

  it 'has a version number' do
    expect(Jekyll::Typogrify::VERSION).not_to be nil
  end

  it "wraps ampersands in span with the class amp" do
    expect(contents).to match /<p class="test-amp">This <span class="amp">&amp;<\/span> That<\/p>/
    expect(contents).to_not match /<p class="test-amp">This & That<\/p>/
  end

  it "wraps acronyms and initialism in span with the class caps" do
    expect(contents).to match /<span class="caps">SCUBA<\/span> is an acronym while <span class="caps">IBM<\/span> is an initialism/
    expect(contents).to_not match /SCUBA is an acronym while IBM is an initialism/
  end

  it "converts special characters (excluding HTML tags) to HTML entities" do
    if not is_windows
      expect(contents).to match /<strong>&copy;<\/strong>/
      expect(contents).to_not match /<strong>©<\/strong>/
      expect(contents).to_not match /&lt;strong&gt;&copy;&lt;\/strong&gt;/
    end
  end

  it "wraps the first double/single quote in a span with the class dquo" do
    expect(contents).to match /<span class="dquo">"<\/span>Call me Ishmael" he said./
    expect(contents).to_not match /"Call me Ishmael" he said./
  end

  it "will apply the smartypants filter" do
    expect(contents).to match /Myles &#8220;The Great&#8221; Braithwaite/
    expect(contents).to_not match /Myles "The Great" Braithwaite/
  end

  it "will add a non-breaking-space between the last two words" do
    expect(contents).to match /This is a rather long title and we don't want any widows or&nbsp;orphans./
    expect(contents).to_not match /This is a rather long title and we don't want any widows or orphans./
  end

  it "runs all the filters" do
    expect(contents).to match /<span class="quo">&#8216;<\/span>Neque porro quisquam&#8217; est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci&nbsp;velit&#8230;/
    expect(contents).to_not match /'Neque porro quisquam' est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit.../
  end

  it "run improve on a couple of emojis" do
    if not is_windows
      expect(contents).to_not match /🤖s Fighting 🐵s/
      expect(contents).to match /🤖s Fighting&nbsp;🐵s/
    end
  end

  it "will apply the titlecase filter" do
    if not is_windows
      expect(contents).to_not match /welcome to beautiful 東京都 (tokyo), japan/
      # expect(contents).to match /Welcome to Beautiful 東京都 (Tokyo), Japan/
    end
  end

  it "test filter from a page variable" do
    expect(contents).to_not match /this is the page title/
    expect(contents).to match /This Is the Page&nbsp;Title/
  end

  it "test filter from an assign variable" do
    expect(contents).to_not match /this is an assigned value/
    expect(contents).to match /This Is an Assigned&nbsp;Value/
  end

  it "nothing should happen with nil" do
    expect(contents).to match /<p class="test-nil-value"><\/p>/
  end

  it "nothing should happen if hte variable doesn't exist" do
    expect(contents).to match /<p class="test-variable-does-not-exist"><\/p>/
  end

  it "if the value is empty it should return nothing" do
    expect(contents).to match /<p class="test-empty-value"><\/p>/
  end

  it "test the letter spacing filter" do
    expect(contents).to_not match /<p class="test-letter-spacing">Click, Clint's, and Flick.<\/p>/
    expect(contents).to match /<p class="test-letter-spacing"><span class="fix-letter-spacing">Click<\/span>, <span class="fix-letter-spacing">Clint's<\/span>, and <span class="fix-letter-spacing">Flick<\/span>.<\/p>/
  end

  it "test caps with a hyphenated words" do
    expect(contents).to match /<p class="test-hyphenated-caps"><span class="caps">M65-A<\/span><\/p>/
    expect(contents).to_not match /<p class="test-hyphenated-caps"><span class="caps">M65<\/span>-A<\/p>/
  end
end
