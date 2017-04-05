class InvoicePdf < Prawn::Document

  def initialize(job, view)
    super(top_margin: 70)
    @job = job
    @view = view
    invoice_number
    line_items
    # image ='../images/WhiteShark.png'

     stroke_axis

     bounding_box([100, 300], :width =>300, :height =>200) do
       stroke_bounds
     end

  #   table [
  #          ["Standard image cell", {:image => image}],
  #          [":scale => 0.5", {:image => image, :scale => 0.5}],
  #          [":fit => [100, 200]", {:image => image, :fit => [100, 200]}],
  #          [":image_height => 50,
  #          :image_width => 100", {:image => image, :image_height => 50,
  #          :image_width => 100}],
  #          [":position => :center", {:image => image, :position => :center}],
  #          [":vposition => :center", {:image => image, :vposition => :center,
  #          :height => 200}]
  #         ], :width => bounds.width
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

    [[@job.id, 'eheh', @job.jobdesc, price(@job.price)]]  +

    [[@job.id, 'eheh', @job.jobdesc, price(@job.price)]] +

    [[{content: 'Sub Total', :colspan=>3, :font_style=> :bold}, price(@job.price)]]
  end

  def price(num)
    @view.number_to_currency(num)
  end
end