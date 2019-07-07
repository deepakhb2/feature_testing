require 'feature_spec'

describe App do
  let(:links) { page.all('li').map { |li| li.all('a').map(&:text) } }

  it "listing members" do
    visit "/members"
    expect(links).to eq ['Anja', 'Edit', 'Remove', 'Maren', 'Edit', 'Remove']
  end
end
