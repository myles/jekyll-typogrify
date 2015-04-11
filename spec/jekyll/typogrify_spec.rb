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
end
