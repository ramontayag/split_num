require "spec_helper"

module SplitNum
  describe Splitter do

    describe "#split" do
      context "all fixed" do
        specify do
          result = SplitNum.split(90, { fixed: [30, 20, 40] })
          expected_result = { fixed: [30, 20, 40] }
          expect(result).to eq expected_result
        end
      end

      context "all percentage" do
        specify do
          result = SplitNum.split(200, { percent: [30, 40, 30] })
          expected_result = { percent: { 30 => 60, 40 => 80, 30 => 60 } }
          expect(result).to eq expected_result
        end
      end

      context "sum of fixed values is greater than number being split" do
        it "raises an error" do
          message = "can't set fixed split values with sum > number being split"
          expect { SplitNum.split(100, { fixed: [90, 20] }) }.
            to raise_error(ArgumentError, message)
        end
      end

      context "there is percentage split, and sum of fixed values is the same as the number being split" do
        it "raises an error" do
          message = "can't set fixed split values with sum == number being split when also splitting by percent"
          expect { SplitNum.split(100, { fixed: [90, 10], percent: [50, 50] } ) }.
            to raise_error(ArgumentError, message)
        end
      end

      context "percent values is greater than 100" do
        it "raises an error" do
          message = "can't set percent values with a sum greater than 100"
          expect { SplitNum.split(100, { percent: [50, 60] } ) }.
            to raise_error(ArgumentError, message)
        end
      end
    end

  end
end
