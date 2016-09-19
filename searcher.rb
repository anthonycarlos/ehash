class Searcher

  def initialize(ary)
    @ary = ary # An array of hashes
  end

  def search_for(search_str)
    matches = @ary.inject([]) do |memo, h|
      if h.values.any?{|v| v =~ Regexp.new(search_str, Regexp::IGNORECASE) }
        memo << h
      end
      memo
    end
    matches
  end

end
