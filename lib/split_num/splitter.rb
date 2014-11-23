module SplitNum
  class Splitter

    include Virtus.model

    attribute :num, Float
    attribute :config, Hash

    def initialize(num, config)
      super num: num, config: config
    end

    def split
      ensure_correct_config

      result = {}
      result[:fixed] = fixed_result if fixed_result
      result[:percent] = percent_result if percent_result
      result
    end

    private

    def ensure_correct_config
      ensure_fixed_sum_lteq_num
      ensure_existing_leftover_for_percent_split
      ensure_percent_sum_eq_100
    end

    def ensure_fixed_sum_lteq_num
      if fixed_sum > num
        fail ArgumentError, "can't set fixed split values with sum > number being split"
      end
    end

    def ensure_existing_leftover_for_percent_split
      if fixed_sum == num && !percent_config.nil?
        fail(
          ArgumentError,
          "can't set fixed split values with sum == number being split when also splitting by percent"
        )
      end
    end

    def ensure_percent_sum_eq_100
      if percent_sum > 100
        fail ArgumentError, "can't set percent values with a sum greater than 100"
      end
    end

    def fixed_result
      config[:fixed]
    end

    def percent_config
      config[:percent]
    end

    def share_for_percent
      @share_for_percent ||= self.num - fixed_sum
    end

    def fixed_sum
      @fixed_sum ||= fixed_result ? sum_of(fixed_result) || 0 : 0
    end

    def sum_of(a)
      [a].flatten.inject(0) { |sum, n| sum += n }
    end

    def percent_result
      return nil if percent_config.nil?
      percent_config.inject({}) do |result, percent|
        result[percent] = num * (percent / 100.0)
        result
      end
    end

    def percent_sum
      @percent_config ||= percent_config ? sum_of(percent_config) || 0 : 0
    end

  end
end
