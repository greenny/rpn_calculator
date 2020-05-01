require_relative '../lib/rpn_calculator'

RSpec.describe 'RPNCalculator' do
  let(:calc) { RPNCalculator.new }

  it 'calculates simple operation' do
    calc.call('5')
    calc.call('8')

    expect(calc.call('+')).to eq(13.0)
  end

  it 'uses result from previous calculations' do
    calc.call('-3')
    calc.call('-2')
    calc.call('*')
    calc.call('5')

    expect(calc.call('+')).to eq(11.0)
  end

  it 'support multiply operations at the end' do
    calc.call('5')
    calc.call('9')
    calc.call('1')
    calc.call('-')

    expect(calc.call('/')).to eq(0.625)
  end

  it 'ignores precision' do
    calc.call('0.1')
    calc.call('0.2')

    expect(calc.call('+')).to eq(0.3)
  end

  it 'does not allow dividing by zero' do
    calc.call('1')
    calc.call('0')

    expect(calc.call('/')).to eq('Dividing by zero not alowed')
  end

  it 'requires at least two numbers' do
    calc.call('1')

    expect(calc.call('/')).to eq('At least two number required')
  end
end
