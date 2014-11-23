require "virtus"
require "split_num/version"
require "split_num/splitter"

module SplitNum

  def self.split(num, config)
    Splitter.new(num, config).split
  end

end
