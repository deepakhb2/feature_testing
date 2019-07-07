require 'capybara/poltergeist'

Capybara.default_driver = :poltergeist

browser = Capybara.current_session
browser.visit 'http://rubymonstas.org'
puts browser.html


browser.click_on 'Ganz oben office'
puts browser.text
