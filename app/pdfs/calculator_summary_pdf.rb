class CalculatorSummaryPdf < Prawn::Document
  include ActionView::Helpers::NumberHelper

  def initialize(calculator)
    super()

    @calculator = calculator

    pdf_title
    overview
    calculator_summary
    tax
    adjustable_income
    continue_to_pay
  end

  def pdf_title
    font_size(28) { text "My summary report" }
    move_down(10)
  end

  def overview
    font_size(20) { text "Overview" }
    move_down(10)

    text "You can get an income from your pension pot that’s adjustable. This means you get a regular income but can change it or take cash sums if you need to."

    text "You get 25% of your pot as a single, tax-free cash sum."
    text "The other 75% is invested to give you a regular, taxable income."
    text "You can adjust the income you take and when you take it."
    move_down(10)
  end

  def tax
    font_size(20) { text "Tax" }
    move_down(10)

    text "The income you get from the investment is taxable. Your provider will pay you the income with any tax due already taken off."
    text "You pay tax when you take money from your pot. This is because when you’re paying into your pension you get tax relief on your contributions."
    move_down(10)
  end

  def adjustable_income
    font_size(20) { text "How adjustable income works" }
    move_down(10)

    text "Your provider will offer you different investments with different risks. You pick the investments that are right for you and get a retirement income from them. You should think about how much you take out every year and how long your money needs to last."
    move_down(10)
  end

  def calculator_summary
    font_size(20) { text "Your summary" }
    move_down(10)

    text "Based on what you’ve told us, if you use your #{number_to_currency(@calculator.pot)} pension pot to take an adjustable income, you could get:"
    text "#{number_to_currency(@calculator.estimate[:tax_free_lump_sum])} tax free", style: :bold
    text "and"
    text "a monthly income of #{number_to_currency(@calculator.estimate[:monthly_income_until_life_expectancy])} until you’re #{number_to_currency(@calculator.estimate[:life_expectancy])}", style: :bold
    move_down(10)
  end

  def continue_to_pay
    font_size(20) { text "Continue to pay in" }
    move_down(10)

    text "If you have more than one pension pot, you can take an adjustable income from one and continue to pay into others. You may have to pay tax on contributions over £4,000 a year (known as the ‘money purchase annual allowance’ (MPAA))."
    move_down(10)
  end

  def financial_advice
    font_size(20) { text "Financial Advice" }
    move_down(10)

    text "If you’re interested in this option you might want to get financial advice first. A financial adviser can help you to compare adjustable income products and work out which is best for you."
    move_down(10)
  end

  def scams
    font_size(20) { text "Scams" }
    move_down(10)

    text "Beware of pension scams contacting you unexpectedly about an investment or business opportunity that you’ve not spoken to them about before. You could lose all your money and face tax of up to 55% and extra fees."
    move_down(10)
  end
end
