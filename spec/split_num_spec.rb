require "spec_helper"

describe SplitNum, ".split" do

  it "splits numbers correctly" do
    result = SplitNum.split(100, {
      fixed: 20,
      percent: [10, 50, 40],
    })

    expected_result = {
      fixed: 20,
      percent: {
        10 => 8,
        50 => 40,
        40 => 32,
      }
    }

    expect(result).to eq expected_result
  end

end
