class InvoicePdf < Prawn::Document

  def initialize(job, view)
    super(top_margin: 70)
    @job = job
    @view = view
    invoice_number
    line_items
  end

  def invoice_number
    text "Invoice for JB#{@job.id}", size: 30, style: :bold
  end

  def line_items
    move_down 20
    table line_item_rows do
      row(0).font_style = :bold
      self.row_colors = ["DDDDDD", "FFFFFF"]
    end
  end

  def line_item_rows
    [["Invoice#", "Date Done", "Job Desc", "Price"]] +

    [[@job.id, 'eheh', @job.jobdesc, price(@job.price)]]
  end

  def price(num)
    @view.number_to_currency(num)
  end
end