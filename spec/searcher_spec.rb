$LOAD_PATH << File.join(File.dirname(__FILE__), '..')
require 'rspec/given'
require 'searcher'

describe Searcher do

  Given(:abe)            { { :description => "Abe's credential",
                             :username => 'abe',
                             :password => 'pa55w0rd' } }
  Given(:ben)            { { :description => "Ben's credential",
                             :username => 'ben',
                             :password => 'secr3t' } }
  Given(:abe_functional) { { :description => "Abe's functional credential",
                             :username => 'app',
                             :password => 'pa55w0rd',
                             :connection => 'ora123.example.com:1521/ora123',
                             :owner => 'abe' } }
  Given(:searcher) { Searcher.new( [ abe, ben, abe_functional ] ) }

  describe "#search_for" do

    context "when passed a string" do

      context "when there is an exact match with a value" do
        When(:result) { searcher.search_for('abe') }
        Then { result == [ abe, abe_functional ] }
      end

      context "when there is a match with a value" do
        When(:result) { searcher.search_for('be') }
        Then { result == [ abe, ben, abe_functional ] }
      end

      context "when there is no match" do
        When(:result) { searcher.search_for('zak') }
        Then { result == [ ] }
      end

    end

  end

end
