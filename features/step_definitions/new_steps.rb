DEFAULT_FILE_PATH = File.join(Dir.home, 'ehash.yml')
ALTERNATE_FILE_PATH = File.join('/tmp', 'ehash.yml')

Given(/^~\/ehash\.yml does not exist$/) do
  if File.exist?(DEFAULT_FILE_PATH)
    File.delete(DEFAULT_FILE_PATH)
  end
end

When(/^I call the new command without flags$/) do
  step %(I run `ehash new`)
end

Then(/^I create a data file at ~\/ehash\.yml$/) do
  expect(File.exist?(DEFAULT_FILE_PATH)).to be true
end

Given(/^\/tmp\/ehash\.yml does not exist$/) do
  if File.exist?(ALTERNATE_FILE_PATH)
    File.delete(ALTERNATE_FILE_PATH)
  end
end

When(/^I call the new command with the file flag$/) do
  step %(I run `ehash new -f /tmp/ehash.yml`)
end

Then(/^I create a data file at \/tmp\/ehash\.yml$/) do
  expect(File.exist?(ALTERNATE_FILE_PATH)).to be true
end

