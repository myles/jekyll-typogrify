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
  end
end
