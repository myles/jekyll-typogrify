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
  
  it 'has a version number' do
    expect(Jekyll::Typogrify::VERSION).not_to be nil
  end
  
  it "wraps ampersands in span with the class amp" do
    expect(contents).to match /This <span class="amp">&amp;<\/span> That/
    expect(contents).to_not match /This & That/
  end
  
  it "wraps acronyms and initialism in span with the class caps" do
    expect(contents).to match /<span class="caps">SCUBA<\/span> is an acronym while <span class="caps">IBM<\/span> is an initialism/
    expect(contents).to_not match /SCUBA is an acronym while IBM is an initialism/
  end
  
  it "converts special characters (excluding HTML tags) to HTML entities" do
    expect(contents).to match /<strong>&copy;<\/strong>/
    expect(contents).to_not match /<strong>©<\/strong>/
    expect(contents).to_not match /&lt;strong&gt;&copy;&lt;\/strong&gt;/
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
    expect(contents).to_not match /🤖s Fighting 🐵s/
  end
end
