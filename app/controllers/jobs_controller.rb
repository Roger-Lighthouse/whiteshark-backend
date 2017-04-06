require 'prawn'

class JobsController < ApplicationController
  def create
    puts 'Got Here IN CREATE ************'
    puts params.inspect
    job = Job.new
    job.client_id = params[:clientId]
    job.jobdesc = params[:jobDesc]
    if params[:jobPrice]!='TBD'
      job.price = params[:jobPrice]
    end
    job.sdate = params[:jobDate]
    if params[:jobTime] == '0'
      job.stime = 'Anytime'
    else
      job.stime = params[:jobTime]
    end
    job.notes = params[:jobDetails]
    job.save!

    getJobs(params[:clientId])
  end

  def destroy
    id = params[:id]
    job = Job.find id
    client_id = job.client_id
    job.destroy
    @upcoming_jobs = Job.where("client_id =? and sdate > ?", client_id, Date.today)
  end

  def update
    id = params[:id]
    job = Job.find id
    client = job.client
    prices = client.prices
    job.datebi = Date.today
    job.crew = getCrew
    job.recstatus = 'Receivable'
    if job.jobdesc == 'W3'
      job.price = getW3Price prices.w1
    elsif job.jobdesc == 'W4'
      job.price = getW4Price prices.w1
    elsif job.jobdesc == 'Painting'
      job.price = getPaintPrice
    end
    job.save!
    getJobs(job.client_id)
  end

  def edit
    id = params[:id]
    job = Job.find id
    job.sdate = params[:jobDate]
    job.stime = params[:jobTime]
    job.notes = params[:jobDetails]
    job.save
    #@upcoming_jobs = Job.where("client_id =? and sdate > ?", job.client_id, Date.today)
    getJobs(job.client.id)
   end

   def paid
     id = params[:id]
     job = Job.find id
     job.recstatus = 'PAID'
     job.save
     @completed_jobs = Job.where("client_id =? and datebi is not null", job.client_id).order('datebi desc')
   end

   def get_jobs
     cfid = params[:id]
     getJobs(cfid)
   end


  def show
    @job = Job.find(params[:id])
    respond_to do |format|

       format.html
       format.pdf do
         pdf = Prawn::Document.new
         pdf.text "Hello World"
         send_data pdf.render, filename: "Job Invoice_#{ @job.id }.pdf",
         type: "application/pdf",
         disposition: "inline"
       end
    end
  end

  def pdf_mailer
    @job = Job.find(params[:id])
    pdf = nil
    respond_to do |format|

       format.html
       format.pdf do
         pdf = InvoicePdf.new(@job, view_context)
         send_data pdf.render, filename: "Job Invoice_#{ @job.id }.pdf",
         type: "application/pdf"
         #disposition: "inline"
       end
    end
    PdfMailer.pdf_mailer(@job, pdf).deliver
  end


  private

   def getJobs(client_id)
     @completed_jobs = []
     @current_jobs = []
     @upcoming_jobs = []
     jobs = Job.where("client_id = ?", client_id).order('datebi desc, sdate')
     jobs.each do |job|
       if job.datebi != nil
         @completed_jobs<<job
       elsif job.sdate == Date.today
         @current_jobs<<job
       elsif job.sdate > Date.today
         @upcoming_jobs<<job
       end
     end
   end

   def getW3Price w1
     price = rand(2..3) * w1
   end

   def getW4Price w1
     price = rand(3..4) * w1
   end

   def getPaintPrice
     price = rand(1..4) * 1000
   end

   def getCrew
     x = rand(0..3)
     crews = ['Jason Burke', 'David Cummings', 'Joel Caprani', 'Noel Brown']
     return crews[x]
   end
end
