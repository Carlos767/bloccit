require 'rails_helper'

  describe Vote do
   describe "value validation" do

      it "allows -1" do
        value = Vote.create(value: -1)
        expect(value).to be_valid
      end

      it "allows +1" do
        value = Vote.create(value: +1)
        expect(value).to be_valid
      end

      it "prohibits other values" do
        value = Vote.create(value: 0)
        expect(value).to_not be_valid
      end

    end
end