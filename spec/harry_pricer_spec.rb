require 'harry_pricer.rb'

describe HarryPricer do
  it { expect(subject).to_not eq nil }

  describe '#calculate' do
    subject { super().calculate shopping_bag }
    context 'no discounts' do
      let_context shopping_bag: [1, 0, 0, 0, 0] do
        it { is_expected.to eq 8 }
      end

      let_context shopping_bag: [3, 0, 0, 0, 0] do
        it { is_expected.to eq 24 }
      end
    end

    context '25% discount' do
      let_context shopping_bag: [1, 1, 1, 1, 1] do
        it { is_expected.to eq 30}
      end

      let_context shopping_bag: [2, 2, 2, 2, 2] do
        it { is_expected.to eq 60}
      end
    end

    context '20% discount' do
      let_context shopping_bag: [0, 1, 1, 1, 1] do
        it { is_expected.to eq 25.6}
      end

      let_context shopping_bag: [2, 2, 2, 2, 0] do
        it { is_expected.to eq 51.2}
      end
    end

    context '10% discount' do
      let_context shopping_bag: [0, 0, 1, 1, 1] do
        it { is_expected.to eq 21.6}
      end

      let_context shopping_bag: [2, 0, 2, 2, 0] do
        it { is_expected.to eq 43.2}
      end
    end

    context '5% discount' do
      let_context shopping_bag: [0, 0, 1, 0, 1] do
        it { is_expected.to eq 15.2}
      end

      let_context shopping_bag: [2, 0, 0, 2, 0] do
        it { is_expected.to eq 30.4}
      end
    end

    context 'integration' do
      let_context shopping_bag: [2, 2, 2, 1, 1] do
        it { is_expected.to eq 51.6}
      end
    end
  end
end
