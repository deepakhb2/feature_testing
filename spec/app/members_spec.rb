require 'feature_spec'

describe App do
  let(:links) { within('#members') { page.all('a').map(&:text) } }

  it "listing members" do
    visit "/members"
    expect(links).to eq ['Anja', 'Edit', 'Remove', 'Maren', 'Edit', 'Remove']
  end

  it "showing member details" do
    # go to the members list
    visit "/members"

    # click on the link
    click_on "Maren"

    # check the h1 tag
    expect(page).to have_css 'h1', text: 'Member: Maren'

    # check the name
    expect(page).to have_content 'Name: Maren'
  end

  it "creating a new member" do
    # go to the members list
    visit "/members"

    # click on the link
    click_on "New Member"

    # fill in the form
    fill_in "name", :with => "Monsta"

    # submit the form
    find('input[type=submit]').click

    # check the current path
    expect(page).to have_current_path "/members/Monsta"

    # check the message
    expect(page).to have_content 'Successfully saved the new member: Monsta.'

    # check the h1 tag
    expect(page).to have_css 'h1', text: 'Member: Monsta'
  end
end
